" >> load plugins
call plug#begin(stdpath('data') . 'vimplug')
    "Telescope for file manager
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    "lsp + autocomplete
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'hrsh7th/nvim-compe'

    "colorscheme
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'christianchiarulli/nvcode-color-schemes.vim'

    "Syntax hightlighting Treesitter 
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'

    "HTML tags and auto close bracket
    Plug 'windwp/nvim-ts-autotag'
    Plug 'windwp/nvim-autopairs'

    "file formatter using Prettier
    Plug 'mhartington/formatter.nvim'

    "snippet for React 
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'rafamadriz/friendly-snippets'

    " A status line 
    Plug 'glepnir/galaxyline.nvim', { 'branch': 'main' }
    Plug 'kyazdani42/nvim-web-devicons'  " needed for galaxyline icons

call plug#end()

let g:mapleader=","

" >> Telescope bindings
nnoremap <Leader>pp <cmd>lua require'telescope.builtin'.builtin{}<CR>
nnoremap <Leader>m <cmd>lua require'telescope.builtin'.oldfiles{}<CR>
nnoremap <Leader>; <cmd>lua require'telescope.builtin'.buffers{}<CR>
nnoremap <Leader>/ <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>
nnoremap <Leader>' <cmd>lua require'telescope.builtin'.marks{}<CR>
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.git_files{}<CR>
nnoremap <Leader>bf <cmd>lua require'telescope.builtin'.find_files{}<CR>
nnoremap <Leader>bb <cmd>lua require'telescope.builtin'.file_browser{}<CR>
nnoremap <Leader>rg <cmd>lua require'telescope.builtin'.live_grep{}<CR>
nnoremap <Leader>cs <cmd>lua require'telescope.builtin'.colorscheme{}<CR>

" >> Lsp key bindings
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
nnoremap <silent> <leader>ss :Format<CR>
lua <<EOF

require("setting")
require("lsp")
require("treesitter")
require("statusbar")
require("completion")
require("autopair")

EOF

