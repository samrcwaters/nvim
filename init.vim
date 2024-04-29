" Install plugins
call plug#begin()
Plug 'habamax/vim-godot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {

" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

" Configure line numbers
set number
set relativenumber

" Set tabs = 4 spaces
set ts=4
set sw=4

" Theme & syntax highlighting
syntax on
colorscheme onedark

" Disable arrow keys in non-insert modes
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Open fuzzy finder
nnoremap <C-p> :Files<CR>

" Better terminal mode exit shortcut
:tnoremap <Esc> <C-\><C-n>

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

