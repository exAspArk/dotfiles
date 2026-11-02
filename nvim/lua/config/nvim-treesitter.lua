local treesitter = require('nvim-treesitter')

treesitter.setup({
  -- Prefer current parsers over binaries left in the legacy plugin directory.
  install_dir = vim.fn.stdpath('data') .. '/site',
})
treesitter.install({
  'bash',
  'css',
  'dockerfile',
  'elixir',
  'embedded_template', -- erb
  'go',
  'hcl',
  'html',
  'javascript',
  'json',
  'lua',
  'make',
  'markdown',
  'markdown_inline',
  'nix',
  'python',
  'ruby',
  'sql',
  'terraform',
  'tsx',
  'typescript',
  'yaml',
})

-- The main branch installs parsers but does not enable highlighting or indentation.
-- Enable them per filetype when a parser (and indentation query) is available.
-- https://github.com/nvim-treesitter/nvim-treesitter#supported-features
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('TreesitterFeatures', { clear = true }),
  callback = function(args)
    local parser = vim.treesitter.get_parser(args.buf)
    if not parser then return end

    vim.treesitter.start(args.buf)
    if vim.treesitter.query.get(parser:lang(), 'indents') then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
