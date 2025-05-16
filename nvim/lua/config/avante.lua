vim.api.nvim_set_hl(0, "MyAvanteConflictCurrent", {
  bg = "#ebf5ff",
})

vim.api.nvim_set_hl(0, "MyAvanteConflictIncoming", {
  bg = "#dfeddf",
})

-- https://github.com/yetone/avante.nvim/blob/main/lua/avante/config.lua
require("avante").setup({
  provider = "openai",
  openai = {
    endpoint = "https://api.openai.com/v1",
    model = "gpt-4.1",
    timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
    temperature = 0,
    max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
    reasoning_effort = "high", -- low|medium|high, only used for reasoning models
  },
  claude = {
    endpoint = "https://api.anthropic.com",
    model = "claude-3-7-sonnet-20250219", -- ANTHROPIC_API_KEY is set as an env var
    timeout = 30000, -- Timeout in milliseconds
    temperature = 0,
    max_tokens = 4096,
  },
  gemini = {
    endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
    model = "gemini-2.5-pro-exp-03-25", -- GEMINI_API_KEY is set as an env var
    timeout = 30000, -- Timeout in milliseconds
    temperature = 0,
    max_tokens = 8192,
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
  selector = {
    provider = "fzf_lua",
    exclude_auto_select = { "NvimTree" },
  },
  system_prompt = [[
    Important rules:
      - Never add or remove code comments unless I ask for it.
  ]]
})
