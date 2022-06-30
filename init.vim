" Install plugins
call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'habamax/vim-godot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
lua require'nvim-tree'.setup {}

" Configure line numbers
set number
set relativenumber

" Set tabs = 4 spaces
set ts=4
set sw=4

" Theme & syntax highlighting
syntax on
colorscheme onedark

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Auto-complete brackets
inoremap { {<CR>}<ESC>ko

" Set custom mappings
" Open nvim-tree
noremap <C-b> :NvimTreeToggle<CR>
" Open fuzzy finder
nnoremap <C-p> :Files<CR>
