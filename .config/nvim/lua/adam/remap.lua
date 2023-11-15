vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move lines around in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Enhance J to keep cursor in place
-- mark at z, concat lines, move back to mark
vim.keymap.set("n", "J", "mzJ`z")

-- Keep the cursor in the middle yo
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep paste buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- System clipboard remaps
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- 
vim.keymap.set("n", "Q", "<nop>")

-- Quickfix
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>ccc", ":ccl<CR>")

-- Find and replace a little easier
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<F6>", ":so ~/.config/nvim/after/plugin/lsp.lua<CR>", { silent = true })
vim.keymap.set("v", "<F6>", ":so ~/.config/nvim/after/plugin/lsp.lua<CR>", { silent = true })

-- Make split navigation a little easier
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Proper indent for typescript and javascript
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*script",
    callback = function()
        vim.bo.shiftwidth=2
        vim.bo.tabstop=2
    end
})
