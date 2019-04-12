scriptencoding utf-8

" Abbreviations
iabbrev *args, *args, **kwargs
iabbrev blank=True, blank=True, null=True
iabbrev null=True, null=True, blank=True

" Navigate quickfix/location lists
nnoremap <C-K> :cprevious<CR>
nnoremap <C-J> :cnext<CR>
" alt-k / alt-l
nnoremap ˚ :lprevious<CR>
nnoremap <M-k> :lprevious<CR>
nnoremap ∆ :lnext<CR>
nnoremap <M-j> :lnext<CR>

" Common operations mapped to leader
let g:mapleader = "\<Space>"

" Align to first function argument
nnoremap <Leader>1 yypvf(r wdWkElDjgqq
nnoremap <Leader>2 yypvf(r wdW.kEElDjgqq
nnoremap <Leader>3 yypvf(r wdW..kEEElDjgqq
nnoremap <Leader>4 yypvf(r wdW...kEEEElDjgqq
nnoremap <Leader>5 yypvf(r wdW....kEEEEElDjgqq
nnoremap <Leader>6 yypvf(r wdW.....kEEEEEElDjgqq
nnoremap <Leader>7 yypvf(r wdW......kEEEEEEElDjgqq
nnoremap <Leader>8 yypvf(r wdW.......kEEEEEEEElDjgqq
nnoremap <Leader>9 yypvf(r wdW........kEEEEEEEEElDjgqq

" Align to first dict entry
nnoremap <Leader>! yypvf{r wdW.kEElDjgqq
nnoremap <Leader>@ yypvf{r wdW...kEElEElDjgqq
nnoremap <Leader># yypvf{r wdW.....kEEElEEElDjgqq
nnoremap <Leader>$ yypvf{r wdW.......kEEEElEEEElDjgqq
nnoremap <Leader>% yypvf{r wdW.........kEEEEElEEEEElDjgqq
nnoremap <Leader>^ yypvf{r wdW...........kEEEEEElEEEEEElDjgqq
nnoremap <Leader>& yypvf{r wdW.............kEEEEEEElEEEEEEElDjgqq
nnoremap <Leader>* yypvf{r wdW...............kEEEEEEEElEEEEEEEElDjgqq
nnoremap <Leader>( yypvf{r wdW.................kEEEEEEEEElEEEEEEEEElDjgqq

" Limit string to 79 chars
nnoremap <Leader>" 0f"i(<Esc>f";a)<Esc>079lBi""<Esc>yypvf(r wdf"kf"lD

nnoremap <Leader><Leader> :w<CR>
nnoremap <Leader>= <C-w>=
nnoremap <leader>/ :nohlsearch<CR>
nnoremap <Leader>a ggVGyVG"+y<C-o><C-o>
nnoremap <Leader>c :lwindow<CR>
nnoremap <Leader>C :cwindow<CR>
nnoremap <Leader>d odebugger;<Esc>
nnoremap <Leader>D Odebugger;<Esc>
nnoremap <Leader>e :e<CR>
nnoremap <Leader>E :e!<CR>
nnoremap <Leader>g :only \| Gstatus<CR>
nnoremap <Leader>G :Gdiff<CR>
nnoremap <Leader>o :only<CR>
nnoremap <Leader>O :tabonly<CR>
nnoremap <Leader>i ofrom ipdb import set_trace; set_trace()<Esc>
nnoremap <Leader>I Ofrom ipdb import set_trace; set_trace()<Esc>
nnoremap <Leader>p oimport pudb; pu.db<Esc>
nnoremap <Leader>P Oimport pudb; pu.db<Esc>
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>r Pldebye
nnoremap <Leader>R PldEbyE
nnoremap <Leader>s :vsplit<CR>
nnoremap <Leader>S :vnew<CR>
nnoremap <Leader>t :tabe%<CR>
nnoremap <Leader>T :tabnew<CR>
nnoremap <Leader>v :split<CR>
nnoremap <Leader>V :new<CR>
nnoremap <Leader>y byePa=<Esc>e<Esc>
nnoremap <Leader>Y byePa: <Esc>F:i'<Esc>bi'<Esc>f:e

nnoremap <Leader>k <C-w>k
nnoremap <Leader>j <C-w>j
nnoremap <Leader>l <C-w>l
nnoremap <Leader>h <C-w>h
nnoremap <Leader>K <C-w>K
nnoremap <Leader>J <C-w>J
nnoremap <Leader>L <C-w>L
nnoremap <Leader>H <C-w>H
