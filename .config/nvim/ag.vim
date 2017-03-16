if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Search word under cursor
nnoremap K :vsplit<CR><C-w>l:Ag -w <C-R><C-W><CR>:cwindow<CR>
"nnoremap <C-K> :Ag -w <C-R><C-W><CR>:cwindow<CR>
command! -bang -nargs=* -complete=file AG call ag#Ag('grep<bang>',<q-args>)
