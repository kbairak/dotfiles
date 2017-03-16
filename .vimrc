" pathogen
execute pathogen#infect()

syntax on

filetype plugin on

" Editing options
set autoindent
set backspace=2
set colorcolumn=80
set expandtab
set foldignore=
set foldmethod=indent
set formatoptions+=n
set incsearch
set mouse=a
set number
set showtabline=1
set switchbuf=usetab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Exec django test-suite
function! s:RunCmd(command)
    let l:output = system(a:command)
    cgetexpr l:output
    copen
endfunction
command! -nargs=1 RunCmd call s:RunCmd("<args>")
function! s:RunDjangoTestSuite(...)
    if len(a:000) == 0
        let l:path = "tests"
    elseif len(a:000) == 1
        let l:path = a:1
    else
        for app in a:000
            let l:path = " tests" . "." . app
        endfor
    endif
    call s:RunCmd("source ~/devel/env/tx/bin/activate; TX_ALL_TESTS=1 coverage run ./manage.py test --with-machineout " . path)
endfunction
command! -nargs=* -complete=file TxTest call s:RunDjangoTestSuite(<f-args>)

" Better tag navigation
"nnoremap <C-l> :vsplit<CR><C-w>l<C-]>zxjzOkz<CR>

" Gvim
set guioptions=
set guifont=Monaco\ Bold\ Italic\ 9
" For Macs
"set guifont=Monaco\ 11

" Colorscheme
colorscheme slate
set hlsearch
hi Comment term=bold ctermfg=Blue guifg=grey40
hi Folded ctermfg=darkgrey ctermbg=NONE
hi FoldColumn ctermfg=darkgrey ctermbg=NONE
hi Search ctermbg=green

" Python
autocmd FileType python set shiftwidth=4
autocmd FileType python set softtabstop=4
autocmd FileType python set tabstop=4

autocmd FileType python set omnifunc=pythoncomplete#Complete

autocmd FileType python syntax match preDotJs /\<[a-zA-Z^\d_]\+\>\./ display
autocmd FileType python hi preDotJs ctermfg=DarkGreen
autocmd FileType python syntax match self /self/ display
autocmd FileType python hi self ctermfg=Red

" HTML
autocmd FileType html set shiftwidth=2
autocmd FileType html set softtabstop=2
autocmd FileType html set tabstop=2

" HTML-Django
autocmd FileType htmldjango set shiftwidth=2
autocmd FileType htmldjango set softtabstop=2
autocmd FileType htmldjango set tabstop=2

" CSS
autocmd FileType css set shiftwidth=2
autocmd FileType css set softtabstop=2
autocmd FileType css set tabstop=2

" JavaScript
autocmd FileType javascript set shiftwidth=2
autocmd FileType javascript set softtabstop=2
autocmd FileType javascript set tabstop=2

autocmd FileType javascript syntax match preDotJs /\<[a-zA-Z^\d_]\+\>\./ display
autocmd FileType javascript hi preDotJs ctermfg=DarkGreen
autocmd FileType javascript syntax match _this /_this/ display
autocmd FileType javascript hi _this ctermfg=DarkYellow
autocmd FileType javascript syntax match prototype /prototype/ display
autocmd FileType javascript hi prototype ctermfg=Yellow

" CoffeeScript
autocmd FileType coffee set shiftwidth=2
autocmd FileType coffee set softtabstop=2
autocmd FileType coffee set tabstop=2

" C
autocmd FileType c set shiftwidth=2
autocmd FileType c set softtabstop=2
autocmd FileType c set tabstop=2

" C++
autocmd FileType cpp set shiftwidth=2
autocmd FileType cpp set softtabstop=2
autocmd FileType cpp set tabstop=2

" Abbreviations
cabbrev t0 set textwidth=0
cabbrev t79 set textwidth=79
iabbrev *args, *args, **kwargs
iabbrev blank=True, blank=True, null=True
iabbrev null=True, null=True, blank=True
iabbrev ipdb from ipdb import set_trace; set_trace()
iabbrev pudb import pudb; pu.db
iabbrev langauge language
iabbrev transfiex transifex

" EasyMotion
let g:EasyMotion_leader_key = '<Leader>'

" ZenCoding
let g:user_zen_settings = { 'indentation': '  ' }

"autocmd FileType python compiler pylint
source ~/.vim/bundle/table/macros/table.vim

" Gundo
command! Gundo GundoToggle

" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
map <C-N> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$']
"let g:NERDTreeDirArrows=0

" Syntastic
let g:syntastic_python_checkers=['flake8']
let g:syntastic_javascript_checkers=['jshint']
let syntastic_check_on_open = 1

" YankRing
"nnoremap <silent> <F11> :YRShow<CR>
"let g:yankring_replace_n_pkey = 'p'
"let g:yankring_replace_n_nkey = 'n'

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
	\ ['brown',       'RoyalBlue3'],
	\ ['darkgray',    'DarkOrchid3'],
	\ ['darkgreen',   'firebrick3'],
	\ ['darkcyan',    'RoyalBlue3'],
	\ ['darkred',     'SeaGreen3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['brown',       'firebrick3'],
	\ ['gray',        'RoyalBlue3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['darkgreen',   'RoyalBlue3'],
	\ ['darkred',     'DarkOrchid3'],
	\ ['darkcyan',    'SeaGreen3'],
	\ ['red',         'firebrick3'],
	\ ]

" Ctrl-P
let g:ctrlp_extensions = ['line', 'quickfix', 'tag', 'buffertag']
nnoremap <C-l> :CtrlPLine<cr>

" for HTML omnicompletion
let g:htmldjangocomplete_html_flavour = 'html5'

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Search word under cursor
nnoremap K :vsplit<CR><C-w>l:Ag -w <C-R><C-W><CR>:cwindow<CR>
"nnoremap <C-K> :Ag -w <C-R><C-W><CR>:cwindow<CR>

nnoremap <C-K> :cprevious<CR>
nnoremap <C-J> :cnext<CR>

" ColumnTags
let g:max_columns = 4

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filetype_blacklist = {
    \ 'gitcommit': 1,
    \}

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" UltiSnips shortcut
command! Udjango UltiSnipsAddFiletypes django.py
