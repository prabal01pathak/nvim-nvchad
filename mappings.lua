---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- toggle minimap
    ["<leader>mm"] = { "<cmd> MinimapToggle <CR>", "Toggle Minimap" },
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
  },
}

M.projects = {
  n = {
    ["<leader>fp"] = { "<cmd> ProjectMgr<CR>", "Open Projects" },
  },
}

M.harpoon = {
  plugin = true,
  n = {
    ["<C-b>"] = {
      '<cmd>lua require("harpoon.mark").add_file() <CR>',
      "Add File in the harpoon menu",
    },
    ["<C-e>"] = {
      '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>',
      "Toggle Harpoon menu",
    },
    ["<C-t>"] = {
      function()
        require("harpoon.ui").nav_file(1)
      end,
      "Select First file in the harpoon",
    },
    ["<C-h>"] = {
      function()
        require("harpoon.ui").nav_file(2)
      end,
      "Select Second file in the harpoon",
    },
    ["<C-j>"] = {
      function()
        require("harpoon.ui").nav_file(3)
      end,
      "Select Third file in the harpoon",
    },
    ["<C-k>"] = {
      function()
        require("harpoon.ui").nav_file(4)
      end,
      "Select Fourth file in the harpoon",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dx"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    },
  },
}

-- more keybinds!
-- M.lazygit = {
--   plugin = true,
--   n = {
--     ["<leader>l"] = {
--       "<cmd> LazyGit<CR>",
--       "Open lazygit",
--     },
--   },
-- }

return M
