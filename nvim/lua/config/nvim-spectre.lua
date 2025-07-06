vim.opt.splitbelow = true

spectre = require('spectre')
spectre.setup({
  open_cmd = 'new',
  mapping={
    ['toggle_line'] = {
        map = "<CR>",
        cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
        desc = "toggle current item"
    },
    ['enter_file'] = {
        map = "O",
        cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
        desc = "goto current file"
    },
    ['run_replace'] = {
        map = "<A-s>",
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        desc = "replace all"
    },
    ['run_current_replace'] = {
      map = "<leader><CR>",
      cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
      desc = "replace current line"
    },
  }
})
spectre.change_options('hidden')
