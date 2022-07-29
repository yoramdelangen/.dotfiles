local telescope = require("telescope")
local fzf = {
	fuzzy = true, -- false will only do exact matching
	override_generic_sorter = true, -- override the generic sorter
	override_file_sorter = true, -- override the file sorter
	case_mode = "smart_case", -- or "ignore_case" or "respect_case"
}
local file_browser = {
	theme = "ivy",
	previewer = false,
}

local bufdel = require("bufdel")
local action_state = require("telescope.actions.state")

local implement_bufdel = function(prompt_bufnr)
	local current_picker = action_state.get_current_picker(prompt_bufnr)
	current_picker:delete_selection(function(selection)
		bufdel.delete_buffer(selection.bufnr, true)
	end)
end

telescope.setup({
	extensions = {
		fzf = fzf,
		file_browser = file_browser,
	},
	file_ignore_patterns = {
		"node_modules/.*",
		".git/*",
		".DS_Store",
		".idea/*",
	},
	pickers = {
		find_files = {
			theme = "ivy",
			previewer = false,
		},
		git_files = {
			theme = "ivy",
			previewer = false,
		},
		diagnostics = {
			theme = "dropdown",
		},
		live_grep = {
			theme = "dropdown",
			layout_config = {
				width = 0.85,
			},
		},
		buffers = {
			previewer = false,
			mappings = {
				i = {
					["<C-d>"] = implement_bufdel,
				},
			},
		},
	},
})

-- LOADING EXTENSIONS
telescope.load_extension("fzf")
telescope.load_extension("repo")
telescope.load_extension("emoji")
telescope.load_extension("file_browser")
telescope.load_extension("harpoon")

local options = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>Telescope git_files hidden=true<cr>", options)
vim.api.nvim_set_keymap("n", "<C-A-p>", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", options)
vim.api.nvim_set_keymap("n", "<C-b><C-b>", "<cmd>Telescope buffers<cr>", options)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fm",
	'<cmd>lua require "telescope".extensions.file_browser.file_browser()<cr>',
	options
)
vim.api.nvim_set_keymap("n", "<leader>/", '<cmd>lua require "telescope.builtin".grep_string()<cr>', options)

vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd Telescope help_tags<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>gr", "<cmd>Telescope lsp_document_symbols<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>GR", "<cmd>Telescope lsp_workspace_symbols<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>dd", "<cmd>Telescope diagnostics bufnr=0<cr>", options)
