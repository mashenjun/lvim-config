--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "everforest"

-- custom settings
lvim.transparent_window = true
vim.opt.relativenumber = false
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.timeoutlen = 350
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
-- close quickfix window
lvim.keys.normal_mode["<leader>C"] = ":ccl<CR>"
-- switch between buffers
lvim.keys.normal_mode["H"] = ":bp<CR>"
lvim.keys.normal_mode["L"] = ":bn<CR>"
-- exit insert mode
lvim.keys.insert_mode["jk"] = "<Esc>"
lvim.keys.insert_mode["kj"] = "<Esc>"
-- helper keybinding
vim.api.nvim_set_keymap('n', 'oo', 'o<Esc>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'OO', 'O<Esc>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'p', '"_dP', { noremap = true, silent = true })
-- move lines with selected
-- vim.api.nvim_set_keymap('n', '<C-j>', ":m .+1<CR>==", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-k>', ":m .-2<CR>==", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<C-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<C-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
if vim.loop.os_uname().sysname == "Darwin" then
  -- https://www.reddit.com/r/vim/comments/qwqygt/vim_seems_to_ignore_meta_key_mappings/
  vim.api.nvim_set_keymap('n', '∆', ":m .+1<CR>==", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '˚', ":m .-2<CR>==", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '∆', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '˚', ":m '<-1<CR>gv=gv", { noremap = true, silent = true })
else
  vim.api.nvim_set_keymap('n', '<A-j>', ":m .+1<CR>==", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<A-k>', ":m .-2<CR>==", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<A-k>', ":m '<-1<CR>gv=gv", { noremap = true, silent = true })
end

-- for buildin plugin setting
lvim.builtin.treesitter.matchup.enable = true

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }
lvim.builtin.which_key.setup.triggers_blacklist = {
  n = { "o", "O" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.notify.active = true
-- lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.view.side = "left"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
  "go",
  "vim",
  "vimdoc",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.which_key.active = true
lvim.builtin.dap.on_config_done = function(dap)
  dap.adapters.go = {
    type = 'server',
    port = '${port}',
    executable = {
      command = 'dlv',
      args = { 'dap', '-l', '127.0.0.1:${port}' },
    }
  }
  require('dap.ext.vscode').load_launchjs(nil, {})
end

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })
-- vim.lsp.set_log_level("debug")

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }
--

-- enable gopls serverside logging.
-- require("lvim.lsp.manager").setup("gopls", {
-- 	cmd = {'gopls', '-logfile=/tmp/gopls.log', '-rpc.trace'},
-- })

-- Additional Plugins
lvim.plugins = {
  -- { "artanikin/vim-synthwave84",
  --   config = function()
  --     vim.cmd("hi Comment guifg=#8d90a3 guibg=NONE guisp=NONE gui=italic cterm=italic")
  --   end
  -- },
  -- { "LunarVim/darkplus.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
      -- require("catppuccin").setup()
      -- vim.api.nvim_command "colorscheme catppuccin"
    end
  },
  {
    "neanias/everforest-nvim",
    version = false,
    enabled = true,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        background = "soft",
      })
    end,
  },

  { "tpope/vim-abolish" },
  -- { "tpope/vim-surround" },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },
  {
    "MattesGroeger/vim-bookmarks",
    enabled = true,
    config = function()
      vim.api.nvim_set_var("bookmark_no_default_key_mappings", 1)
      vim.api.nvim_set_var("bookmark_save_per_working_dir", 1)
      vim.api.nvim_set_var("bookmark_auto_save", 1)
      -- vim.api.nvim_set_var("bookmark_location_list", 1)
      vim.api.nvim_set_var("bookmark_auto_close", 1)
      vim.api.nvim_set_keymap("n", "<F3>", ":BookmarkToggle<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader><F3>", ":BookmarkShowAll<CR>", { noremap = true, silent = true })
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        buftype_exclude = { 'terminal', 'nofile' },
        filetype_exclude = { 'packer', 'dashboard', 'floatline', 'help' },
        show_current_context = true,
      }
    end
  },
  { "kana/vim-textobj-user" },
  {
    "kana/vim-textobj-entire",
    dependencies = { "kana/vim-textobj-user" }
  },
  {
    "andymass/vim-matchup",
    commit = "156367e",
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  { "tpope/vim-repeat" },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  {
    "npxbr/glow.nvim",
    ft = { "markdown" }
    -- build = "yay -S glow"
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        char = {
          enabled = false
        }
      }
    },
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    }
  },
  {
    "crispgm/nvim-go",
    enabled = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "go" },
    config = function()
      require('go').setup({
        -- we only need the commands such as `:GoAddTags`, `:GoRemoveTags`
        auto_format = false,
        auto_lint = false,
      })
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".setup({
        hint_enable = true,
        floating_window = false,
        hint_prefix = " ",
        -- hint_prefix = "󰍉 ",
      })
    end,
  },
  {
    "ahmedkhalf/lsp-rooter.nvim",
    event = "BufRead",
    config = function()
      require("lsp-rooter").setup()
    end,
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup({
        width = 120,             -- Width of the floating window
        height = 25,             -- Height of the floating window
        default_mappings = true, -- Bind default mappings
        debug = false,           -- Print debug information
        opacity = nil,           -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil     -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      })
    end
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        auto_resize_height = true,
        preview = {
          win_height = 20,
          win_vheight = 15,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 1,   -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = {     -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end
  },
  {
    "folke/todo-comments.nvim",
    enabled = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = false,
      highlight = {
        before = "",  -- "fg" or "bg" or empty
        keyword = "", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "",
      },
    }
  }
  --     {
  --       "folke/trouble.nvim",
  --       cmd = "TroubleToggle",
  --     },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufWinEnter", {
--   pattern = { "*.ts", "*.go" },
--   -- enable wrap mode for json files only
--   command = "setlocal ts=4 sw=4",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

-- Additional Operations
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/lvim/my-snippets" } })
