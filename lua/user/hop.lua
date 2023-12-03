local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end

hop.setup { 
  keys = 'etovxqpdygfblzhckisuran'
}

vim.cmd "hi HopNextKey guifg=#ff6600"
vim.cmd "hi HopNextKey1 guifg=#ff6600"
vim.cmd "hi HopNextKey2 guifg=#ff6600"

