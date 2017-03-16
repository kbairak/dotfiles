call plug#begin('~/.local/share/nvim/plugged')
Plug 'Lokaltog/vim-easymotion'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'eugen0329/vim-esearch'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kassio/neoterm'
Plug 'kbairak/ColumnTags.vim'
Plug 'kbairak/TurboMark'
Plug 'kien/rainbow_parentheses.vim'
Plug 'morhetz/gruvbox'
Plug 'neomake/neomake'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug '~/apps/ghub.vim'
Plug '~/apps/table.vim'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer' }

" Deoplete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/neco-vim'
" Plug 'carlitux/deoplete-ternjs'
" Plug 'zchee/deoplete-jedi'
call plug#end()
