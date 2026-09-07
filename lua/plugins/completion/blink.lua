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

		signature = {
			enabled = true,
			window = {
				border = 'single',
				show_documentation = false,
				treesitter_highlighting = true,
			},
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			list = { max_items = 10 }, -- Maximum number of items to display
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 50,
				update_delay_ms = 50,
				treesitter_highlighting = true,
				window = {
					border = 'single',
				},
			},
			ghost_text = { enabled = true, show_with_menu = false },
			menu = {
				auto_show = true,
				max_height = 5,
				border = nil,
				draw = {
					padding = { 1, 1 },
					treesitter = { 'lsp' },
					components = {
						label = {
							ellipsis = true,
							width = { fill = true, max = 20 },
						},
					},
					columns = {
						{ 'source_name' },
						{ 'label', 'label_description', gap = 1 },
						{ 'kind_icon', 'kind', gap = 1 },
					},
				},
			},
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
