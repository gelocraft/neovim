return {
	cmd = {
		'clangd',
		'--background-index',
		'--clang-tidy',
		'--completion-style=detailed',
		'--header-insertion=iwyu',
		'--cross-file-rename',
	},

	filetypes = {
		'c',
		'cpp',
		'objc',
		'objcpp',
		'cuda',
	},

	root_dir = vim.fs.root(0, {
		'.clangd',
		'.clang-tidy',
		'compile_commands.json',
		'compile_flags.txt',
		'.git',
	}),
}
