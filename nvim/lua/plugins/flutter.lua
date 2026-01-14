local M = {}

local flutter_job_id = 0

local function on_flutter_event(_, data, event)
  if event == "stdout" then
    if data then
      local output = table.concat(data, "\n")
      if output:match("Reloaded") then
        vim.notify("Hot reload complete", vim.log.levels.INFO)
      end
    end
  elseif event == "exit" then
    vim.notify("Flutter exited", vim.log.levels.INFO)
    flutter_job_id = 0
  end
end

function M.hot_reload()
  if flutter_job_id ~= 0 then
    vim.fn.system("kill -USR1 $(cat /tmp/flutter.pid)")
  else
    vim.notify("Flutter is not running", vim.log.levels.WARN)
  end
end

function M.hot_restart()
  if flutter_job_id ~= 0 then
    vim.fn.system("kill -USR2 $(cat /tmp/flutter.pid)")
  else
    vim.notify("Flutter is not running", vim.log.levels.WARN)
  end
end

local function start_with_device(device_id)
  vim.notify("Starting Flutter" .. (device_id and (" on " .. device_id) or ""), vim.log.levels.INFO)
  local cmd = "flutter run --pid-file /tmp/flutter.pid"
  if device_id then
    cmd = cmd .. " -d " .. device_id
  end
  flutter_job_id = vim.fn.jobstart({ "bash", "-c", cmd }, {
    on_stdout = on_flutter_event,
    on_stderr = on_flutter_event,
    on_exit = on_flutter_event,
  })
end

function M.start()
  if flutter_job_id ~= 0 then
    vim.notify("Flutter already running", vim.log.levels.WARN)
    return
  end

  local output = vim.fn.system("flutter devices --machine")
  local ok, devices = pcall(vim.json.decode, output)

  if not ok or not devices or #devices == 0 then
    vim.notify("No devices found", vim.log.levels.ERROR)
    return
  end

  if #devices == 1 then
    start_with_device(devices[1].id)
    return
  end

  vim.ui.select(devices, {
    prompt = "Select Flutter device:",
    format_item = function(device)
      return string.format("%s (%s) - %s", device.name, device.id, device.targetPlatform or device.platform)
    end,
  }, function(selected)
    if selected then
      start_with_device(selected.id)
    end
  end)
end

function M.stop()
  if flutter_job_id ~= 0 then
    vim.fn.jobstop(flutter_job_id)
    flutter_job_id = 0
    vim.notify("Flutter stopped", vim.log.levels.INFO)
  else
    vim.notify("Flutter is not running", vim.log.levels.WARN)
  end
end

vim.api.nvim_create_user_command("FlutterRun", M.start, {})
vim.api.nvim_create_user_command("FlutterStopRun", M.stop, {})
vim.api.nvim_create_user_command("FlutterHotReload", M.hot_reload, {})
vim.api.nvim_create_user_command("FlutterRestart", M.hot_restart, {})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.dart",
  callback = function()
    if flutter_job_id ~= 0 then
      M.hot_reload()
    end
  end,
  desc = "Flutter hot reload on save",
})

return M
