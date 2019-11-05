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

" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

Plug 'w0rp/ale'

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'Lenovsky/nuake'
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
Plug 'osyo-manga/vim-over'
Plug 'janko/vim-test'

Plug 'alvan/vim-closetag'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'
Plug 'tommcdo/vim-exchange'

Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
" Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'
Plug 'posva/vim-vue'
Plug 'hdima/python-syntax'
Plug 'vim-scripts/autohotkey-ahk'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'hail2u/vim-css3-syntax'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'joaohkfaria/vim-jest-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'wellle/targets.vim'
Plug 'machakann/vim-highlightedyank'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'
" Plug 'jremmen/vim-ripgrep'

" Plug 'TaDaa/vimade'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'srcery-colors/srcery-vim'
call plug#end()

" set t_Co=256

set lazyredraw

filetype plugin indent on
syntax enable

set background=dark
colorscheme palenight
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

set hidden

if has('gui_running')
	set guifont=DejaVu_Sans_Mono_for_Powerline:h12
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set ttimeoutlen=50
endif

set cmdheight=2
set updatetime=300
set shortmess+=c

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
" Works well for javascript
set cino=j1J1
set completeopt-=preview


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
nnoremap D dd
nnoremap <C-E> :e <C-r>=expand('%:p:h')<CR>/

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

nmap <Leader>f :FZF<CR>
nmap <Leader><Space> :FZF<CR>
nmap <Leader><TAB> :Buffers<CR>
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>s :RgRaw 
nmap <leader>t :vert term zsh<CR><C-w>L

" Window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-j> <C-w>j
tnoremap <C-h> <C-w>h
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l

" Buffer navigation
nnoremap <A-h> :bp<CR>
nnoremap <A-l> :bn<CR>

nnoremap ˛ :bp<CR>
nnoremap ﬁ :bn<CR>

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

" Quickfix navigation
nnoremap <A-n> :cn<CR>
nnoremap <A-p> :cp<CR>

nnoremap ‘ :cn<CR>
nnoremap π :cp<CR>

let g:javascript_plugin_flow = 1

" Terminal mode
tnoremap <C-n> <C-w>N
" tnoremap <C-q> <C-w>:bd!<CR>

tnoremap <C-Tab> <C-w>:tabn<CR>
tnoremap <C-S-Tab> <C-w>:tabp<CR>

nnoremap <C-Tab> :tabn<CR>
nnoremap <C-S-Tab> :tabp<CR>

nnoremap ° :Nuake<CR>
inoremap ° <C-\><C-n>:Nuake<CR>
tnoremap ° <C-\><C-n>:Nuake<CR>

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

let g:polyglot_disabled = ['jsx']
let g:jsx_ext_required = 0
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,javascript.jsx,javascript'
"let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`','<':'>'}
let g:AutoPairsMoveCharacter = ''
let g:AutoPairsShortcutFastWrap = ''

" Airline Config
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
let g:airline_powerline_fonts = 1
" End Airline Config

" let g:vimade = {
"   \ "normalid": '',
"   \ "basefg": '',
"   \ "basebg": '',
"   \ "fadelevel": 0.6,
"   \ "colbufsize": 30,
"   \ "rowbufsize": 30,
"   \ "checkinterval": 32,
" \ }

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

let g:UltiSnipsExpandTrigger="<c-F9>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:user_emmet_leader_key='<c-8>'

function! ExpandSnippetOrEmmet()
  if len (UltiSnips#SnippetsInCurrentScope()) > 0
    return "\<c-r>=UltiSnips#ExpandSnippet()\<CR>"
  else
    return " \<BS>\<plug>(emmet-expand-abbr)"
  endif
endfunction

imap <expr> <C-e> ExpandSnippetOrEmmet()

if has('python3')
    let g:UltiSnipsExpandTrigger="<c-e>"
    " call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
    "     \ 'name': 'ultisnips',
    "     \ 'whitelist': ['*'],
    "     \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
    "     \ }))
endif

" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <silent><expr> <S-TAB>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>check_back_space() ? "\<S-TAB>" :
      \ coc#refresh()
