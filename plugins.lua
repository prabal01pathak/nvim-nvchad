local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
   {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
    {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
    {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
    -- config = function()  
    --     require('nvim-tree').setup({view = {relativenumber = true}})
    -- end
  },

    {
        "ThePrimeagen/harpoon",
        lazy = false,
        config = function() 
            print("Loaded the harpoon hahahahahaha :)")
            require "custom.configs.harpoon"
        end
    },
    {
        "gen740/SmoothCursor.nvim",
        lazy = false,
        config = function()
            require('smoothcursor').setup()
            require "custom.configs.smoothcursor"
        end
    },
    {
        "folke/zen-mode.nvim",
        lazy = false,
        config = function()
            require "custom.configs.zenmode"
        end,
    },
    {
        "github/copilot.vim",
        lazy = false,
    },
    {
        "wfxr/minimap.vim",
        lazy = false,
    },
    {
        "tpope/vim-fugitive",
        lazy = false,
        config = function() 
            require("custom.configs.fugitive")
        end
    },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "linux-cultist/venv-selector.nvim",
    event = "VeryLazy",
    config = true,
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "sharkdp/fd" },
    keys = {{
		"<leader>vs", "<cmd>:VenvSelect<cr>",
		-- key mapping for directly retrieve from cache. You may set autocmd if you prefer the no hand approach
		"<leader>vs", "<cmd>:VenvSelectCached<cr>"
	}}
  },


  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
