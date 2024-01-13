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
vim.opt.foldcolumn = '1' -- '0' is not bad
vim.opt.foldmethod = "indent"
vim.opt.foldenable = true

vim.opt.timeoutlen = 350
vim.opt.spelllang = 'en'
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
-- if vim.loop.os_uname().sysname == "Darwin" then
--   -- https://www.reddit.com/r/vim/comments/qwqygt/vim_seems_to_ignore_meta_key_mappings/
--   vim.api.nvim_set_keymap('n', '∆', ":m .+1<CR>==", { noremap = true, silent = true })
--   vim.api.nvim_set_keymap('n', '˚', ":m .-2<CR>==", { noremap = true, silent = true })
--   vim.api.nvim_set_keymap('v', '∆', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
--   vim.api.nvim_set_keymap('v', '˚', ":m '<-1<CR>gv=gv", { noremap = true, silent = true })
-- else
--   vim.api.nvim_set_keymap('n', '<A-j>', ":m .+1<CR>==", { noremap = true, silent = true })
--   vim.api.nvim_set_keymap('n', '<A-k>', ":m .-2<CR>==", { noremap = true, silent = true })
--   vim.api.nvim_set_keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
--   vim.api.nvim_set_keymap('v', '<A-k>', ":m '<-1<CR>gv=gv", { noremap = true, silent = true })
-- end

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
lvim.builtin.dap.ui.config.expand_lines = false
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
lvim.builtin.telescope.on_config_done = function(_)
  require('telescope').load_extension('dap')
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
--   cmd = { 'gopls', '-logfile=/tmp/gopls.log', '-rpc.trace' },
-- })

-- Additional Plugins
-- all user pulgins config are move to user/pulgins.lua
require("user.plugins")

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
