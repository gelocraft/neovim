return {
	'saghen/blink.cmp',
	event = { 'InsertEnter', 'CmdlineChanged' },
	-- optional: provides snippets for the snippet source
	dependencies = { 'rafamadriz/friendly-snippets' },

	-- use a release tag to download pre-built binaries
	version = '1.*',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		signature = { enabled = true, window = { show_documentation = false } },

		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		keymap = {
			preset = 'default',

			['<C-space>'] = {
				'show',
				'show_documentation',
				'hide_documentation',
			},

			['<C-y>'] = { 'accept', 'fallback' },

			['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
			['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

			['<Tab>'] = { 'snippet_forward', 'fallback' },
			['<S-Tab>'] = { 'snippet_backward', 'fallback' },

			['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
			['<C-d>'] = { 'scroll_documentation_down', 'fallback' },

			['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },

			['<C-e>'] = { 'hide', 'fallback' },
		},

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = 'mono',
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			menu = { auto_show = false },
			documentation = { auto_show = false, auto_show_delay_ms = 500 },
			ghost_text = { enabled = true, show_with_menu = false },
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = 'prefer_rust_with_warning' },
	},
	opts_extend = { 'sources.default' },
}
