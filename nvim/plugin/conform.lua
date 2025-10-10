if vim.g.did_load_conform_plugin then
  return
end
vim.g.did_load_conform_plugin = true


require("conform").setup({
  formatters_by_ft = {
    python = { "black" },
    nix = { 'nil' },
  },
})
