-- don't run linters on opening a file
-- https://github.com/dense-analysis/ale/blob/master/supported-tools.md
vim.g.ale_lint_on_save = 1
vim.g.ale_lint_on_enter = 1
vim.g.ale_lint_on_insert_leave = 1
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_virtualtext_cursor = 'disable'
vim.g.ale_linters = {
  ruby = {'sorbet'},
  typescript = {'biome', 'eslint'},
  typescriptreact = {'biome', 'eslint'},
  javascript = {'biome', 'eslint'},
  go = {'staticcheck'},
  java = {},
  terraform = {'terraform'},
}
vim.g.ale_fixers = {
  typescript = {'biome'},
  typescriptreact = {'biome'},
  javascript = {'biome'},
  go = {'gofmt'},
  terraform = {'terraform'},
}
vim.g.ale_fix_on_save = 1
