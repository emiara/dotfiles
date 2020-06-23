"!- Plug
call plug#begin(stdpath('data') . '/plugged')
    Plug 'junegunn/vim-easy-align'
    Plug 'preservim/nerdtree'
    Plug 'altercation/vim-colors-solarized'
    Plug 'kien/ctrlp.vim'
"    Plug 'mileszs/ack.vim'
    Plug 'haya14busa/incsearch.vim'
    Plug 'sjl/gundo.vim'
    Plug 'scrooloose/syntastic'
    Plug 'FooSoft/vim-argwrap'
    Plug 'camspiers/lens.vim'
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/goyo.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'townk/vim-autoclose'
call plug#end()
source $HOME/.config/nvim/anish.vim
source $HOME/.config/nvim/emilio.vim
source $HOME/.config/nvim/coc.vim
