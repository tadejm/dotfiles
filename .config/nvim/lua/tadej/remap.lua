vim.g.mapleader = " "
vim.keymap.set("n", "-", vim.cmd.Ex)

vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", "! json_pp<CR>")

vim.keymap.set("n", "J", "mzJ`z")
-- paging up/down keeps the cursor in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- search cursor stays in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

-- system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")

sides = { "<Left>", "<Right>", "<Up>", "<Down>" }
for _index, side in ipairs(sides)
do
  vim.keymap.set("n", side, function ()
    print("no!")
  end)
end

vim.keymap.set("n", "<leader>,", "<C-^>")
