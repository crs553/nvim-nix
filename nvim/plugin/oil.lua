if vim.g.did_load_oil_plugin then
  return
end
vim.g.did_load_oil_plugin = true

local oil = require('oil')

oil.setup {
  default_file_explorer = true, -- Replace netrw
  columns = { 'icon' }, -- Show file icons
  view_options = {
    show_hidden = true, -- Show dotfiles
  },
}

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory in oil.nvim' })
