return {
	type = 'executable',
	command = 'gdb',
	args = { '-i', 'dap' },
	-- command = os.getenv 'PREFIX' .. '/bin/gdb',
}
