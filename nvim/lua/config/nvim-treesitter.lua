require("nvim-treesitter.configs").setup({
  ensure_installed = {
    'bash',
    'css',
    'html',
    'javascript',
    'json',
    'lua',
    'make',
    'markdown',
    'nix',
    'ruby',
    'terraform',
    'typescript',
    'yaml',
  },
  sync_install = false,
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = "+",
      node_decremental = "-",
    },
  },
  indent = {
    enable = true,
  },
  matchup = { -- plugin
    enable = true,
  },
  endwise = { -- plugin
    enable = true,
  },
})
