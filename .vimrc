set nocompatible

filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call plug#begin()
" Plugin 'VundleVim/Vundle.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-commentary'
Plug 'yssl/AutoCWD.vim'
Plug 'vim-airline/vim-airline'
" Plug 'bkad/CamelCaseMotion'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', {'do':{->fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'antiagainst/vim-tablegen'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'tc50cal/vim-terminal'
Plug 'rhysd/vim-clang-format'


call plug#end()
" filetype plugin indent on

" set shell=/bin/zsh
set hlsearch
" " set autoindent
" set scrolloff=2
" set wildmode=longest,list
set nu
" set ts=2
" set sts=2
" set sw=4
" set autowrite
" set autoread
" set cindent
" set bs=eol,start,indent
" set history=256
" set laststatus=2
" " set paste
" " set shiftwidth=2
" set showmatch
" " set formatoptions-=c
" " set formatoptions-=l
" " set formatoptions-=b
" " set formatoptions-=1
" " set formatoptions-=p
" set smartcase
" set smarttab
" set smartindent
" set softtabstop=2
" set tabstop=2
" set expandtab
" set ruler
set incsearch
set background=dark
" set foldenable
" set foldlevelstart=10
" set foldnestmax=10
" set foldmethod=syntax
" set completeopt-=preview
" set t_Co=256
" set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
" set termguicolors
" set runtimepath+=~/.vim/bundle/auto-pairs
set encoding=utf-8
" set fileencodings=utf-8
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
" set wrapmargin=0
" set textwidth=0
" set formatoptions-=t
set nowrap


au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\ exe "norm g`\"" |
			\ endif
if $LANG[0]=='k' && $LANG[1]=='o'
	set fileencoding=korea
endif

if has("syntax")
	syntax on
endif

if has('python3')
	python3 import sys
endif

if has("persistent_undo")
	let target_path = expand('~/.undodir')
	" create the directory and any parent directories
	" if the location does not exist.
	if !isdirectory(target_path)
		call mkdir(target_path, "p", 0700)
	endif

	let &undodir=target_path
	set undofile
	set undolevels=500                      " max undos stored
	set undoreload=10000
endif

"powerline setting
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256 colours)

" autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd BufNewFile,BufRead *.td setlocal filetype=tablegen
autocmd BufNewFile,BufRead *.ll setlocal filetype=llvm
autocmd BufNewFile,BufRead *.rst setlocal filetype=rest

nmap <F9> :rightb term<CR>
nmap <F10> :rightb vert term<CR>
let g:formatterpath = ['/usr/bin/clang-format-10']
" let g:formatterpath = ['/usr/lib/llvm-14/bin']
" noremap <F3> : Autoformat<CR>
let ftexclude = ['python', 'markdown', 'text', 'llvm']
" au BufWrite * :Autoformat
let g:leave_my_textwidth_alone=1
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
au BufWrite * if index(ftexclude, &ft) < 0 | :Autoformat
" autocmd BufWrite *.md set noautoindent nosmartindent noautowrite nosmarttab

let g:ycm_confirm_extra_conf = 0

" set viewoptions-=curdir
set sessionoptions-=blank
let mapleader=","
let g:tex_flavor = "latex"
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert='<C-b>'
let g:AutoPairsShortcutFastWrap='<C-e>'
"airline
" let g:airline_theme='powerlineish'
let g:airline_theme='bubblegum'
"let g:airline_powerline_fonts = 1

" You Complete Me
let &rtp .= ',' . expand( '<sfile>:p:h' )
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>p :YcmCompleter GetParent<CR>
nnoremap <leader>rf :YcmCompleter GoToReferences<CR>
nnoremap <leader>f :YcmCompleter FixIt<CR>
nnoremap <leader>e :YcmDiags<CR>

"camelcase
let g:camelcasemotion_key = '<leader>'
let NERDTreeShowHidden=0
let g:NERDTreeSplit= "right"

"fugitive
autocmd FileType gitcommit set foldmethod=syntax
" fzf.vim
set rtp+=~/.fzf
nnoremap <leader><leader>f :Files<CR>
nnoremap <leader><leader>g :GFiles?<CR>
nnoremap <leader><leader>b :Buffers<CR>
nnoremap <leader><leader>m :Marks<CR>
nnoremap <leader><leader>l :Lines<CR>
nnoremap <leader><leader>s :Snippets<CR>
nnoremap <leader><leader>c :Commits<CR>

" LLVM File Format Setting
let g:markdown_fenced_languages = ['mlir']

" NERDTree Setting
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>r :NERDTreeRefreshRoot<CR>
nnoremap <F5> :UndotreeToggle<CR>
nmap <F8> :NERDTreeToggle<CR>
""""
" let g:NERDTreeGitStatusShowClean = 1 " default: 0
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
			\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

autocmd FileType vim let g:AutoPairs = {}
autocmd FileType markdown let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '```':'```', '"""':'"""', "'''":"'''"}

" auto-enabling auto formatting
autocmd FileType c, cpp, cuda ClangFormatAutoEnable
