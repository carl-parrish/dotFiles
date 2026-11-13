return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	ft = { "markdown" },
	opts = {
		anti_conceal = {
			enabled = true,
			ignore = {
				code_background = true,
				sign = true,
			},
		},
		bullet = {
			enabled = true,
			icons = { "●", "○", "◆", "◇" },
			left_pad = 0,
			right_pad = 1,
		},
		code = {
			style = "full",
			width = "block",
			right_pad = 2,
			border = "thin",
		},
		pipe_table = {
			preset = "round",
		},
	},
	keys = {
		{
			"<leader>um",
			"<cmd>RenderMarkdown toggle<cr>",
			desc = "[U]I Toggle [M]arkdown WYSIWYG",
		},
	},
}
