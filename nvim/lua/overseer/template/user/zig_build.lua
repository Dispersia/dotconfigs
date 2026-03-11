return {
  generator = function(_, cb)
    local steps = {}

    local handle = io.popen("zig build --help 2>/dev/null")
    if handle then
      local in_steps = false
      for line in handle:lines() do
        if line:match("^Steps:") then
          in_steps = true
        elseif in_steps then
          local step = line:match("^%s+(%S+)")
          if step then
            table.insert(steps, step)
          else
            break
          end
        end
      end
      handle:close()
    end

    local templates = {}
    for _, step in ipairs(steps) do
      table.insert(templates, {
        name = "zig build " .. step,
        builder = function()
          return {
            cmd = { "zig" },
            args = { "build", step },
            components = { "default" },
          }
        end,
      })
    end

    cb(templates)
  end,
  condition = {
    filetype = { "zig" },
  },
}
