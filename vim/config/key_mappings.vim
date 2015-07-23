" set leader to ,
  let mapleader = ","

" get out of insert mode with jj
  imap jj <Esc>

" insert blank lines without going into insert mode
  nmap go o<esc>
  nmap gO O<esc>

" mapping the jumping between splits. Hold control while using vim nav.
  nmap <C-J> <C-W>j
  nmap <C-K> <C-W>k
  nmap <C-H> <C-W>h
  nmap <C-L> <C-W>l

" Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

" clean up trailing whitespace
  map <Leader>c :%s/\s\+$<cr>

" map spacebar to clear search highlight
  nnoremap <Leader><space> :noh<cr>

" reindent the entire file
  map <Leader>I gg=G``<cr>

" disable arrow keys to make me use hjkl
  nnoremap <up> <nop>
  nnoremap <down> <nop>
  nnoremap <left> <nop>
  nnoremap <right> <nop>
  nnoremap j gj
  nnoremap k gk

" quick search
  map <leader>s :%s/

" select all
  map <leader>a ggVG

" using control+hjkl to move cursor in insert mode
  imap <C-j> <Down>
  imap <C-k> <Up>
  imap <C-h> <Left>
  imap <C-l> <Right>

" fold mappings
  nnoremap zo za
  vnoremap zc zf

" coffeelint
  map <leader>cl :CoffeeLint <Bar> botright cwindow<cr>
  map <leader>cc :cclose<cr>
