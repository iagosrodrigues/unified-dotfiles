local keymap = vim.keymap
-- local hop = require('hop')
-- local directions = require('hop.hint').HintDirection
--
-- vim.keymap.set('', 'f', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
-- end, { remap = true })
-- vim.keymap.set('', 'F', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
-- end, { remap = true })
-- vim.keymap.set('', 't', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
-- end, { remap = true })
-- vim.keymap.set('', 'T', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
-- end, { remap = true })

keymap.set({ "n", "v" }, "<Space>", "<Nop>")
keymap.set("n", "Q", "<Nop>")
--
-- Not yank when paste
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Keep cursor at in the middle
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Remap for dealing with word wrap
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Don't copy the char when use x in normal mode
keymap.set("n", "x", '"_x')
keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards and don't copy it
keymap.set("n", "dw", 'vb"_d')

-- Dont copy when delete
keymap.set("x", "<leader>p", '"_dP')

keymap.set({ "n", "v" }, "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')

keymap.set({ "n", "v" }, "<leader>d", '"+d')
-- Select all
-- keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set("n", "te", ":tabedit")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

if vim.g.neovide then
  vim.g.neovide_input_use_logo = 1
  vim.g.neovide_transparency = 0.9
  keymap.set({ "n", "v" }, "<D-v>", '"+P')
  keymap.set({ "n", "v" }, "<D-v>", '"+P')
  keymap.set("", "<D-v>", '+P<CR>', { noremap = true, silent = true })
  keymap.set({ "!", "t", "v" }, "<D-v>", '<C-R>+', { noremap = true, silent = true })
end
