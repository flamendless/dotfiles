set path+=**
set wildmode=longest,list,full
set wildmenu
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*
set nocompatible
set background=dark
set termguicolors
set t_Co=256
set pastetoggle=<F4>
set number
set formatoptions=qrn1
set encoding=UTF-8
set iskeyword-=.
set incsearch
set nohlsearch
set completeopt=longest,menuone,noselect
set shortmess+=c
set noet ci pi sts=4 sw=4 ts=4
set wrap
set backspace=indent,eol,start
set clipboard=unnamedplus
set ruler
set hidden
set laststatus=2
set showtabline=2
set ttyfast
set scrolloff=5
set cursorline
set list
set listchars=""
set listchars=tab:·›
set listchars+=trail:·
set listchars+=trail:·
set listchars+=extends:>
set listchars+=precedes:<
set autoindent
set wildignorecase
set undofile
set undolevels=1000
set undoreload=10000
set autoread
set showmatch
set noswapfile
set updatetime=100
set showmode
set showcmd
set cc=88
set fo+=t
set smartcase
set ignorecase

call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-eunuch'
Plug 'xolox/vim-misc'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'rbong/vim-crystalline'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'bkad/CamelCaseMotion'
Plug 'davisdude/vim-love-docs', { 'branch': 'build' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'preservim/tagbar'
Plug 'vim-scripts/AnsiEsc.vim'
call plug#end()

lua require("lsp")

if executable('rg')
	let g:rg_derive_root='true'
endif

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
let loaded_matchparen = 1
let mapleader = " "
colorscheme gruvbox
filetype plugin on
filetype indent on
syntax enable

nnoremap <space><space> <C-w>w
nnoremap fh :CtrlPMRUFiles<CR>
nnoremap <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>
nnoremap <F3> :noh<CR>
nnoremap H ^
nnoremap L $
nnoremap ss ciw
nnoremap j gj
nnoremap k gk
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
map <S-k> <Nop>
map <C-a> <esc>ggVG<CR>
nnoremap <leader>o <C-w>o
nnoremap <leader>b :bprevious<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <space>v :vsplit<CR>
nnoremap <space>h :split<CR>
cmap w!! w !sudo tee % >/dev/null
nnoremap <leader>r :so $MYVIMRC<CR>
nnoremap <leader>s :Rg <C-r><C-w><CR>
nnoremap <leader>t :CtrlPTag<cr>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :SymbolsOutline<CR>
nnoremap gh :ClangdSwitchSourceHeader<CR>

let g:ctrlp_working_path_mode = ''
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|output|libs|build|node_modules',
  \ 'file': '\v\.(exe|dll)$',
  \ }
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'molokai'
let maplocalleader="\<space>"

function! SetLove()
	if filereadable("build.sh")
		nnoremap <leader>l :!sh build.sh run &&<CR>
		nnoremap <leader>c :!sh build.sh rebuild &&<CR>
	elseif filereadable("Makefile")
		nnoremap <leader>l :!make &&<CR>
	else
		nnoremap <leader>l :!love . &&<CR>
	endif
endfunction

function! SetCPP()
	if filereadable("build.sh")
		nnoremap <leader>r :!sh build.sh run<CR>
		nnoremap <leader>l :!sh build.sh compile && sh build.sh run<CR>
	endif
endfunction

function! StatusLine(current, width)
  return (a:current ? crystalline#mode() . '%#Crystalline#' : '%#CrystallineInactive#')
        \ . ' %f%h%w%m%r '
        \ . (a:current ? '%#CrystallineFill#' : '')
        \ . '%=' . (a:current ? '%#Crystalline# %{&paste?"PASTE ":""}%{&spell?"SPELL ":""}' . crystalline#mode_color() : '')
        \ . (a:width > 80 ? ' %{&ft}[%{&enc}][%{&ffs}] %l/%L %c%V %P ' : ' ')
endfunction

function! TabLine()
  let l:vimlabel = has("nvim") ?  " NVIM " : " VIM "
  return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
endfunction

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
" let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:fzf_layout = {'down': '50%'}

autocmd FileType lua call SetLove()
autocmd BufNewFile,BufRead *.cpp call SetCPP()
autocmd BufNewFile,BufRead *.hpp call SetCPP()
autocmd BufRead,BufNewFile *.lua2p setfiletype lua
autocmd BufNewFile,BufRead *.lua2p call SetLove()
autocmd BufNewFile,BufRead *.lua2p set syntax=lua
autocmd BufNewFile,BufRead *.lua2p set commentstring=--\ %s
autocmd BufNewFile,BufRead *.log :AnsiEsc
autocmd BufNewFile,BufRead *.png :!feh % &
autocmd BufWritePost *.Xdefaults :!xrdb ~/.Xdefaults

hi Normal guibg=NONE ctermbg=NONE "for transparency
hi CurrentWord ctermbg=53
hi CurrentWordTwins ctermbg=237
