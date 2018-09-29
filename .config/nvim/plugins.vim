call plug#begin('~/.local/share/nvim/plugged')

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
Plug 'ludovicchabant/vim-gutentags'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx'
Plug 'neomake/neomake'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug '~/apps/ghub.vim'

" Plug 'ervandew/supertab'
" Plug 'davidhalter/jedi-vim', { 'do': 'git submodule update --init' }
" Plug 'sjl/gundo.vim'
" Plug 'Glench/Vim-Jinja2-Syntax'
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'othree/yajs.vim'
" Plug 'rking/ag.vim'
" Plug 'sjl/gundo.vim'
" Plug 'vimwiki/vimwiki'

call plug#end()
