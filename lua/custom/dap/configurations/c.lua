return {
	{
		name = 'Lauch C',
		request = 'launch',
		type = 'gdb',
		program = function()
			return vim.fn.input {
				prompt = 'Path to executable: ',
				default = vim.fn.getcwd() .. '/',
				completion = 'file',
			}
		end,
	},
}
