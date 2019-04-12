augroup my_nemoake
    autocmd BufWritePost * Neomake
augroup end

" let g:neomake_python_enabled_makers = ['flake8', 'mypy']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = '/home/kbairak/global_npm/bin/eslint'
" let g:neomake_htmldjango_tidy_maker = {
"     \ 'args': ['-e', '-q', '--gnu-emacs', 'true'],
"     \ 'errorformat': '%A%f:%l:%c: Warning: %m',
"     \ }
" let g:neomake_htmldjango_htmlhint_maker = {
"     \ 'args': ['--format', 'unix'],
"     \ 'errorformat': '%f:%l:%c: %m',
"     \ }
" let g:neomake_htmldjango_enabled_makers = ['tidy', 'htmlhint']
