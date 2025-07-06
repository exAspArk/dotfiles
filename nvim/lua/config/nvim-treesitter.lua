require("nvim-treesitter.configs").setup({
  ensure_installed = {
    'bash',
    'css',
    'dockerfile',
    'elixir',
    'embedded_template', -- erb
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
    'sql',
    'terraform',
    'terraform',
    'tsx',
    'typescript',
    'yaml',
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
