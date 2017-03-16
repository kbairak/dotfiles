" Abbreviations
iabbrev *args, *args, **kwargs
iabbrev blank=True, blank=True, null=True
iabbrev null=True, null=True, blank=True
iabbrev ipdb from ipdb import set_trace; set_trace()
iabbrev pudb import pudb; pu.db

" Navigate quickfix/location lists
nnoremap <C-K> :cprevious<CR>
nnoremap <C-J> :cnext<CR>
" option-k
nnoremap ˚ :lprevious<CR>
" option-l
nnoremap ∆ :lnext<CR>

" Common operations mapped to leader
let g:mapleader = "\<Space>"
nnoremap <Leader>1 yypvf(r wdWkElDjgqq
nnoremap <Leader>2 yypvf(r wdW.kEElDjgqq
nnoremap <Leader>3 yypvf(r wdW..kEEElDjgqq
nnoremap <Leader>4 yypvf(r wdW...kEEEElDjgqq
nnoremap <Leader>5 yypvf(r wdW....kEEEEElDjgqq
nnoremap <Leader>6 yypvf(r wdW.....kEEEEEElDjgqq

nnoremap <Leader>e :e<CR>
nnoremap <Leader>E :e!<CR>
nnoremap <Leader>o :only<CR>
nnoremap <Leader>O :tabonly<CR>
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>s :vsplit<CR>
nnoremap <Leader>S :split<CR>
nnoremap <Leader>t :tabe%<CR>
nnoremap <Leader>T :tabnew<CR>
nnoremap <Leader><Leader> :w<CR>
nnoremap <Leader>= <C-w>=

nnoremap <Leader>k <C-w>k
nnoremap <Leader>j <C-w>j
nnoremap <Leader>l <C-w>l
nnoremap <Leader>h <C-w>h
nnoremap <Leader>K <C-w>K
nnoremap <Leader>J <C-w>J
nnoremap <Leader>L <C-w>L
nnoremap <Leader>H <C-w>H
