

local import_icons, icons = pcall(require, "nvim-web-devicons")
if not import_icons then return end

-- Get all icons
icons.get_icons()