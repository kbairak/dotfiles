call plug#begin('~/.local/share/nvim/plugged')

Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'Lokaltog/vim-easymotion'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dhruvasagar/vim-table-mode'
Plug 'eugen0329/vim-esearch'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kassio/neoterm'
Plug 'kbairak/ColumnTags.vim'
Plug 'kbairak/TurboMark'
Plug 'kien/rainbow_parentheses.vim'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx'
Plug 'neomake/neomake'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'plasticboy/vim-markdown'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug '~/apps/ghub.vim'

call plug#end()
