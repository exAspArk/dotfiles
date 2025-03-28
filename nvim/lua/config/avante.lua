vim.api.nvim_set_hl(0, "MyAvanteConflictCurrent", {
  bg = "#ebf5ff",
})

vim.api.nvim_set_hl(0, "MyAvanteConflictIncoming", {
  bg = "#dfeddf",
})

-- https://github.com/yetone/avante.nvim/blob/main/lua/avante/config.lua
require("avante").setup({
  provider = "claude",
  claude = {
    endpoint = "https://api.anthropic.com",
    model = "claude-3-7-sonnet-20250219",
    timeout = 30000, -- Timeout in milliseconds
    temperature = 0,
    max_tokens = 4096,
  },
  hints = { enabled = false },
  windows = {
    position = "right",
    width = 50,
    sidebar_header = {
      align = "left",
    },
    ask = {
      start_insert = false,
    },
  },
  highlights = {
    diff = {
      current = "MyAvanteConflictCurrent",
      incoming = "MyAvanteConflictIncoming",
    },
  },
  mappings = {
    diff = {
      all_theirs = "A",
      theirs = "a",
      ours = "d",
    },
    toggle = {
      default = "<leader>aa", -- Toggle with <leader>aa instead of ask
    },
    sidebar = {
      add_file = "a",
      switch_windows = "<C-j>",
      reverse_switch_windows = "<C-k>",
    },
    files = {
      add_current = "<leader>ac", -- Add current buffer to selected files
    },
  },
})
