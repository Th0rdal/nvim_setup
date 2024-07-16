local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    vim.api.nvim_command(":cd src");
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
	vim.api.nvim_command(":cd ..");
end)

vim.keymap.set('n', '<leader>pt', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

-- Load Telescope and Plenary (required for some Telescope functionality)
local telescope = require('telescope')

--local vimgrep_arguments = {unpack(require("telescope.config").values.vimgrep_arguments)}

--table.insert(vimgrep_arguments, "--hidden")
--table.insert(vimgrep_arguments, "!**/.git/*")

local function cutOutLastDirectory(str, char)
	local lastIdx = nil
	
	for i = #str, 1, -1 do
		if string.sub(str, i, i) == char then
			lastIdx = i
			break
		end
	end
	return string.sub(str, lastIdx+1, #str)
end

require('telescope').setup {
	defaults = {
		file_ignore_patterns = {
			"build.bat", ".git", ".nvim", ".idea"
		},
	},
	pickers = {
		find_files = {
			mappings = {
				n = {
					["<C-CR>"] = require("telescope.actions").select_horizontal,
					["<s-CR>"] = require("telescope.actions").select_vertical,
				},
				i = {
					["<C-CR>"] = require("telescope.actions").select_horizontal,
					["<s-CR>"] = require("telescope.actions").select_vertical,
				},
			}
		}
	},
	project_actions = require("telescope._extensions.project.actions"),
	extensions = {
	  project = {
		base_dirs = {
		  "C:\\PatrickSimetzberger\\projects",
		},
		max_depth=10,
		hidden_files = true,
		theme = "dropdown",
		order_by = "desc",
		search_by = "title",
		sync_with_nvim_tree = true,
		on_project_selected = function(prompt_bufnr)
		  -- change directory, close the Telescope tab and then execute Ex command
		  vim.fn.chdir(require("telescope.actions.state").get_selected_entry(prompt_bufnr).value)
		  require("telescope.actions").close(prompt_bufnr)
		  require("neoproj").open_project(require("telescope.actions.state").get_selected_entry(prompt_bufnr).value:match("([^/\\]+)[/\\]?$"))
		  vim.api.nvim_exec("NvimTreeOpen", false)
		end
	  }
	}
  }

vim.api.nvim_exec(
	[[
		augroup OnExit
			autocmd!
			autocmd VimLeave * NvimTreeClose
			autocmd VimLeave * lua require("betterTerm").clear()
			autocmd VimLeave * lua require('neoproj').save_session()
		augroup END
	]],
	false
)  

vim.keymap.set("n", "<leader><C-F>", ":Telescope project<CR>", {noremap = true})
vim.keymap.set("n", "<leader>kn", function() require("betterTerm").clear() end)