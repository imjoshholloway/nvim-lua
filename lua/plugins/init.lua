return {
	"andymass/vim-matchup",
	"tpope/vim-surround",
	{
		"terrortylor/nvim-comment",
		keys = {
			{ "<leader>cc", "<cmd>CommentToggle<CR>", mode = "n", desc = "Toggle comment"},
		},
		config = function()
			require("nvim_comment").setup({
				line_mapping     = "<leader>c",
				operator_mapping = "<leader>c"
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
	},
}
