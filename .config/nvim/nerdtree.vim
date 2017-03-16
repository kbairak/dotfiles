autocmd vimenter * if !argc() | NERDTree | endif
map <C-N> :NERDTreeToggle<CR>
let g:NERDTreeIgnore=['\.pyc$']

function! NERDTreeHighlightFile(extension, fg, guifg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermfg='. a:fg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('py', 'blue', '#3366FF')
call NERDTreeHighlightFile('css', 'cyan', 'cyan')
call NERDTreeHighlightFile('js', 'red', 'red')
