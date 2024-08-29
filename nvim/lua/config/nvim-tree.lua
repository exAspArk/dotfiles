-- disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("nvim-tree").setup({
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false,
        modified = true,
        hidden = false,
        diagnostics = false,
        bookmarks = false,
      },
    },
  },
  filters = {
    enable = false,
  },
})
