
set encoding=UTF-8
set expandtab
set shiftwidth=2
set tabstop=2
set bg=dark
set number
colorscheme gruvbox

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"

let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
command! -nargs=0 Prettier :CocCommand prettier.formatFile

nnoremap <silent> <C-f> :Files<CR>


set termguicolors
set autoindent		" auto indentation
set incsearch		" incremental search
set nobackup		" no *~ backup files
set noswapfile
set copyindent		
set ignorecase		
set smartcase
set smarttab	
set ttymouse=sgr
set mouse=a
set timeoutlen=1000 ttimeoutlen=0
syntax on 

filetype indent on
let g:user_emmet_leader_key=','
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:AutoPairsShortcutFastWrap = '<C-e>'
let g:AutoPairsShortcutJump = '<C-l>'
let g:NERDTreeWinSize=25
let g:deoplete#enable_at_startup = 0
let g:coc_global_extensions = ['coc-tsserver']
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

call plug#begin()

Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight',
Plug 'junegunn/fzf.vim',
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } },
Plug 'neoclide/coc.nvim', {'branch': 'release'},
Plug 'SirVer/ultisnips',
Plug 'mlaursen/vim-react-snippets',
Plug 'yuezk/vim-js',
Plug 'maxmellon/vim-jsx-pretty',
Plug 'preservim/nerdtree',
Plug 'tpope/vim-commentary',
Plug 'vim-airline/vim-airline',
Plug 'vim-airline/vim-airline-themes',
Plug 'mattn/emmet-vim',
Plug 'morhetz/gruvbox',
Plug 'jiangmiao/auto-pairs',
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()
