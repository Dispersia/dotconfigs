require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  filters = { dotfiles = false }
})
