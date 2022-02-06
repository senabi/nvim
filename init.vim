call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-unimpaired'
" Yes, I am a sneaky snek now
Plug 'ambv/black'
Plug 'neovim/nvim-lspconfig'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
"Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'
" Plug 'github/copilot.vim'
Plug 'nvim-lua/lsp_extensions.nvim'
" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
call plug#end()

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

nmap <A-k> [e 
nmap <A-j> ]e 
vmap <A-k> [egv
vmap <A-j> ]egv
"sets
set guicursor=
set nu
set nohlsearch
set relativenumber
set hidden "keeps open
set nowrap
set noswapfile
set nobackup
set incsearch
set scrolloff=8
set tabstop=2 "softtabstop=2
set shiftwidth=2
set list
set listchars=eol:¬,tab:>-,trail:-,space:•
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

" for both
let mapleader = " "

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

"prime 
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap <C-j> :m '>+1<CR>gv=gv
" vnoremap <C-k> :m '<-2<CR>gv=gv
" noremap <C-j> :m '>+1<CR>gv=gv
" noremap <C-k> :m '<-2<CR>gv=gv

"single line
" nmap <C-k> [e 
" nmap <C-j> ]e 
" "multi line
" vmap <C-k> [egv
" vmap <C-j> ]egv
