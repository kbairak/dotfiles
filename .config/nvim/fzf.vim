scriptencoding utf-8

let g:fzf_command_prefix = 'FZF'
nnoremap <C-p> :FZFFiles<cr>
nnoremap <C-l> :FZFBTags<cr>
" option-:
nnoremap … :FZFHistory:<cr>
" option-p
nnoremap π :FZFBuffers<cr>
" option-/
nnoremap ÷ :FZFHistory/<cr>
" option-h
nnoremap ˙ :FZFHistory<cr>
" option-t
nnoremap † :FZFTags<cr>
" option-l
nnoremap ¬ :FZFBLines<cr>
" option-g
nnoremap © :FZFHelptags<cr>
" option-a
nnoremap å :FZFAg<cr>
" option -c
nnoremap ç :FZFBCommits<cr>
" Remaining interesting FZF command: FZFLines
