local status, tree = pcall(require, "nvim-tree")
if not status then return end

local function customAttach(bufnr)
  local api = require "nvim-tree.api"
  local function opts(desc)
    return {desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true}
  end

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set('n', '<S-CR>',   api.node.open.vertical,              opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-CR>',   api.node.open.horizontal,            opts('Open: Horizontal Split'))
end

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
tree.setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  on_attach = customAttach,
})