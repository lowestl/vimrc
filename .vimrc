set nocompatible

"Plugins
call plug#begin('~/.vim/plugged')

"Plug 'Valloric/YouCompleteMe'

"Plug 'scrooloose/nerdtree'
"Plug 'yegappan/mru'
" Plug 'kien/ctrlp.vim'
" Plug 'ervandew/supertab'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

" Plug 'flowtype/vim-flow'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'w0rp/ale'
" Plug 'vim-syntastic/syntastic'

" Plug 'terryma/vim-expand-region'

Plug 'justinmk/vim-sneak'
Plug 'osyo-manga/vim-over'
" Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'

Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
" Plug 'maxmellon/vim-jsx-pretty'
Plug 'mxw/vim-jsx'
" Plug 'mattn/emmet-vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'posva/vim-vue'

Plug 'wellle/targets.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'alvan/vim-closetag'

Plug 'vim-scripts/autohotkey-ahk'
Plug 'isRuslan/vim-es6'

Plug 'vim-airline/vim-airline'
"Plug 'roman/golden-ratio'
Plug 'hdima/python-syntax'

Plug 'jremmen/vim-ripgrep'

"Color Schemes
" Plug 'romainl/Apprentice', {'branch': 'fancylines-and-neovim'}
" Plug 'AlessandroYorba/Sierra'
" Plug 'danilo-augusto/vim-afterglow'
" Plug 'exitface/synthwave.vim'
" Plug 'jansenfuller/crayon'
" Plug 'KeitaNakamura/neodark.vim'
" Plug 'Marfisc/vorange'
" Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'jdsimcoe/abstract.vim'
Plug 'tjammer/blayu'
Plug 'KKPMW/sacredforest-vim'
Plug 'nightsense/stellarized'
Plug 'nightsense/snow'
Plug 'kaicataldo/material.vim'
" Plug 'rakr/vim-two-firewatch'
" Plug 'rhysd/vim-color-spring-night'
" Plug 'trevordmiller/nova-vim'
" Plug 'tyrannicaltoucan/vim-deep-space'
" Plug 'tyrannicaltoucan/vim-quantum'
" Plug 'whatyouhide/vim-gotham'
" Plug 'YorickPeterse/happy_hacking.vim'

call plug#end()

set t_Co=256

set lazyredraw

filetype plugin indent on

set background=dark
colorscheme material
hi SpellBad gui=underline
set fillchars+=vert:│
let g:airline_theme="material"

set cc=80
"hi ColorColumn guibg=#303030

set number relativenumber
set noshowmode

set showmatch

set hlsearch incsearch
if has("nvim")
	set inccommand=nosplit
end

set scrolloff=2

set smartcase ignorecase

set wildchar=<Tab>
set wildmenu
set wildmode=full
set wic

set path+=**

"Remap
silent! iunmap å
silent! iunmap ä
silent! iunmap ö

let mapleader = "\<Space>"
nmap <Leader>n :nohl<CR>
nmap <Space> <nop>
nnoremap ¤ $
nnoremap ö {
nnoremap ä }
nnoremap Ö [
nnoremap Ä ]
nnoremap - /
nnoremap gs :Gstatus<CR>
nnoremap gS :Gstatus<CR>:q<CR>

nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap √ :m .+1<CR>==
nnoremap ª :m .-2<CR>==
inoremap √ <Esc>:m .+1<CR>==gi
inoremap ª <Esc>:m .-2<CR>==gi
vnoremap √ :m '>+1<CR>gv=gv
vnoremap ª :m '<-2<CR>gv=gv

vnoremap ¤ $
vnoremap ö {
vnoremap ä }
vnoremap - /
vnoremap > >gv
vnoremap < <gv
vnoremap = =gv

nmap ¨¨ :nohl<CR>
"set encoding=utf-8
nmap <Leader>r :CtrlPMRU<CR>
nmap <Leader>f :FZF<CR>
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>s :Rg 
nmap <C-n> n.
imap <C-BS> <C-w>
nmap <ESC><ESC> :nohl<ESC>

nmap <silent> <C-p> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*xhtml,*.jsx'
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

let g:polyglot_disabled = ['jsx', 'js']

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

set directory=~/.vim/swapfiles//

set undodir=~/.vim/undofiles//
set undofile

if has('gui_running')
	set guifont=DejaVu_Sans_Mono_for_Powerline:h13
endif

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
let g:indent_guides_space_guides = 0
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"autocmd BufEnter * silent! lcd %:p:h

" set noet ci pi sts=0 sw=2 ts=2
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" set ci

set cino=j1J1

let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

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
let g:ale_completion_enabled = 1
let g:ale_completion_max_suggestions = 6

let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

let g:asyncomplete_remove_duplicates = 1

let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1

if executable('flow-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'flow-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'flow-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.flowconfig'))},
        \ 'whitelist': ['javascript', 'javascript.jsx'],
        \ })
endif

set completeopt=menu,menuone,preview,noselect,noinsert

"Airline Config
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
let g:airline_powerline_fonts=1
set ttimeoutlen=50

let python_highlight_all = 1
let python_version_2 = 1

nmap <Leader>e <C-w>w
nmap <Leader>e <C-w>w
func! WordProcessorMode()
  setlocal fo=1t
  setlocal noexpandtab
  nmap j gj
  nmap k gk
  iabbrev <buffer> -- —
  setlocal spell spelllang=en_us
  set complete+=s
  setlocal wrap
  setlocal linebreak
  setlocal tw=80
endfu
com! WP call WordProcessorMode()

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

au FileType html,xhtml,xml,jsx,js let b:delimitMate_matchpairs = "(:),[:],{:}"

let g:AutoPairsShortcutFastWrap=''
let g:AutoPairsShortcutBackInsert=''
let g:AutoPairsShortcutJump=''
let g:AutoPairsMoveCharacter=''

nnoremap <expr> o NewParagraph()

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
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

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

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

function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v -a ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

nnoremap <silent> <Leader>t :call s:tags()
