-- this is a config example
local status, betterTerm = pcall(require, "betterTerm")
if not status then
    return
end

betterTerm.setup {
    prefix = "TERM_",
    startInserted = true,
    position = "bot",
    size = 20
  }

-- toggle firts term
vim.keymap.set({"n", "t"}, "<C-;>", betterTerm.open, { desc = "Open terminal"})
-- Select term focus
vim.keymap.set({"n"}, "<leader>tt", betterTerm.select, { desc = "Select terminal"})
-- Create new term
current = 2
vim.keymap.set(
    {"n"}, "<leader>tn",
    function()
        betterTerm.open(current)
        current = current + 1
    end,
    { desc = "New terminal"}
)