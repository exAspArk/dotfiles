require('lualine').setup({
  options = {
    icons_enabled = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diagnostics'},
    lualine_c = {{ 'filename', path = 1 }},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  extensions = {'fugitive', 'fzf', 'lazy', 'nvim-tree'}
})
