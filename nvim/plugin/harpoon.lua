if vim.g.did_load_harpoon_plugin then
  return
end
vim.g.did_load_harpoon_plugin= true
local harpoon = require("harpoon")

    harpoon:setup({
      settings = {
        save_on_toggle = true,
      },
    })

    local keymap = vim.keymap.set
    local get_list = function() return harpoon:list() end

    -- open & add functions
    keymap("n", "<leader>A", function() get_list():prepend() end, { desc = "Harpoon Prepend" })
    keymap("n", "<leader>a", function() get_list():add() end, { desc = "Harpoon Add" })
    keymap("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(get_list()) end, { desc = "Harpoon Quick Menu" })

    -- switching functions
    keymap("n", "<C-h>", function() get_list():select(1) end, { desc = "Harpoon to 1" })
    keymap("n", "<C-j>", function() get_list():select(2) end, { desc = "Harpoon to 2" })
    keymap("n", "<C-k>", function() get_list():select(3) end, { desc = "Harpoon to 3" })
    keymap("n", "<C-l>", function() get_list():select(4) end, { desc = "Harpoon to 4" })

    -- replacing functions
    keymap("n", "<leader><C-h>", function() get_list():replace_at(1) end, { desc = "Harpoon Replace 1" })
    keymap("n", "<leader><C-j>", function() get_list():replace_at(2) end, { desc = "Harpoon Replace 2" })
    keymap("n", "<leader><C-k>", function() get_list():replace_at(3) end, { desc = "Harpoon Replace 3" })
    keymap("n", "<leader><C-l>", function() get_list():replace_at(4) end, { desc = "Harpoon Replace 4" })
