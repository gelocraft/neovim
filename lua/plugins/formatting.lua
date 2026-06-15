return {
	'stevearc/conform.nvim',
	event = 'BufWritePre',
	opts = {
		formatters_by_ft = {
			sh = { 'shfmt' },
			yaml = { 'yamlfmt' },
			lua = { 'stylua' },
			python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
			go = { 'gofmt' },
			rust = { 'rustfmt' },
			ocaml = { 'ocamlformat' },
			terraform = { 'terraform_fmt' },
			hcl = { 'packer_fmt', 'terragrunt_hclfmt' },
			typescript = { 'prettierd', 'prettier' },
			typescriptreact = { 'prettierd', 'prettier' },
			javascript = { 'prettierd', 'prettier' },
			javascriptreact = { 'prettierd', 'prettier' },
			json = { 'prettierd', 'prettier' },
			html = { 'prettierd', 'prettier' },
			css = { 'prettierd', 'prettier' },
			nix = { 'nixfmt' },
		},

		format_after_save = {
			async = true,
			lsp_fallback = true,
		},

		notify_on_error = true,
	},
}
