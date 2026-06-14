return {
	cmd = { 'rust-analyzer' },
	filetypes = { 'rust' },
	single_file_support = true,
	settings = {
		['rust-analyzer'] = {
			imports = {
				granularity = {
					group = 'module',
				},
				prefix = 'self',
			},
			completion = {
				autoimport = true,
			},
		},
	},
}
