require("nvim-treesitter.configs").setup({
  ensure_installed = {
    'bash',
    'css',
    'go',
    'html',
    'javascript',
    'json',
    'lua',
    'make',
    'markdown',
    'nix',
    'python',
    'ruby',
    'terraform',
    'typescript',
    'yaml',
    'terraform',
  },
  sync_install = false,
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
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
