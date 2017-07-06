" EasyMotion
let g:EasyMotion_leader_key = '<Leader>'

" Gundo
command! Gundo GundoToggle

" ColumnTags
let g:columntags_max_columns = 4

" Neoterm
nmap T :T<space>

" ESearch
if ! exists('g:esearch')
    let g:esearch = {}
endif
let g:esearch['regex'] = 0
let g:esearch['word'] = 1
let g:esearch['use'] = ['visual', 'hlsearch', 'word_under_cursor', 'last']
let g:esearch['case'] = 1

" Javscript syntax
let g:used_javascript_libs = 'jquery,underscore,backbone,react'

" vim-table-mode
let g:table_mode_corner='|'
