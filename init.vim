set rtp +=~/.vim

" =============================== Plugins ===============================
call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Mofiqul/dracula.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'maksimr/vim-jsbeautify'
Plug 'jparise/vim-graphql'
Plug 'vim-test/vim-test'
Plug 'Asheq/close-buffers.vim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'michaeldyrynda/carbon'

call plug#end()

filetype plugin on

" ============================= KeyBindings =============================

" ----> NERDTree 
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" ctrl+t toggle for nerdtree
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <Leader>n :NERDTreeFind<CR> :wincmd p<CR>

" ----> FZF (Fuzzy File Search)
nnoremap <C-p> :GFiles<Cr>
nnoremap <C-b> :Buffers<Cr>

" tabs with airlines
nnoremap <C-l> :bnext<cr>
nnoremap <C-h> :bprev<cr>

" common leader mappings
let g:mapleader = " "

" switch to previous buffer
nnoremap <Leader><Leader> <C-^>

" close current buffer
nnoremap <Leader>w :bd!<CR>

" close buffers other than the current one
nnoremap <Leader>do :Bdelete other<CR>

" select a buffer to close
nnoremap <Leader>ds :Bdelete select<CR>

" save and source current file
nnoremap <Leader>so :w \| :source %<CR>

" rotate between relative, regular, or no line numbers
nnoremap <Leader>i :set invnumber<CR>

" tests
nmap <Leader>t :TestFile<CR>
nmap <Leader>ts :TestSuite<CR>

" Git
nnoremap <Leader>g :Git<CR>
" > history of last 100 commits
nnoremap <Leader>gl :Gclog -100<CR>
" > commit history of current file
nnoremap <Leader>gf :0Gclog -100<CR>

" sessions
nnoremap <Leader>os :OpenSession<CR>

" terminal
tnoremap <Esc> <C-\><C-n>

" mapping to enable indent folding
nnoremap <Leader>ef :set foldmethod=indent<CR>

" ============================ Vim-Session ==============================
let g:session_autosave = "yes"

" ============================== Vim-Test ===============================
let test#strategy = "neovim"

" ============================ Vim-Airlines =============================
let g:airline_theme="gruvbox"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


" ========================== General Settings ===========================
colorscheme gruvbox
set background=dark " gruvbox has dark and light modes
if has("termguicolors")
  set termguicolors
endif

set relativenumber

filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

map <C-f> :call RangeJsBeautify()<cr>

