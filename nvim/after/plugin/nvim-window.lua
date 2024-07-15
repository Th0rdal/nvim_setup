
require("nvim-window").setup( {
    chars = {
     '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13',
     '14', '15', '16'
    },

    normal_hl = "Normal",
    hint_hl = "Bold",
    border = "single"
})
vim.keymap.set("n", "<leader>w", function()
    require("nvim-window").pick()
end)