return {
  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", "<cmd>ene <CR>"),
        dashboard.button("SPC f f", "󰈞  Find file"),
        dashboard.button("SPC f h", "󰊄  Recently opened files"),
      }

      alpha.setup(dashboard.opts)
    end,
  },
}
