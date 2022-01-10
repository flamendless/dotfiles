let mapleader = " "
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
set wildmenu
set wildmode=list,full
set completeopt=longest,menuone
set shortmess+=c
set omnifunc=syntaxcomplete#Complete
set noet ci pi sts=4 sw=4 ts=4
set autoread
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
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set autoindent
set wildignorecase
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*
set undofile
set undolevels=1000
set undoreload=10000
set undodir=~/.vim/_undo
set autoread
set showmatch
set noswapfile
set updatetime=100
set showmode
set showcmd
set cc=88
" set tw=88
set fo+=t
set smartcase
set ignorecase

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'xolox/vim-misc'
Plug 'ntpeters/vim-better-whitespace'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'PotatoesMaster/i3-vim-syntax'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim', {'do': {-> fzf#install()}}
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'bkad/CamelCaseMotion'
Plug 'davisdude/vim-love-docs', { 'branch': 'build' }
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c++', 'cpp']}
Plug 'preservim/tagbar'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'liuchengxu/eleline.vim'
Plug 'ap/vim-buftabline'
Plug 'tikhomirov/vim-glsl'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/vim-cursorword'
Plug 'sheerun/vim-polyglot'
Plug 'szw/vim-maximizer'

Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox

filetype plugin on
filetype indent on
syntax enable
set runtimepath+=~/.vim-plugins/LanguageClient-neovim
runtime macros/matchit.vim

nnoremap <space><space> <C-w>w
nnoremap fh :CtrlPMRUFiles<CR>
nnoremap <F1> *<C-O>:%s///gn<CR>
nnoremap <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>
nnoremap <F3> :noh<CR>
nnoremap H ^
nnoremap L $
nnoremap ss ciw
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
map <S-k> <Nop>
" imap <leader>f <C-x><C-f>
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
" inoremap <expr> <leader>f fzf#vim#complete#path('rg --files')
nnoremap <leader>t :CtrlPTag<cr>
nmap <F8> :TagbarToggle<CR>
nnoremap <leader>m :MaximizerToggle!<CR>

" GO TO VIM ULITMATE LEARNING EXPERIENCE!
" noremap  <Up> ""
" noremap! <Up> <Esc>
" noremap  <Down> ""
" noremap! <Down> <Esc>
" noremap  <Left> ""
" noremap! <Left> <Esc>
" noremap  <Right> ""
" noremap! <Right> <Esc>

let g:tagbar_map_showproto="<C-s>" "allow <leader><leader> when in tagbar
let g:LanguageClient_autoStart = 1
let g:ctrlp_working_path_mode = ''
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|output|libs|build|node_modules|new_assets',
  \ 'file': '\v\.(exe|dll)$',
  \ }

let maplocalleader="\<space>"
let g:buftabline_indicators = 1
let g:lua_syntax_nostdlib = 1

function! SetPython()
	nnoremap <leader>l :!python %<CR>
endfunction

function! SetGo()
	nnoremap <leader>l :!go run %<CR>
endfunction

function! SetJava()
	nnoremap <leader>l :!javac % && java %:r<CR>
endfunction

function! RunAndCheckLua()
	exec "!sh build.sh run && ".
		\ "sh build.sh check vim ".
		\ expand('%:p:h:t')."/".
		\ expand('%:t:r').".lua"
endfunction

function! CheckLua()
	exec "!./build.sh check vim ".
		\ expand('%:p:h:t')."/".
		\ expand('%:t:r').".lua"
endfunction

function! GetLoveDocs()
	let funcUnderCursor = expand("<cexpr>")
	let expr = "help love-" . funcUnderCursor
	execute expr
endfunction

function! SetLove()
	if filereadable("build.sh")
		" nnoremap <leader>l :!sh build.sh run &&<CR>
		nnoremap <leader>l :call RunAndCheckLua()<CR>
		nnoremap <leader>c :!sh build.sh rebuild &&<CR>
		nnoremap <leader>p :!sh build.sh profile &&<CR>
		" autocmd BufWritePost *.lua2p exec CheckLua()
	elseif filereadable("Makefile")
		nnoremap <leader>l :!make &&<CR>
	else
		nnoremap <leader>l :!love . &&<CR>
	endif
	nnoremap <leader>k :call GetLoveDocs()<CR>
endfunction

function! SetLua()
	syn keyword luaBuiltIn or and
	hi link luaSymbolOperator GruvboxOrange
	hi link luaParens GruvboxOrange
	hi link luaFuncParens GruvboxOrange
	syn match luaBuiltIn ":"
	syn match luaBuiltIn "\."
endfunction

function! SetLua2p()
	setfiletype lua
	set syntax=lua
	set commentstring=--\ %s
	call SetLua()

	syn match luaComment "!"
	syn match luaComment "@"
endfunction

function! SetC()
	if filereadable("Makefile")
		nnoremap <leader>l :make<CR>
	endif
endfunction

function! SetCPP()
	if filereadable("build.sh")
		nnoremap <leader>r :!sh build.sh run<CR>
		nnoremap <leader>l :!sh build.sh compile && sh build.sh run<CR>
	endif
endfunction


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
autocmd BufNewFile,BufRead *.c call SetC()
autocmd BufNewFile,BufRead *.cpp call SetCPP()
autocmd BufNewFile,BufRead *.hpp call SetCPP()
autocmd BufNewFile,BufRead *.py call SetPython()
autocmd BufNewFile,BufRead *.go call SetGo()
autocmd BufNewFile,BufRead *.java call SetJava()
autocmd BufNewFile,BufRead *.lua2p call SetLua2p()
autocmd BufNewFile,BufRead *.lua call SetLua()
autocmd BufNewFile,BufRead *.log :AnsiEsc
autocmd BufNewFile,BufRead *.ASM set syntax=asm
autocmd BufNewFile,BufRead *.png :!feh % &
autocmd BufNewFile,BufRead *.CPP set syntax=cpp
autocmd BufWritePost *.Xdefaults :!xrdb ~/.Xdefaults

hi Normal guibg=NONE ctermbg=NONE "for transparency
hi CurrentWord ctermbg=53
hi CurrentWordTwins ctermbg=237

if has("patch-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-@> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nmap <leader>rn <Plug>(coc-rename)

nmap <Leader>gh :CocCommand clangd.switchSourceHeader<CR>
nmap <Leader>cb <Plug>(coc-codeaction)
nmap <Leader>ca <Plug>(coc-codeaction-selected)<CR>
nmap <Leader>cr <Plug>(coc-calc-result-replace)
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
