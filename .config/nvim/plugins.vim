call plug#begin('~/.local/share/nvim/plugged')

Plug 'Lokaltog/vim-easymotion'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'dhruvasagar/vim-table-mode'
Plug 'eugen0329/vim-esearch'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kbairak/ColumnTags.vim'
Plug 'kbairak/TurboMark'
Plug 'ludovicchabant/vim-gutentags'
Plug 'morhetz/gruvbox'
Plug 'neomake/neomake'
Plug 'python-rope/ropevim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug '~/apps/nvim/ghub.vim'
Plug '~/apps/nvim/prevnext.vim'

" Plug 'kassio/neoterm'
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" Plug 'plasticboy/vim-markdown'
" Plug 'sjl/gundo.vim'

call plug#end()

