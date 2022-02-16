call plug#begin('~/.local/share/nvim/plugged')
Plug 'ambv/black'
Plug 'tpope/vim-unimpaired'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'
" Plug 'github/copilot.vim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'folke/lsp-colors.nvim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
call plug#end()

"Sets
set exrc "custom vimrc
set guicursor=
set nu
set nohlsearch
set relativenumber
set hidden "keeps open
set nowrap
set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undodir "undotree
set undofile "undotree plugin
set incsearch
set scrolloff=8
" set colorcolumn=80
set signcolumn=yes
"tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
"colors
set termguicolors
"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set list

"set listchars=eol:¬,tab:>-,trail:-,space:•
set signcolumn=yes
set isfname+=@-@
set updatetime=50
set cmdheight=1
set timeoutlen=1000

"other sets
set path+=**
" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
" Set completeopt to have a better completion experience
set completeopt=menu,menuone,noselect

colorscheme nord
highlight Normal guibg=#212121
highlight SignColumn guibg=#212121

let mapleader = " "
"move lines
nmap <A-k> [e
nmap <A-j> ]e
vmap <A-k> [egv
vmap <A-j> ]egv
nnoremap <leader>e :Ex<CR>
"telescope
"git
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
"fuzzy grep
nnoremap <leader>gf :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ")})<CR>
"file finder
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
"buffer finder
nnoremap <leader>bf :lua require('telescope.builtin').buffers()<CR>
"git branches
nnoremap <leader>gc :lua require('nabi.telescope').git_branches()<CR>
"word finder
nnoremap <leader>wf :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
" livegrep
nnoremap <leader>rg <cmd>lua require('telescope.builtin').live_grep()<cr>
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"cmp
imap <silent><expre> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<CR>
snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<CR>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<CR>
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

"lsp
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_winsize = 25
"lsp
let g:completion_enable_auto_popup = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

"xnormap : visual & block mode
xnoremap <leader>p "_dP
nnoremap <leader>p "+P
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

lua << END
--lualine.nvim
require('lualine').setup()
--cmp & lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local source_mapping = {
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[Lua]",
  cmp_tabnine = "[TBN]",
  path = "[Path]",
}
local lspkind = require('lspkind')
require'lspkind'.init({
  mode = true,
})
local luasnip = require('luasnip')
local cmp = require('cmp')
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line-1, line, true)[1]:sub(col, col):match("%s") == nil
end
cmp.setup({
  snippet = {
      expand = function(args)
                  require('luasnip').lsp_expand(args.body)
               end,
    },
  mapping = {
      --['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4),{'i', 'c'}),
      --['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
      --['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
      --['<C-y>'] = cmp.config.disable,
      ['<Esc>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, {"i", "s"}),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {"i", "s"}),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
    { name = "luasnip" },
    { name = "cmp_tabnine" },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_mapping[entry.source.name]
      if entry.source.name == 'cmp_tabnine' then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. ' ' .. menu
        end
        vim_item.kind = ''
      end
      vim_item.menu = menu
      return vim_item
    end
  }
})
local tabnine = require('cmp_tabnine.config')
tabnine:setup({
  max_lines = 1000;
  max_num_results = 20;
  sort = true;
  run_on_every_keystroke = true;
  snippet_placeholder = '..';
})
local function config(_config)
  return vim.tbl_deep_extend("force", {
      capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      }, _config or {})
end
require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
require('lspconfig').pylsp.setup{}
require('lspconfig').rust_analyzer.setup{}
--require('lspconfig').rust_analyzer.setup(config({
--cmd = { "rustup", "run", "nightly", "rust-analyzer"},
--root_di = root_pattern("Cargo.toml", "rust-project.json")
--}))
END


fun! TrimWhitespace()
  let l:save=winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
augroup group
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END
autocmd CursorHold,CursorHoldI *.rs,*.c :lua require'lsp_extensions'.inlay_hints{ enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }
autocmd BufWritePre *.go,*.rs,*.zip,*.c,*.py :lua vim.lsp.buf.formatting()
