lvim.plugins = {
  -- { "artanikin/vim-synthwave84",
  --   config = function()
  --     vim.cmd("hi comment guifg=#8d90a3 guibg=none guisp=none gui=italic cterm=italic")
  --   end
  -- },
  -- { "lunarvim/darkplus.nvim" },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({})
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      -- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
      require("catppuccin").setup({
        flavour = "mocha",
        no_italic = true,
      })
      -- vim.api.nvim_command "colorscheme catppuccin"
    end
  },
  {
    "neanias/everforest-nvim",
    version = false,
    enabled = true,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        background = "hard",
        disable_italic_comments = true,
        italics = false,
        colours_override = function(palette)
          palette.bg1 = "#39454a"
        end
      })
    end,
  },

  { "tpope/vim-abolish" },
  -- { "tpope/vim-surround" },
  {
    "kylechui/nvim-surround",
    version = "*", -- use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },
  -- {
  --   "mattesgroeger/vim-bookmarks",
  --   enabled = true,
  --   config = function()
  --     vim.api.nvim_set_var("bookmark_no_default_key_mappings", 1)
  --     vim.api.nvim_set_var("bookmark_save_per_working_dir", 1)
  --     vim.api.nvim_set_var("bookmark_auto_save", 1)
  --     -- vim.api.nvim_set_var("bookmark_location_list", 1)
  --     vim.api.nvim_set_var("bookmark_auto_close", 1)
  --     vim.api.nvim_set_keymap("n", "<f3>", ":bookmarktoggle<cr>", { noremap = true, silent = true })
  --     vim.api.nvim_set_keymap("n", "<leader><f3>", ":bookmarkshowall<cr>", { noremap = true, silent = true })
  --   end
  -- },
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
    event = "bufread",
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
    event = "bufread",
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
    -- build = "yay -s glow"
  },
  -- {
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     modes = {
  --       char = {
  --         enabled = false
  --       }
  --     }
  --   },
  --   -- stylua: ignore
  --   keys = {
  --     { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "flash" },
  --     { "s",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "flash treesitter" },
  --     { "r",     mode = "o",               function() require("flash").remote() end,            desc = "remote flash" },
  --     { "r",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "treesitter search" },
  --     { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "toggle flash search" },
  --   }
  -- },
  {
    "crispgm/nvim-go",
    enabled = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "go" },
    config = function()
      require('go').setup({
        -- we only need the commands such as `:goaddtags`, `:goremovetags`
        auto_format = false,
        auto_lint = false,
      })
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "bufread",
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
    event = "bufread",
    config = function()
      require("lsp-rooter").setup()
    end,
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup({
        width = 120,             -- width of the floating window
        height = 25,             -- height of the floating window
        default_mappings = true, -- bind default mappings
        debug = false,           -- print debug information
        opacity = nil,           -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil     -- a function taking two arguments, a buffer and a window to be ran as a hook.
        -- you can use "default_mappings = true" setup option
        -- or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<cr>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<cr>")
        -- vim.cmd("nnoremap gp <cmd>lua require('goto-preview').close_all_win()<cr>")
      })
    end
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "bufread", "bufnew" },
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
        enable = true,   -- enable this plugin (can be enabled/disabled later via commands)
        throttle = true, -- throttles plugin updates (may improve performance)
        max_lines = 1,   -- how many lines the window should span. values <= 0 mean no limit.
        patterns = {     -- match patterns for ts nodes. these get wrapped to match at word boundaries.
          -- for all filetypes
          -- note that setting an entry here replaces all other patterns for this entry.
          -- by setting the 'default' entry below, you can control which nodes you want to
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
      search = {
        pattern = [[\b(KEYWORDS)(\(shenjun\))?:]],
      }
    }
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({})
    end
  },
  {
    "nvim-telescope/telescope-dap.nvim",
  },
  -- {
  --   "tomasky/bookmarks.nvim",
  --   event = "vimenter",
  --   config = function()
  --     require('bookmarks').setup({
  --       sign_priority = 8, --set bookmark sign priority to cover other sign
  --       save_file = vim.fn.expand "$home/.bookmarks", -- bookmarks save file path
  --       keywords = {
  --         ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `todo`
  --         ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `warn`
  --         ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `fix`
  --         ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `note`
  --       },
  --       on_attach = function(_)
  --         local bm = require "bookmarks"
  --         local map = vim.keymap.set
  --         map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
  --         map("n", "mi", bm.bookmark_ann)    -- add or edit mark annotation at current line
  --         map("n", "mc", bm.bookmark_clean)  -- clean all marks in local buffer
  --         map("n", "mn", bm.bookmark_next)   -- jump to next mark in local buffer
  --         map("n", "mp", bm.bookmark_prev)   -- jump to previous mark in local buffer
  --         map("n", "ml", bm.bookmark_list)   -- show marked file list in quickfix window
  --       end
  --     })
  --   end
  -- },
  {
    'crusj/bookmarks.nvim',
    branch = 'main',
    dependencies = { 'nvim-web-devicons' },
    event = "vimenter",
    config = function()
      require("bookmarks").setup({
        keymap = {
          toggle = "<leader><F3>",
          add = "<F3>",
          delete = "dd",
          delete_on_virt = "<F3>d", -- delete bookmark at virt text line
        }
      })
      require("telescope").load_extension("bookmarks")
    end
  },
  {
    'echasnovski/mini.splitjoin',
    version = '*',
    config = function()
      require('mini.splitjoin').setup()
    end
  },
  {
    'f-person/git-blame.nvim',
    config = function()
      require('gitblame').setup {
        enabled = false
      }
    end
  },
  {
    'echasnovski/mini.move',
    version = '*',
    config = function()
      if vim.loop.os_uname().sysname == "Darwin" then
        -- https://www.reddit.com/r/vim/comments/qwqygt/vim_seems_to_ignore_meta_key_mappings/
        require('mini.move').setup({
          mappings = {
            -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
            left = '˙',
            right = '¬',
            down = '∆',
            up = '˚',
            -- Move current line in Normal mode
            line_left = '˙',
            line_right = '¬',
            line_down = '∆',
            line_up = '˚',
          },
        })
      else
        require('mini.move').setup()
      end
    end
  },
  {
    'gen740/SmoothCursor.nvim',
    config = function()
      require('smoothcursor').setup({
        autostart = false,
        fancy = {
          head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil }, -- false to disable fancy head
          body = {
            { cursor = "󰝥", texthl = "SmoothCursorGreen" },
            { cursor = "󰝥", texthl = "SmoothCursorGreen" },
            { cursor = "●", texthl = "SmoothCursorGreen" },
            { cursor = "●", texthl = "SmoothCursorGreen" },
            { cursor = "•", texthl = "SmoothCursorGreen" },
            { cursor = ".", texthl = "SmoothCursorGreen" },
            { cursor = ".", texthl = "SmoothCursorGreen" },
          },
          tail = { cursor = nil, texthl = "SmoothCursor" } -- false to disable fancy tail
        },
      })
    end
  },
  {
    'chentoast/marks.nvim',
    config = function()
      require('marks').setup({})
    end
  },
  {
    'echasnovski/mini.bracketed',
    version = '*',
    config = function()
      require("mini.bracketed").setup({
        buffer     = { suffix = 'b', options = {} },
        comment    = { suffix = 'c', options = {} },
        conflict   = { suffix = 'x', options = {} },
        diagnostic = { suffix = 'd', options = {} },
        file       = { suffix = 'f', options = {} },
        indent     = { suffix = 'i', options = {} },
        jump       = { suffix = 'j', options = {} },
        location   = { suffix = 'l', options = {} },
        oldfile    = { suffix = 'o', options = {} },
        quickfix   = { suffix = 'q', options = {} },
        treesitter = { suffix = 't', options = {} },
        undo       = { suffix = '', options = {} },
        window     = { suffix = 'w', options = {} },
        yank       = { suffix = 'y', options = {} },
      })
    end
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "BufReadPost",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = true,
            segments = {
              { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
              { text = { "%s" },                  click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          })
        end,
      },
    },
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },

    init = function()
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.keymap.set("n", "zR", function()
        require("ufo").openAllFolds()
      end)
      vim.keymap.set("n", "zM", function()
        require("ufo").closeAllFolds()
      end)
    end,
  }
}
