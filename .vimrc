set nocompatible

" For Python support:
" brew install python
" brew install python3
" pip2 install neovim --upgrade
" pip3 install neovim --upgrade
if has('nvim')
  let g:python2_host_prog = '/usr/local/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'
endif

"Plugins
call plug#begin('~/.vim/plugged')

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

Plug 'w0rp/ale'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'justinmk/vim-sneak'
Plug 'osyo-manga/vim-over'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'

Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'hdima/python-syntax'
Plug 'vim-scripts/autohotkey-ahk'
Plug 'styled-components/vim-styled-components'
Plug 'hail2u/vim-css3-syntax'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'joaohkfaria/vim-jest-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'mattn/emmet-vim'

Plug 'wellle/targets.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'rakr/vim-one'
Plug 'romainl/Apprentice'
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'

call plug#end()

" set t_Co=256

set lazyredraw

filetype plugin indent on

set background=dark
colorscheme one
hi SpellBad gui=underline
set fillchars+=vert:│

set cc=80
set signcolumn=yes

set encoding=utf-8
set nu rnu
set noshowmode
set showmatch
set hlsearch incsearch
if has("nvim")
	set inccommand=nosplit
end
set smartcase ignorecase

set scrolloff=2

set wildmenu wic

set path+=**

set directory=~/.vim/swapfiles//
set undodir=~/.vim/undofiles//
set undofile

if has('gui_running')
	set guifont=DejaVu_Sans_Mono_for_Powerline:h13
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set ttimeoutlen=50
endif

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
" Works well for javascript
set cino=j1J1


" å/ä/ö might cause issues without unmapping them
silent! iunmap å
silent! iunmap ä
silent! iunmap ö

let mapleader = "\<Space>"
nmap <Space> <nop>
nnoremap € $
nnoremap ö {
nnoremap ä }
nnoremap Ö [
nnoremap Ä ]

vnoremap ¤ $
vnoremap ö {
vnoremap ä }
vnoremap - /
vnoremap > >gv
vnoremap < <gv
vnoremap = =gv

imap <C-BS> <C-w>

nmap <ESC><ESC> :nohl<CR>

nnoremap gs :Gstatus<CR>
nnoremap gS :Gstatus<CR>:q<CR>

nmap <Leader>r :CtrlPMRU<CR>
nmap <Leader>f :FZF<CR>
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>s :Rg 

" Window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Line manipulation
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Line manupilation on macos
nnoremap √ :m .+1<CR>==
nnoremap ª :m .-2<CR>==
inoremap √ <Esc>:m .+1<CR>==gi
inoremap ª <Esc>:m .-2<CR>==gi
vnoremap √ :m '>+1<CR>gv=gv
vnoremap ª :m '<-2<CR>gv=gv

func! NewParagraph()
	"if current line is last line, or current line is non-empty; insert new line
	if line(".")==line("$") || match(getline(line(".")), "^\s*$")<0
		return "o"
	else
		"if next line is non-empty, insert two new lines
		if match(getline(line(".")+1), "^\s*$")<0
			return "O\<CR>"
		endif

		return "o"
	endif
endfu

nnoremap <expr> o NewParagraph()

let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`','<':'>'}

" Airline Config
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
let g:airline_powerline_fonts = 1
" End Airline Config

" ALE Config
nmap <silent> <C-p> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)

let g:ale_linters = {
\ 'javascript': ['flow', 'eslint'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\   'css': ['prettier'],
\}

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_echo_msg_format = '%linter%: %s'

let g:ale_fix_on_save = 1
" End ALE Config

" FZF Config
let g:fzf_layout = { 'down': '~20%' }

" Customize fzf colors to match your color scheme
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

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>g :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
" End FZF Config

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:user_emmet_leader_key='<c-w>'
" Deoplete Config
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

if g:flow_path != 'flow not found'
  let g:deoplete#sources#flow#flow_bin = g:flow_path
endif
" End Deoplete Config
