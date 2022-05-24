local default_opts = {noremap = true, silent = true}
local map = vim.api.nvim_set_keymap
local cmd = vim.cmd
local ls = require("luasnip")

cmd [[ set termguicolors ]]

map('', '<F3>', '<cmd>NvimTreeToggle<CR>', default_opts)
map('', '<S-F3>', '<cmd>NvimTreeRefresh<CR>', default_opts)

-- LSP KEYMAPS --
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', default_opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', default_opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', default_opts)
vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc') -- Enable completion triggered by <c-x><c-o>
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', default_opts)
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', default_opts)
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', default_opts)
-- vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', default_opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua require(config_dir .. "lsp.handlers").implementation()<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', default_opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<F8>', '<cmd>GoBreakToggle<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<F10>', '<cmd>GoDebug --test<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<F11>', '<cmd>GoDebug --stop<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<F12>', '<cmd>GoAddTags<CR>', default_opts)
-- luasnip
vim.keymap.set("n", "<F5>", "<cmd>source ~/.config/nvim/lua/main/luasnip/init.lua<CR><cmd>source ~/.config/nvim/lua/main/keymap.lua<CR>")

-- git
vim.keymap.set('n', ';lg', '<cmd>LazyGit<CR>', default_opts)
vim.keymap.set('n', ';gs', '<cmd>ToggleBlameLine<CR>', default_opts)

vim.keymap.set({ "i","s" }, "<c-k>", function ()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i","s" }, "<c-j>", function ()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set("i", "<c-l>", function ()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

vim.keymap.set("i", "<c-h>", function ()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end, { silent = true })

-- telescope
vim.keymap.set('n', ';f', '<cmd>lua require("telescope.builtin").find_files({ hidden = true })<CR>',default_opts)
vim.keymap.set('n', ';e', '<cmd>lua require("telescope.builtin").live_grep()<CR>', default_opts)
vim.keymap.set('n', ';b', '<cmd>lua require("telescope.builtin").buffers()<CR>', default_opts)

-- user key
vim.keymap.set('n', ';w', '<cmd>w<CR>', default_opts)
vim.keymap.set('n', ';W', '<cmd>wa<CR>', default_opts)
vim.keymap.set('n', ';q', '<cmd>bdelete<CR>', default_opts)
vim.keymap.set('n', ';Q', '<cmd>q!<CR>', default_opts)
vim.keymap.set('n', '<leader>c', '<cmd>nohlsearch<CR>', default_opts)

-- bufferline
vim.keymap.set('n', '<c-l>', '<cmd>BufferLineCycleNext<CR>', default_opts)
vim.keymap.set('n', '<c-h>', '<cmd>BufferLineCyclePrev<CR>', default_opts)
vim.keymap.set('n', '<S-l>', '<cmd>BufferLineMoveNext<CR>', default_opts)
vim.keymap.set('n', '<S-h>', '<cmd>BufferLineMovePrev<CR>', default_opts)

-- quickfixlist
vim.keymap.set('', '<c-n>', '<cmd>cnext<CR>', default_opts)
vim.keymap.set('', '<c-p>', '<cmd>cprev<CR>', default_opts)

-- vim.api.nvim_set_keymap('i', '<TAB>', '<Plug>luasnip-next-choice', default_opts)
-- vim.api.nvim_set_keymap('s', '<TAB>', '<Plug>luasnip-next-choice', default_opts)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
