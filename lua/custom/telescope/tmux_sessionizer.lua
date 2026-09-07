return function()
	local pickers = require 'telescope.pickers'
	local finders = require 'telescope.finders'
	local sorters = require('telescope.config').values
	local actions = require 'telescope.actions'
	local action_state = require 'telescope.actions.state'

	local finder_cmd = function()
		if vim.fn.executable 'fd' ~= 1 then
			vim.notify(
				'WARNING (custom.telescope.tmux_sessionizer): `fd` is not installed',
				vim.log.levels.WARN
			)
			return { 'find', '-type', 'd', '-maxdepth', '3' }
		end

		return {
			'fd',
			'--type',
			'directory',
			'--max-depth',
			'3',
			'--hidden',
			'--exclude',
			'{.git,.cache,.npm,.cargo,.go,go}',
		}
	end

	---@param session string
	---@return boolean
	local switch_client = function(session)
		local exit_code = vim.system({ 'tmux', 'switch-client', '-t', session })
			:wait().code

		return exit_code == 0
	end

	---@param session_name string
	---@return boolean
	local create_session = function(session_name, directory)
		vim.system({
			'tmux',
			'new-session',
			'-ds',
			session_name,
			'-c',
			directory,
		}, { cwd = directory, detach = true })

		return true
	end

	pickers
		.new({}, {
			prompt_title = 'Tmux Sessionizer',
			initial_mode = 'insert',
			finder = finders.new_oneshot_job(finder_cmd(), {
				cwd = vim.env.HOME,
			}),

			sorter = sorters.generic_sorter {},

			attach_mappings = function(prompt_bufnr, map)
				map({ 'i', 'n' }, '<CR>', function()
					local entry = action_state.get_selected_entry()
					actions.close(prompt_bufnr)

					if entry and vim.env.TMUX ~= nil then
						local dir_path = entry.value:gsub('/$', '')
						local session =
							vim.fs.basename(dir_path):gsub('^%.', '_')

						local success = switch_client(session)

						if not success then
							local ok = create_session(
								session,
								vim.fs.joinpath(vim.env.HOME, dir_path)
							)
							if not ok then
								vim.notify(
									'ERROR (custom.telescope.tmux_sessionizer): Failed creating Tmux session',
									vim.log.levels.ERROR
								)
							else
								switch_client(session)
							end
						end
					else
						vim.notify(
							'ERROR (custom.telescope.tmux_sessionizer): Outside Tmux',
							vim.log.levels.ERROR
						)
					end
				end)

				return true
			end,
		})
		:find()
end
