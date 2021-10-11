local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local install_cmd = string.format('10split |term git clone --depth 1 https://github.com/wbthomason/packer.nvim %s',install_path)
if fn.empty(fn.glob(install_path)) > 0 then
  execute(install_cmd)
end
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use "rafamadriz/friendly-snippets"
  use 'mhartington/formatter.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'kyazdani42/nvim-web-devicons'
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use {
    'hoob3rt/lualine.nvim', -- This thing is useless
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

end)
--Global setting
vim.g.mapleader = ","
vim.opt.backup = false -- don't use backup files
vim.opt.writebackup = false -- don't backup the file while editing
vim.opt.swapfile = false -- don't create swap files for new buffers
vim.opt.updatecount = 0 -- don't write swap files after some number of updates
vim.o.termguicolors = true
vim.g.nvcode_termcolors=256
vim.cmd[[colorscheme onedark]]
vim.o.hidden  = true  --- Required to keep multiple buffers open multiple buffers
-- Tab control
vim.opt.smarttab = true -- tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
vim.opt.tabstop = 2 -- the visible width of tabs
vim.opt.softtabstop = 2 -- edit as if the tabs are 4 characters wide
vim.opt.shiftwidth = 2 -- number of spaces to use for indent and unindent
vim.opt.shiftround = true -- round indent to a multiple of 'shiftwidth'
vim.o.expandtab = true
vim.opt.list = true
vim.opt.listchars = {
  tab = "→ ",
  trail = "⋅",
  extends = "❯",
  precedes = "❮"
}
vim.opt.backspace = {"indent", "eol,start"} -- make backspace behave in a sane manner
vim.opt.mouse = "a" 
vim.o.scrolloff = 8    --- Always keep space when scrolling to bottom/top edge
vim.wo.number = true   --- Shows current line number
vim.wo.relativenumber = true   --- Enables relative number
vim.wo.cursorline     = true   --- Highlight of current line
vim.o.completeopt = "menu,menuone,noselect"  --- Better autocompletion

--Treesitter config
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  },
  ensure_installed = "javascript",
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
}

--LSP configs
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', ']ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end
local servers = { 'tsserver' } -- List of language server

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = on_attach,
  }
end

local remap = vim.api.nvim_set_keymap
-- nvim-cmp onfigs
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({    
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer' },
  }
})
-- Autopair config for nvim-cmp
require('nvim-autopairs').setup{}
require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = true, -- automatically select the first item
  insert = true, -- use insert confirm behavior instead of replace
  map_char = { -- modifies the function or method delimiter by filetypes
  all = '(',
  tex = '{'
}
})
-- Format file using prettier
require('formatter').setup({
  filetype = {
    javascript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
          stdin = true
        }
      end
    },
  }
})
require('lualine').setup{
  options = { theme  = 'onedark' },
}

-- Telescope mapping
remap('n', '<Leader>ff', [[:lua require('telescope.builtin').find_files()<CR>]], { noremap=true, silent=true })
remap('n', '<Leader>m', [[:lua require('telescope.builtin').oldfiles()<CR>]], { noremap=true, silent=true })
remap('n', '<Leader>;', [[:lua require('telescope.builtin').buffers()<CR>]], { noremap=true, silent=true })
remap('n', '<Leader>cs', [[:lua require('telescope.builtin').colorscheme()<CR>]], { noremap=true, silent=true })
remap('n', '<Leader>fb', [[:lua require('telescope.builtin').file_browser()<CR>]], {noremap=true, silent=true })
remap('n', '<Leader>.',  [[:lua require('telescope.builtin').pickers()<CR>]], { noremap=true, silent=true })

