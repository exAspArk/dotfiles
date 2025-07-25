-- don't run linters on opening a file
-- https://github.com/dense-analysis/ale/blob/master/supported-tools.md
vim.g.ale_lint_on_save = 1
vim.g.ale_lint_on_enter = 1
vim.g.ale_lint_on_insert_leave = 1
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_virtualtext_cursor = 'disable'
vim.g.ale_linters = {
  ruby = {'sorbet'},
  typescript = {'eslint'},
  typescriptreact = {'eslint'},
  javascript = {'eslint'},
  go = {'staticcheck'},
  java = {},
}
vim.g.ale_fixers = {
  typescript = {'prettier'},
  javascript = {'prettier'},
  go = {'gofmt'},
}
vim.g.ale_fix_on_save = 1
