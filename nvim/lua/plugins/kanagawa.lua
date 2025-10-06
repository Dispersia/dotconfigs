require("kanagawa").setup({
  theme = "dragon",
  background = { dark = "dragon" },
	colors = {
		palette = {
			dragonBlack4 = "#181616",
		},
	},
  overrides = function(colors)
	  local theme = colors.theme
		return {
			Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency,,
			PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
			PmenuSbar = { bg = theme.ui.bg_m1 },
			PmenuThumb = { bg = "#C0A36E" },
			BlinkCmpMenuBorder = { fg = "", bg = "" },

			NormalFloat = { bg = "none" },
			FloatBorder = { bg = "none" },
			FloatTitle = { bg = "none" },
			CursorLineNr = { fg = colors.palette.sakuraPink, bg = "NONE" },
		}
	end,
})
