require("lualine").setup({
	options = {
		icons_enabled = false,
		theme = "tokyonight",
		section_separators = "",
		component_separators = "",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		-- lualine_c = { "diff", "%=", { "filename", path = 3, shorting_target = 10 } },
		lualine_c = { "diff", { "filename", path = 2, shorting_target = 10 } },
		lualine_x = { "diagnostics", "fileformat", "filetype" },
		lualine_y = {},
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "%=", { "filename", path = 3 } },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
})
