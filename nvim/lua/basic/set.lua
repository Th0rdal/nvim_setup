vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath('config') .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

function getStatusLine()
    return vim.g.statusline_winid or ""
end
vim.api.nvim_set_option('statusline', '%<%f %h%m%r%= %-14.(%l,%c%V%) %P')

-- Cursor shapes for different modes
vim.api.nvim_create_augroup("CursorShape", {})

-- Insert mode: vertical line
vim.api.nvim_create_autocmd("InsertEnter", {
    group = "CursorShape",
    callback = function()
        vim.opt.guicursor = "n-v-c:ver25" -- Vertical line in insert mode
    end,
})

-- Normal mode: full block
vim.api.nvim_create_autocmd("NormalEnter", {
    group = "CursorShape",
    callback = function()
        vim.opt.guicursor = "n-v-c:block-blinkon0" -- Full block in normal mode
    end,
})

-- Replace mode: underscore
vim.api.nvim_create_autocmd("InsertLeave", {
    group = "CursorShape",
    callback = function()
        if vim.fn.mode() == "R" then
            vim.opt.guicursor = "n-v-c:hor20" -- Underscore cursor in replace mode
        else
            vim.opt.guicursor = "n-v-c:block-blinkon0" -- Full block in normal mode
        end
    end,
})