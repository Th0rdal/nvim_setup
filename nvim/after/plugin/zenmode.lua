local status, zenmode = pcall(require, "zen-mode")
if not status then return end

vim.keymap.set("n", "<leader>zz", function()
    zenmode.setup {
        window = {
            width = 90,
            options = { }
        },
    }
    zenmode.toggle()
    vim.wo.wrap = false
    vim.wo.number = true
    vim.wo.rnu = true
    ColorMyPencils()
end)


vim.keymap.set("n", "<leader>zZ", function()
    zenmode.setup {
        window = {
            width = 80,
            options = { }
        },
    }
    zenmode.toggle()
    vim.wo.wrap = false
    vim.wo.number = false
    vim.wo.rnu = false
    vim.opt.colorcolumn = "0"
    ColorMyPencils()
end)
