

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

vim.api.nvim_set_keymap('n', "<silent>gd", [[:tab split \| lua vim.lsp.buf.definition()<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<silent>gD", [[:lua vim.lsp.buf.declaration()<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<silent>gr", [[:lua vim.lsp.buf.references()<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<silent>gi", [[:lua vim.lsp.buf.implementation()<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<silent>K", [[:Lspsaga hover_doc<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<silent><C-k>", [[:lua vim.lsp.buf.signature_help()<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<silent><C-p>", [[:Lspsaga diagnostic_jump_prev<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<silent><C-n>", [[:Lspsaga diagnostic_jump_next<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<silent>gf", [[:lua vim.lsp.buf.formatting()<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<silent>gn", [[:Lspsaga rename<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<silent>ga", [[:Lspsaga code_action<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<silent>ga", [[:Lspsaga range_code_action<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', "<silent>gs", [[:Lspsaga signature_help<CR>]], {noremap = true})
