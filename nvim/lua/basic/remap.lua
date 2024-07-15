local betterTerm = require "betterTerm"

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--[[ betterTerm
vim.keymap.set({"n", "t"}, "<C-;>", betterTerm.open, { desc = "Open terminal"})
vim.keymap.set({"n"}, "<leader>tt", betterTerm.select, { desc = "Select terminal"})
vim.keymap.set(
    {"n"}, "<leader>tn",
    function()
        betterTerm.open(current)
        current = current + 1
    end,
    { desc = "New terminal"}
)
]]

--[[ fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>g", function()
    vim.cmd.Git('push')
end, opts)
vim.keymap.set("n", "<leader>P", function()
    vim.cmd.Git({'pull',  '--rebase'})
end, opts)
vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
]]

--[[ harpoon
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
]]

--[[ lsp
['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
['<C-y>'] = cmp.mapping.confirm({ select = true }),
["<C-Space>"] = cmp.mapping.complete(),
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
]]

--[[ nvim-window
vim.keymap.set("n", "<leader>w", function()
    require("nvim-window").pick()
end)
]]

-- refactoring
-- vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

--[[ telescope
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
vim.keymap.set("n", "<leader><C-F>", ":Telescope project<CR>", {noremap = true})
vim.keymap.set("n", "<leader>kn", function() require("betterTerm").clear() end)
]]

--[[ trouble
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
]]

--[[ undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
]]

--[[
vim.g.floaterm_keymap_toggle = '<C-t>' -- toggle open/close floaterm
keymap('n', 'tk', ':FloatermPrev<CR>', options)
keymap('n', 'tj', ':FloatermNext<CR>', options)
keymap('n', 'tn', ':FloatermNew<CR>',  options)
keymap('n', 'tq', ':FloatermKill<CR>', options)
]]

--[[
vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").setup {
        window = {
            width = 90,
            options = { }
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = true
    vim.wo.rnu = true
    ColorMyPencils()
end)
vim.keymap.set("n", "<leader>zZ", function()
    require("zen-mode").setup {
        window = {
            width = 80,
            options = { }
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = false
    vim.wo.rnu = false
    vim.opt.colorcolumn = "0"
    ColorMyPencils()
end)
]]

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<leader><C-h>", function()
    vim.cmd("WhichKey")
end)

vim.keymap.set("n", "<F5>",
    function()
        betterTerm.open(current)
        betterTerm.send("builddebug.bat", current)
        vim.api.nvim_input("<CR>")
        current = current + 1
    end)

vim.keymap.set("n", "<leader><F5>",
    function()
        betterTerm.open(current)
        betterTerm.send("target/algorithm.exe", current)
        vim.api.nvim_input("<CR>")
        current = current + 1
    end)

vim.keymap.set("n", "<F6>",
    function()
        betterTerm.open(current)
        betterTerm.send("buildtest.bat all", current)
        vim.api.nvim_input("<CR>")
        current = current + 1
    end)

vim.keymap.set("n", "<leader><F6>",
    function()
        betterTerm.open(current)
        betterTerm.send("buildtest.bat", current)
        vim.api.nvim_input("<CR>")
        current = current + 1
    end)

vim.keymap.set("n", "<F7>",
    function()
        betterTerm.open(current)
        betterTerm.send("buildtest.bat all gdb", current)
        vim.api.nvim_input("<CR>")
        current = current + 1
    end)

vim.keymap.set("n", "<leader><F7>",
    function()
        betterTerm.open(current)
        betterTerm.send("gdb target/debugProgram.exe", current)
        vim.api.nvim_input("<CR>")
        current = current + 1
    end)