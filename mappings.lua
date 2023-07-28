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

return M
