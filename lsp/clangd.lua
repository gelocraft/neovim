return {
	cmd = {
		'clangd',
		'--background-index',
		'--background-index-priority=background',
		'--clang-tidy',
		'--completion-style=detailed', -- detailed, bundled
		'--header-insertion=iwyu',
		'--import-insertions',
		'--function-arg-placeholders=0',
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
		'.clang-format',
		'.clang-tidy',
		'compile_commands.json',
		'compile_flags.txt',
		'.git',
	}),
}
