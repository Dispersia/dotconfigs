vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    local overseer = require("overseer")
    overseer.setup({
      task_list = {
        direction = "right",
        min_width = 40,
        max_width = 60,
        render = function(task)
          local render = require("overseer.render")
          local ret = { render.status_and_name(task) }
          vim.list_extend(ret, render.output_lines(task, { num_lines = 10 }))
          return ret
        end,
      },
      component_aliases = {
        default = {
          "on_exit_set_status",
          "on_complete_notify",
          { "on_complete_dispose", require_view = { "SUCCESS", "FAILURE" } },
          { "unique", replace = true },
        },
      },
    })

    vim.keymap.set("n", "<leader>r", function()
      overseer.run_task({}, function()
        overseer.open()
      end)
    end)
  end,
});
