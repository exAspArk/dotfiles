vim.g.ctrlsf_case_sensitive = 'no'
vim.g.ctrlsf_position = 'bottom'
vim.g.ctrlsf_ignore_dir = { '.devbox', '.git', '.next', '.venv', 'node_modules', 'build', '_build', '.output', 'deps', 'dist', 'tmp', 'temp', 'log', 'sorbet' }
if vim.fn.executable('rg') then
  vim.g.ctrlsf_ackprg = 'rg' -- use ripgrep
  vim.g.ctrlsf_extra_backend_args = {
    rg = '--hidden --no-ignore --glob !tags --glob !.pry_history --glob !tsconfig.tsbuildinfo'
  }
end
