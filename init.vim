
" add .vim directory to runtime path (needed for "plug")
set rtp +=~/.vim

" =============================== Plugins ===============================
call plug#begin()

Plug 'mhinz/vim-startify'
Plug 'karb94/neoscroll.nvim'
Plug 'rizzatti/dash.vim'
Plug 'stephpy/vim-yaml'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
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
Plug 'christoomey/vim-tmux-navigator'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mfussenegger/nvim-dap'
Plug 'w0rp/ale'

call plug#end()

filetype plugin on

" ============================= KeyBindings =============================

nnoremap <Leader>k <Plug>DashSearch

" NVIM-DAP

lua <<EOF
local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/source/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}
EOF

" ----> NERDTree 
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" ctrl+t toggle for nerdtree
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <Leader>n :NERDTreeFind<CR> :wincmd p<CR>

" ----> FZF (Fuzzy File Search)
nnoremap <C-p> :GFiles<Cr>
nnoremap <C-b> :Buffers<Cr>

" ----> QuickFix 
nnoremap <Leader>q :copen<CR>

" Tabs
" this character maps to "option+h" on MacOS
nnoremap ˙ :bprev<CR>
" this character maps to "option+l" on MacOS
nnoremap ¬ :bnext<CR>

" Pane switching
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

" markdown
nnoremap <Leader>mp :MarkdownPreview<CR>
nnoremap <Leader>mps :MarkdownPreviewStop<CR>

" quickfix navigation
nnoremap <Leader>co :copen<CR>
nnoremap <Leader>cn :cnext<CR>
nnoremap <Leader>cp :cprev<CR>

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

" source nvim init
nnoremap <Leader>sov :source ~/.config/nvim/init.vim<CR>

" rotate between relative, regular, or no line numbers
nnoremap <Leader>i :set invnumber<CR>

" tests
nmap <Leader>t :w \| :TestFile<CR>
nmap <Leader>tl :TestLast<CR>
nmap <Leader>ts :TestSuite<CR>

" Git
nnoremap <Leader>gg :Git<CR>
nnoremap <Leader>gc :Git commit<CR>
nnoremap <Leader>gp :Git push<CR>

nnoremap <Leader>gv :Gvdiffsplit
" > history of last 100 commits
nnoremap <Leader>gl :Gclog -100<CR>
" > commit history of current file
nnoremap <Leader>gf :0Gclog -100<CR>

" ale linter
nnoremap <Leader>ll :ALELint<CR>

" sessions
nnoremap <Leader>os :OpenSession<CR>

" terminal
tnoremap <Esc> <C-\><C-n>

" mapping to enable indent folding
nnoremap <Leader>ef :set foldmethod=indent<CR>

" Yank full path to current buffer 
nnoremap <Leader>yf :let @" = expand("%")<CR>

" Yank visual selection to OS clipboard
vnoremap <Leader>yc "*y

" ============================ Vim-Session ==============================
let g:session_autosave = "yes"

" ============================== Vim-Test ===============================
let test#strategy = "neovim"
let test#neovim#term_position = "bot"

" ============================ Vim-Airlines =============================
let g:airline_theme="nord"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" ============================= Ale Linter ==============================
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

let g:ale_sign_error = 'X'
let g:ale_sign_warning = '⚠️'

let g:ale_fix_on_save = 0

" ============================= NeoScroll ==============================
lua require('neoscroll').setup()

" ========================== General Settings ===========================
"
" 

colorscheme nord
set background=dark " gruvbox has dark and light modes

" this instructs vim to ignore the terminal app's colorscheme and use settings
" meant for the GUI version of Vim instead, which use 24-bit colors. Don't
" enable this if your theme requires the same theme from the terminal (like
" Nord theme)
"set termguicolors

set relativenumber

filetype plugin indent on

" On pressing tab, insert 2 spaces
" set expandtab

"show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" highlight current line
set cursorline

" new vertical splits are on the right
set splitright 

map <C-f> :call RangeJsBeautify()<cr>

" leading spaces and tabs visualized
set list lcs=lead:·,trail:·,tab:»·

" highlight yanked results for 500ms
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
augroup END
