return {
	'hat0uma/csvview.nvim',
	ft = { 'csv', 'tsv' },
	cmd = { 'CsvViewEnable', 'CsvViewDisable', 'CsvViewToggle' },
	opts = {
		view = { display_mode = 'border' },
		parser = {
			delimiter = {
				ft = {
					csv = ',', -- Always use comma for .csv files
					tsv = '\t', -- Always use tab for .tsv files
				},
				fallbacks = { -- Try these delimiters in order for other files
					',', -- Comma (most common)
					'\t', -- Tab
					';', -- Semicolon
					'|', -- Pipe
					':', -- Colon
					' ', -- Space
				},
			},
		},
	},
	config = function(_, opts)
		require('csvview').setup(opts)
		require('csvview').enable()
	end,
}
