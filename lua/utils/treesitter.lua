---@class TreeSitterUtilsOpts
---@field max_lines integer

---@class TreeSitterUtils
---@field max_lines integer
---@field disable_highlighting_for_large_buffers fun(bufnr?: integer,  opts?: TreeSitterUtilsOpts)
local M = {}

M.max_lines = 500

---Disable Tree-sitter highlighting for large buffers.
---@param bufnr? integer
---@param opts? TreeSitterUtilsOpts
M.disable_highlighting_for_large_buffers = function(bufnr, opts)
	opts = opts or {}
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	local max_lines = opts.max_lines or M.max_lines

	if vim.api.nvim_buf_line_count(bufnr) >= max_lines then
		vim.treesitter.stop(bufnr)
	end
end

return M
