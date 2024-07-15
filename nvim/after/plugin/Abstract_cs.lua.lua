local apply_cs, _ = pcall(vim.cmd, "colorscheme abscs")
if not apply_cs then return end
vim.g.abscs_theme_name = "aqua"