local bufferline = require("bufferline")
bufferline.setup({
  options = {
    style_preset = bufferline.style_preset.no_italic,
    indicator = { style = 'none' },
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
  }
})
