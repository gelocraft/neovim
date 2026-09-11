local colorschemes = {
	['onedark'] = {
		'navarasu/onedark.nvim',
		lazy = true,
		priority = 1000,
		opts = {
			style = 'deep',
			transparent = true,
			term_colors = true,
			code_style = {
				comments = 'italic,bold',
				keywords = 'none',
				functions = 'none',
				strings = 'none',
				variables = 'none',
			},
		},
		config = function(_, opts)
			require('onedark').setup(opts)
			require('onedark').load()
		end,
	},
	['kanagawa'] = {
		'rebelot/kanagawa.nvim',
		lazy = true,
		priority = 1000,
		transparent = false,
		opts = {
			keywordStyle = { italic = false },
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = 'none',
						},
					},
				},
			},
		},
		config = function(_, opts)
			require('kanagawa').setup(opts)
			require('kanagawa').load 'wave'
		end,
	},
	['tokyonight'] = {
		'folke/tokyonight.nvim',
		lazy = true,
		priority = 1000,
		opts = {},
	},
	['catppuccin'] = {
		'catppuccin/nvim',
		lazy = true,
		name = 'catppuccin',
		priority = 1000,
		opts = {},
		config = function(_, opts) require('catppuccin').setup(opts) end,
	},
	['gruvbox'] = {
		'ellisonleao/gruvbox.nvim',
		lazy = true,
		priority = 1000,
		opts = {},
		config = function(_, opts) require('gruvbox').setup(opts) end,
	},
}

-- set default colorscheme
colorschemes['kanagawa'].lazy = false

return vim.iter(colorschemes)
	:map(function(_, colorscheme) return colorscheme end)
	:totable()
