return {
	'nvim-lualine/lualine.nvim',
	enabled = true,
	event = 'VeryLazy',
	opts = {
		options = {
			globalstatus = true,
			icons_enabled = vim.g.have_nerd_font,
			theme = 'auto',
			component_separators = { left = '│', right = '│' },
			section_separators = vim.g.have_nerd_font
					and { left = '', right = '' }
				or { left = '', right = '' },
		},
		sections = {
			lualine_a = {
				{
					'mode',
					separator = {
						left = vim.g.have_nerd_font and '' or '',
						right = '',
					},
				},
			},
			lualine_b = { 'branch', 'diff', 'diagnostics' },
			lualine_c = {
				'%=',
				{
					'lsp_status',
					color = function()
						local modes = {
							['i'] = 'lualine_b_insert',
							['n'] = 'lualine_b_normal',
							['v'] = 'lualine_b_visual',
							['V'] = 'lualine_b_visual',
							['\x16'] = 'lualine_b_visual',
							['R'] = 'lualine_b_replace',
							['c'] = 'lualine_b_command',
							['t'] = 'lualine_b_terminal',
						}
						return modes[vim.fn.mode()]
					end,
					separator = vim.g.have_nerd_font
							and { left = '', right = '' }
						or { left = ' ', right = ' ' },
				},
			},
			lualine_x = { 'filetype' },
			lualine_y = {
				'progress',
			},
			lualine_z = {
				{
					'location',
					separator = {
						left = '',
						right = vim.g.have_nerd_font and '' or '',
					},
				},
			},
		},
	},
}
