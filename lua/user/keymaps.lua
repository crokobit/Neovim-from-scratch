local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal -- # NOTE GOOD!
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows XXX conflict with system deskstop switching keyword
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers(opened files)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down XXX useless...
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode -- XXX GOOD
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down XXX useless...
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- vim-test XXX Keycodes are not case sensitive.
keymap("n", "<A-t>", ":wa<CR> :TestNearest -strategy=vtr<CR>", opts)
keymap("n", "<A-g>", ":wa<CR> :TestFile -strategy=vtr<CR>", opts)
keymap("n", "<A-b>", ":wa<CR> :TestLast -strategy=vtr<CR>", opts)

-- :Rg then fzf
-- :Telescope grep_string search=

-- add extra space by k or j
keymap("n", "<space>k", "O<esc>j", opts)
keymap("n", "<space>j", "o<esc>k", opts)

-- Telescope grep_string search=''

-- vim.api.nvim_create_user_command('Rg',function()
--   pcall(function()
--     vim.fn.Preserve("Telescope grep_string search=")
--   end)
-- end,{})

-- select pasted
keymap("n", "gp", "`[v`]", opts)


vim.keymap.set({'n', 't'}, '<C-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({'n', 't'}, '<C-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({'n', 't'}, '<C-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({'n', 't'}, '<C-j>', '<CMD>NavigatorDown<CR>')
vim.keymap.set({'n', 't'}, '<C-p>', '<CMD>NavigatorPrevious<CR>')

-- add extra space by k or j
-- keymap("n", "<A-f>", "<cmd>lua require('hop').hint_words({ multi_windows = true })<CR>", opts)
-- keymap("n", "<A-d>", "<cmd>lua require('hop').hint_char1({ multi_windows = true })<CR>", opts)
-- keymap("i", "<A-f>", "<cmd>lua require('hop').hint_words({ multi_windows = true })<CR>", opts)
-- keymap("i", "<A-d>", "<cmd>lua require('hop').hint_char1({ multi_windows = true })<CR>", opts)
vim.keymap.set({'n', 't'}, '<C-n>', '<CMD>tabnew<CR>')
