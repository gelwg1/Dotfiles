--vim.cmd[[colorscheme tokyonight]]
vim.cmd[[colorscheme onedark]]


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
