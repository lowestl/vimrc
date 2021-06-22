set nocompatible

"Plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-scripts/autohotkey-ahk'

Plug 'zsugabubus/crazy8.nvim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
		Plug 'zerowidth/vim-copy-as-rtf'
  endif
endif

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'joaohkfaria/vim-jest-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'wellle/targets.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'francoiscabrol/ranger.vim'
" We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'

" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

" Plug 'pechorin/any-jump.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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

set t_Co=256

" set lazyredraw

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" filetype plugin indent on
syntax enable

set background=dark
colorscheme palenight
hi SpellBad gui=underline
set fillchars+=vert:│

set cc=80

set encoding=utf-8
" set nu rnu
set noshowmode
set showmatch
set hlsearch incsearch
if has("nvim")
	set inccommand=nosplit
endif
set smartcase ignorecase

set scrolloff=2

set wildmenu wic

set clipboard=unnamedplus

set path+=**

set undofile
if has("nvim")
  set directory=~/.nvim/swapfiles//
  set undodir=~/.nvim/undofiles//
else
  set directory=~/.vim/swapfiles//
  set undodir=~/.vim/undofiles//
endif

set hidden

if has('gui_running')
	set guifont=DejaVu_Sans_Mono_for_Powerline:h12
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set ttimeoutlen=50
endif

set cmdheight=1
set updatetime=300
set shortmess+=c

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
" Works well for javascript
set cino=j1J1
set completeopt-=preview

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" å/ä/ö might cause issues without unmapping them
silent! iunmap å
silent! iunmap ä
silent! iunmap ö

let mapleader = "\<Space>"
nmap <Space> <nop>
nnoremap € $
nnoremap ö {
nnoremap ä }
nnoremap Ö {
nnoremap Ä }
nnoremap D dd
nnoremap <C-E> :e %:h/
nnoremap <C-S-e> :e %:h/

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

" Telescope
" nmap <Leader><Space> <cmd>Telescope find_files<CR>
" nmap <Leader><TAB> <cmd>Telescope buffers<CR>
" nmap <Leader>s <cmd>Telescope live_grep<CR>

" FZF
nmap <Leader><Space> :Files<CR>
nmap <Leader><TAB> :Buffers<CR>
nmap <Leader>r :History<CR>
nmap <Leader>s :Rg<CR>
nmap <Leader>S :RgRaw

nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>

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

nnoremap ° :Nuake<CR>
inoremap ° <C-\><C-n>:Nuake<CR>
tnoremap ° <C-\><C-n>:Nuake<CR>

noremap x "_x
noremap X "_X

nmap <silent> <C-S-n> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-n> <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)

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

let g:ranger_replace_netrw = 1

let g:vim_jsx_pretty_disable_tsx  = 1

let g:closetag_filetypes = 'javascript,typescript,javascript.jsx,typescript.tsx,javascriptreact,typescriptreact,jsx,tsx,html,xhtml,phtml'
let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript.jsx': 'jsxRegion',
      \ 'typescript': 'jsxRegion,tsxRegion',
      \ 'javascript': 'jsxRegion',
      \ 'typescriptreact': 'jsxRegion,tsxRegion',
      \ 'javascriptreact': 'jsxRegion',
      \ }

"let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`','<':'>'}
let g:AutoPairsMoveCharacter = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoParisShortcutJump = ''
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutToggle = ''

" Airline Config
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
let g:airline_powerline_fonts = 1
let g:airline_theme = "palenight"
" End Airline Config

let g:tmuxline_preset = {
      \'a'    : '#H',
      \'b'    : '#(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD)',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'y'    : '%a %R'}

" FZF Config
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" End FZF Config

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

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

autocmd BufNewFile,BufRead *.ts.flow set syntax=javascript

" Cursor to yellow on insert mode
" Blue on command/other mode
" Note the use of hex codes (ie 3971ED)
if exists('$TMUX')
  let &t_EI = "\<Esc>Ptmux;\<Esc>\033]Pl3971ED\033\\"
  let &t_SI = "\<Esc>Ptmux;\<Esc>\033]PlFBA922\033\\"
  silent !echo -ne "\<Esc>Ptmux;\<Esc>\033]Pl3971ED\033\\"
  autocmd VimLeave * silent !echo -ne "\<Esc>Ptmux;\<Esc>\033]Pl3971ED\033\\"
else
  let &t_EI = "\033]Pl3971ED\033\\"
  let &t_SI = "\033]PlFBA922\033\\"
  silent !echo -ne "\033]Pl3971ED\033\\"
  autocmd VimLeave * silent !echo -ne "\033]Pl3971ED\033\\"
endif
