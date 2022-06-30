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

" TODO: find an autocomplete plugin (coc maybe?)

" Set custom mappings
:map <C-b> :NvimTreeToggle<CR>
