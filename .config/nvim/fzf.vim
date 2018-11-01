scriptencoding utf-8

let g:fzf_command_prefix = 'FZF'
nnoremap <C-p> :FZFFiles<cr>
nnoremap <C-l> :FZFBTags<cr>
" alt-;
nnoremap … :FZFHistory:<cr>
nnoremap <M-;> :FZFHistory:<cr>
" alt-p
nnoremap π :FZFBuffers<cr>
nnoremap <M-p> :FZFBuffers<cr>
" alt-/
nnoremap ÷ :FZFHistory/<cr>
nnoremap <M-/> :FZFHistory/<cr>
" alt-h
nnoremap ˙ :FZFHistory<cr>
nnoremap <M-h> :FZFHistory<cr>
" alt-t
nnoremap † :FZFTags<cr>
nnoremap <M-t> :FZFTags<cr>
" alt-l
nnoremap ¬ :FZFBLines<cr>
nnoremap <M-l> :FZFBLines<cr>
" alt-g
nnoremap © :FZFHelptags<cr>
nnoremap <M-g> :FZFHelptags<cr>
" alt -c
nnoremap ç :FZFBCommits<cr>
nnoremap <M-c> :FZFBCommits<cr>

nnoremap <M-a> :FZFRg<cr>
" Remaining interesting FZF command: FZFLines
