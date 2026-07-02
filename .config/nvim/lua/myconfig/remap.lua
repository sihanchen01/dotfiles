vim.g.mapleader=","
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("n", "<leader>t", vim.cmd.tabnew)
vim.keymap.set("n", "<leader><cr>", vim.cmd.noh)

-- Auto complete brackets
vim.keymap.set("i", "{", "{}<Esc>ha")
vim.keymap.set("i", "(", "()<Esc>ha")
vim.keymap.set("i", "[", "[]<Esc>ha")
vim.keymap.set("i", '"', '""<Esc>ha')
vim.keymap.set("i", "'", "''<Esc>ha")
vim.keymap.set("i", "`", "``<Esc>ha")

-- Open packer.lua
local function open_packer()
    if package.config:sub(1,1) == "\\" then
        vim.cmd.tabnew("$HOME/AppData/Local/nvim/lua/myconfig/packer.lua")
    else
        vim.cmd.tabnew("$HOME/.config/nvim/lua/myconfig/packer.lua")
    end
    vim.cmd.lcd("%:p:h")
    vim.cmd.lcd("..")
    vim.cmd.lcd("..")
end
vim.keymap.set("n", "<leader>pa", function() open_packer() end)

-- Replace word
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Session
local function save_session()
    local session_file = vim.fn.input("Enter name for session file: ")
    vim.cmd.mks{string.format("~/%s.vim", session_file), bang=true}
    print(string.format("%s.vim saved!", session_file))
end
vim.keymap.set("n", "<leader>s", function() save_session() end)

-- Move line up and down
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")

-- Markdown, add * before and after
vim.keymap.set("v", "<leader>8", ':s/\\%V.*\\%V./<span style="color:red">**&**<\\/span><CR>')
