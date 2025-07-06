-- disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local function custom_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'C',   api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', '?',   api.tree.toggle_help,         opts('Help'))
  vim.keymap.set("n", "cp",  api.fs.copy.relative_path,    opts("Copy Relative Path"))
  vim.keymap.set("n", "cfp", api.fs.copy.absolute_path,    opts("Copy Absolute Path"))
end

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
  on_attach = custom_on_attach,
})
