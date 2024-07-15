
local b = vim.api.nvim_create_buf(true, false)
vim.api.nvim_buf_set_lines(b, 0, -1, false, {})
vim.api.nvim_open_win(b, true, {    
			relative = 'win',
			width = 20,
			height = 10,
			row = 1,
			col = 1,
			style = 'minimal',
			border = 'single',
		})
