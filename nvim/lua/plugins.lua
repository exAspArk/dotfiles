return {
  -- Text editing --------------------------------------------------------------

  { -- syntax highlight
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufRead',
    config = function() require("config.nvim-treesitter") end,
  },
  { -- selection expansion
    'terryma/vim-expand-region',
    event = 'BufRead',
    keys = { '+', '-' },
  },
  { -- autocomplete and LSP: coc-solargraph, coc-tsserver
    'neoclide/coc.nvim',
    branch = 'release',
    event = 'InsertEnter',
    keys = { '<TAB>', '<S-TAB>', '<CR>', 'gd', 'gy', 'gi', 'gr', 'K', 're', '<leader>n' },
    config = function()
      -- Make <CR> to accept selected completion item or notify coc.nvim to format. <C-g>u breaks current undo, please make your own choice
      vim.keymap.set("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], {silent = true, noremap = true, expr = true, replace_keycodes = false})

      -- GoTo code navigation
      vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
      vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
      vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
      vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})
      -- Use K to show documentation in preview window
      vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})
      -- Symbol renaming
      vim.keymap.set("n", "re", "<Plug>(coc-rename)", {silent = true})
      -- Next diagnostic
      vim.keymap.set("n", "<leader>n", "<Plug>(coc-diagnostic-next)", {silent = true})
      require("config.coc")
    end,
  },
  { -- smart autocompletion
    'github/copilot.vim',
  },
  { -- lint
    'dense-analysis/ale',
    event = 'InsertEnter',
    config = function() require("config.ale") end,
  },
  { -- bracket actions
    'tpope/vim-surround',
    event = 'BufRead',
  },
  { -- auto-close brackets
    'Raimondi/delimitMate',
    event = 'InsertEnter',
  },
  { -- auto-close HTML tags
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    config = function() require('nvim-ts-autotag').setup() end,
  },
  { -- multi-cursor selection
    'mg979/vim-visual-multi',
    event = 'BufRead',
    init = function()
      vim.g.VM_maps = { -- [ and ] for previous and next, q for skipping
        ["Find Under"] = "<A-n>",
        ["Find Subword Under"] = "<A-n>",
      }
    end,
  },
  { -- coerce camelCase / snake_case
    'tpope/vim-abolish',
    keys = { 'crs', 'crm', 'crc', 'cru', 'cr-', 'cr.' },
  },

  -- Navigation ----------------------------------------------------------------

  { -- find and replace
    'windwp/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = { '<leader>s' },
    config = function()
      vim.keymap.set('n', '<leader>s', function() require('spectre').open_visual({ select_word = true }) end, { noremap = true })
      require("config.nvim-spectre")
    end,
  },
  { -- fuzzy search
    'ibhagwan/fzf-lua',
    keys = { '<leader>p' },
    config = function()
      vim.keymap.set('n', '<leader>p', function()
        require('fzf-lua').files({
          winopts = { preview = { hidden = 'hidden', layout = 'vertical' } },
          fd_opts = [[
            --type file --follow --hidden --ignore-case --no-ignore --strip-cwd-prefix \
            --exclude .deliver \
            --exclude .devbox \
            --exclude .git \
            --exclude .next \
            --exclude .terraform \
            --exclude .venv \
            --exclude _build \
            --exclude build \
            --exclude deps \
            --exclude dist \
            --exclude log \
            --exclude node_modules \
            --exclude temp \
            --exclude tmp
          ]],
        })
      end, { noremap = true })
    end,
  },
  { -- text search
    'dyng/ctrlsf.vim',
    cmd = 'CtrlSF',
    keys = { '<leader>f', '<leader>F' },
    config = function()
      vim.keymap.set('n', '<leader>f', '_:CtrlSF -ignoredir spec<Space>', { noremap = true })
      vim.keymap.set('n', '<leader>F', '_:CtrlSF<Space>', { noremap = true })
      require("config.ctrlsf")
    end,
  },
  { -- file tree
    'nvim-tree/nvim-tree.lua',
    keys = { '<leader><leader>', '<leader>c' },
    config = function()
      vim.keymap.set('n', '<leader><leader>', ':NvimTreeToggle<CR>', { noremap = true })
      vim.keymap.set('n', '<leader>c', ':NvimTreeFindFile<CR>', { noremap = true })
      require("config.nvim-tree")
    end,
  },
  { -- open file with line and column number
    'kopischke/vim-fetch',
  },

  -- Themes --------------------------------------------------------------------

  { -- buffer tabs
    'akinsho/bufferline.nvim',
    event = 'BufRead',
    config = function() require("config.bufferline") end,
  },
  { -- status line
    'nvim-lualine/lualine.nvim',
    event = 'BufRead',
    config = function() require("config.lualine") end,
  },
  { -- indent columns
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = function() require('config.indent-blankline') end,
  },
  { -- show colours in the code
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    config = function() require('colorizer').setup() end,
  },
  { -- highlight matching tags
    'andymass/vim-matchup',
  },

  -- Files ---------------------------------------------------------------------

  { -- UNIX shell commands (mkdir, rename, etc.)
    'tpope/vim-eunuch',
    cmd = { 'Move', 'Rename', 'Remove', 'Mkdir', 'SudoWrite' },
  },

  -- Git -----------------------------------------------------------------------

  { -- gutter signs
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    config = function()
      local gitsigns = require('gitsigns')
      gitsigns.setup({
        on_attach = function(bufnr)
          -- Navigation
          vim.keymap.set('n', '<leader>j', function()
            if vim.wo.diff then vim.cmd.normal({'<leader>j', bang = true}) else gitsigns.nav_hunk('next') end
          end, { buffer = bufnr })
          vim.keymap.set('n', '<leader>k', function()
            if vim.wo.diff then vim.cmd.normal({'<leader>k', bang = true}) else gitsigns.nav_hunk('prev') end
          end, { buffer = bufnr })
          -- Actions
          vim.keymap.set('n', '<leader>u', gitsigns.reset_hunk, { buffer = bufnr })
          vim.keymap.set('n', '<leader>U', gitsigns.reset_buffer, { buffer = bufnr })
          vim.keymap.set('n', '<leader>d', gitsigns.diffthis, { buffer = bufnr })
        end
      })
    end,
  },
  { -- git commands
    'tpope/vim-fugitive',
    cmd = { 'G' },
  },

  -- Markdown ------------------------------------------------------------------

  {
    'instant-markdown/vim-instant-markdown',
    ft = { "markdown" },
    keys = { '<leader>i' },
    build = 'pnpm -g install instant-markdown-d',
    init = function() vim.g.instant_markdown_autostart = 0 end,
    config = function()
      vim.keymap.set('n', '<leader>i', function()
        vim.cmd([[
          try
            InstantMarkdownStop
          catch
          finally
            InstantMarkdownPreview
          endtry
        ]])
      end, { noremap = true })
    end,
  },

  -- Ruby ----------------------------------------------------------------------

  { -- auto 'end'
    'RRethy/nvim-treesitter-endwise',
    ft = { 'ruby', 'elixir', 'lua', 'vim', 'bash' },
  },
}
