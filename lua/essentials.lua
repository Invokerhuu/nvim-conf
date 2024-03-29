local option = vim.opt
local buffer = vim.b
local global = vim.g

-- Globol Settings --
option.showmode = false
option.backspace = { "indent", "eol", "start" }
option.tabstop = 4
option.shiftwidth = 4
option.expandtab = true
option.shiftround = true
option.autoindent = true
option.smartindent = true
option.number = true
option.relativenumber = true
option.wildmenu = true
option.hlsearch = false
option.ignorecase = true
option.smartcase = true
option.completeopt = { "menuone", "noselect" }
option.cursorline = true
option.termguicolors = true
option.signcolumn = "yes"
option.autoread = true
option.title = true
option.swapfile = false
option.backup = false
option.updatetime = 50
option.mouse = "a"
option.undofile = true
option.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')
option.exrc = true
option.wrap = false
option.splitright = true

-- Buffer Settings --
buffer.fileenconding = "utf-8"

-- Global Settings --
global.mapleader = " "

-- Key mappings --
-- vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
-- vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")
-- vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
-- vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")


vim.keymap.set("n", "<A-q>", "<cmd>bNext<CR>") 
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "v", "n" }, "<leader>y", "\"+y")

-- dianostic do not show in-text
-- vim.diagnostic.config({
--    virtual_text = false,
-- })

local diagnostics_active = true
vim.keymap.set('n', '<leader>tt', function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end)

-- neovide change scale at runtimepath
vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-+>", function()
    change_scale_factor(1.25)
end)
vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1/1.25)
end)

-- toggleterm.lua open terminal
vim.keymap.set("n","tt","<Cmd>ToggleTerm<CR>")

-- terminal keys
local opts = {buffer=0}
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
vim.keymap.set('t', 'jk',  [[<C-\><C-n>]])
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]])
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]])
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]])
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]])

-- clipboard

-- glance
vim.keymap.set('n', 'gd', '<CMD>Glance definitions<CR>')
vim.keymap.set('n', 'gr', '<CMD>Glance references<CR>')
vim.keymap.set('n', 'gy', '<CMD>Glance type_definitions<CR>')
vim.keymap.set('n', 'gm', '<CMD>Glance implementations<CR>')

-- copy direction info 
vim.keymap.set('n', '<leader>cc', '<CMD>let @+ = expand("%:p")<CR>')

vim.keymap.set('n','<leader>fc',"<CMD>exec 'Telescope grep_string default_text=' . escape(@z, ' ')<CR>")
