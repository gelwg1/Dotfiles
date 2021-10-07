

vim.g.mapleader = ','

vim.api.nvim_set_keymap('n', '<Leader>pp', [[:lua require'telescope.builtin'.builtin{}<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>;', [[:lua require'telescope.builtin'.buffers{}<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>m', [[:lua require'telescope.builtin'.oldfiles{}<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>/', [[:lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<Leader>'", [[:lua require'telescope.builtin'.marks{}<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>f', [[:lua require'telescope.builtin'.git_files{}<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<Leader>bf", [[:lua require'telescope.builtin'.find_files{}<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<Leader>bb", [[:lua require'telescope.builtin'.file_browser{}<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<Leader>rg", [[:lua require'telescope.builtin'.live_grep{}<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<Leader>cs", [[:lua require'telescope.builtin'.colorscheme{}<CR>]], {noremap = true})


vim.api.nvim_set_keymap('n', "<silent>gd", [[:lua require'telescope.builtin'.colorscheme{}<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<silent>gD", [[:lua require'telescope.builtin'.colorscheme{}<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<silent>gr", [[:lua require'telescope.builtin'.colorscheme{}<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<silent>gi", [[:lua require'telescope.builtin'.colorscheme{}<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<silent>K", [[:lua require'telescope.builtin'.colorscheme{}<CR>]], {noremap = true})
nnoremap <silent> gd    <cmd>tab split \| lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K     <cmd>Lspsaga hover_doc<CR>


nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <C-n> <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gn    <cmd>Lspsaga rename<CR>
nnoremap <silent> ga    <cmd>Lspsaga code_action<CR>
xnoremap <silent> ga    <cmd>Lspsaga range_code_action<CR>
nnoremap <silent> gs    <cmd>Lspsaga signature_help<CR>
