" >> load plugins
call plug#begin(stdpath('data') . 'vimplug')
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'hrsh7th/nvim-compe'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'

    Plug 'windwp/nvim-ts-autotag'
    Plug 'windwp/nvim-autopairs'

    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'rafamadriz/friendly-snippets'

    Plug 'glepnir/galaxyline.nvim', { 'branch': 'main' }
    Plug 'kyazdani42/nvim-web-devicons'  " needed for galaxyline icons

    Plug 'NLKNguyen/papercolor-theme'
    Plug 'christianchiarulli/nvcode-color-schemes.vim'
    Plug 'nikvdp/neomux'

    Plug 'tomtom/tcomment_vim'
call plug#end()


colorscheme onedark


" basic settings
syntax on
"set number
"set relativenumber
"set ignorecase      " ignore case
"set smartcase     " but don't ignore it, when search string contains uppercase letters
"set nocompatible
"set incsearch        " do incremental searching
"set visualbell
"set expandtab
"set tabstop=2
"set ruler
"set smartindent
"set shiftwidth=2
"set hlsearch
"set virtualedit=all
"set backspace=indent,eol,start " allow backspacing over everything in insert mode
"set autoindent
"set mouse=a  " mouse support



" set leader key to ,
let g:mapleader=","

" >> Telescope bindings
nnoremap <Leader>pp <cmd>lua require'telescope.builtin'.builtin{}<CR>

" most recently used files
nnoremap <Leader>m <cmd>lua require'telescope.builtin'.oldfiles{}<CR>

" find buffer
nnoremap ; <cmd>lua require'telescope.builtin'.buffers{}<CR>

" find in current buffer
nnoremap <Leader>/ <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>

" bookmarks
nnoremap <Leader>' <cmd>lua require'telescope.builtin'.marks{}<CR>

" git files
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.git_files{}<CR>

" all files
nnoremap <Leader>bfs <cmd>lua require'telescope.builtin'.find_files{}<CR>

nnoremap <Leader>bb <cmd>lua require'telescope.builtin'.file_browser{}<CR>

" ripgrep like grep through dir
nnoremap <Leader>rg <cmd>lua require'telescope.builtin'.live_grep{}<CR>

" pick color scheme
nnoremap <Leader>cs <cmd>lua require'telescope.builtin'.colorscheme{}<CR>


" >> setup nerdcomment key bindings
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1

xnoremap <Leader>ci <cmd>call NERDComment('n', 'toggle')<CR>
nnoremap <Leader>ci <cmd>call NERDComment('n', 'toggle')<CR>


" >> Lsp key bindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K     <cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <C-n> <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ga    <cmd>Lspsaga code_action<CR>
xnoremap <silent> ga    <cmd>Lspsaga range_code_action<CR>
nnoremap <silent> gs    <cmd>Lspsaga signature_help<CR>

lua <<EOF
require("lsp")
require("treesitter")
require("statusbar")
require("completion")
require('nvim-autopairs').setup{}
require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = false,  -- auto select first item
  map_char = { -- modifies the function or method delimiter by filetypes
    all = '(',
    tex = '{'
  }
})


vim.o.hidden          = true                        --- Required to keep multiple buffers open multiple buffers
vim.o.encoding        = "utf-8"                     --- The encoding displayed
vim.o.fileencoding    = "utf-8"                     --- The encoding written to file
vim.o.splitright      = true                        --- Vertical splits will automatically be to the right
vim.o.updatetime      = 100                         --- Faster completion
vim.o.timeoutlen      = 300                         --- Faster completion
vim.o.mouse           = "a"                         --- Enable mouse
vim.o.smartcase       = true                        --- Uses case in search
vim.o.smarttab        = true                        --- Makes tabbing smarter will realize you have 2 vs 4
vim.bo.smartindent    = true                        --- Makes indenting smart
vim.bo.shiftwidth     = 2                           --- Change a number of space characeters inseted for indentation
vim.o.shiftwidth      = 2                           --- Change a number of space characeters inseted for indentation
vim.o.showtabline     = 2                           --- Always show tabs
vim.o.tabstop         = 2                           --- Insert 2 spaces for a tab
vim.bo.tabstop        = 2                           --- Insert 2 spaces for a tab
vim.o.softtabstop     = 2                           --- Insert 2 spaces for a tab
vim.bo.softtabstop    = 2                           --- Insert 2 spaces for a tab
vim.o.autoindent      = true                        --- Good auto indent
vim.o.errorbells      = false                       --- Disables sound effect for errors
vim.wo.number         = true                        --- Shows current line number
vim.wo.relativenumber = true                        --- Enables relative number
vim.wo.cursorline     = true                        --- Highlight of current line
vim.wo.wrap           = false                       --- Display long lines as just one line
vim.o.backup          = false                       --- Recommended by coc
vim.o.writebackup     = false                       --- Recommended by coc
vim.o.swapfile        = false                       --- Recommended by coc
vim.o.incsearch       = true                        --- Start searching before pressing enter
vim.o.conceallevel    = 0                           --- Show `` in markdown files
vim.o.backspace       = "indent,eol,start"          --- Making sure backspace works
vim.o.lazyredraw      = true                        --- Makes macros faster & prevent errors in complicated mappings
vim.o.wildignore      = "*node_modules/**"          --- Don't search inside Node.js modules (works for gutentag)
vim.o.scrolloff       = 8                           --- Always keep space when scrolling to bottom/top edge
vim.o.termguicolors   = true                        --- Correct terminal colors
vim.o.signcolumn      = "yes"                       --- Add extra sign column next to line number
vim.o.completeopt     = "menuone,noselect"          --- Better autocompletion
vim.o.foldtext        = "CustomFold()"              --- Emit custom function for foldtext
vim.o.shortmess       = vim.o.shortmess .. 'c'            --- Don't pass messages to |ins-completion-menu|
vim.o.expandtab       = true
vim.bo.expandtab      = true
EOF

