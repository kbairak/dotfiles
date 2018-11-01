call plug#begin('~/.local/share/nvim/plugged')

Plug 'Lokaltog/vim-easymotion'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dhruvasagar/vim-table-mode'
Plug 'eugen0329/vim-esearch'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kbairak/ColumnTags.vim'
Plug 'kbairak/TurboMark'
Plug 'ludovicchabant/vim-gutentags'
Plug 'morhetz/gruvbox'
Plug 'neomake/neomake'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug '~/apps/ghub.vim'

" Plug 'kassio/neoterm'
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'mxw/vim-jsx'
" Plug 'sjl/gundo.vim'
" Plug 'sjl/gundo.vim'

call plug#end()
