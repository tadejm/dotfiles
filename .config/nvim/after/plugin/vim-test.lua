vim.keymap.set("n", "<leader>t", vim.cmd.TestNearest, { silent = true })
vim.keymap.set("n", "<leader>T", vim.cmd.TestFile, { silent = true })
vim.keymap.set("n", "<leader>l", vim.cmd.TestLast, { silent = true })
vim.keymap.set("n", "<leader>g", vim.cmd.TestVisit, { silent = true })
