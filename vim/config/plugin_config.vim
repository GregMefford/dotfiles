set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-git'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'bingaman/vim-sparkup'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'wincent/Command-T'
Plugin 'bling/vim-airline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-markdown'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-surround'
Plugin 'kchmck/vim-coffee-script'

call vundle#end()

" enable syntax highlighting
  syntax on

" Markdown syntax highlighting
  augroup mkd
      autocmd BufNewFile,BufRead *.mkd      set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.md       set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
  augroup END

" gundo for awesome undo tree visualization
  map <Leader>h :GundoToggle<CR>

" surround for adding surround 'physics'
  " # to surround with ruby string interpolation
  let g:surround_35 = "#{\r}"
  " - to surround with no-output erb tag
  let g:surround_45 = "<% \r %>"
  " = to surround with output erb tag
  let g:surround_61 = "<%= \r %>"

" Coffee script
  au BufNewFile,BufRead *.coffee set filetype=coffee

" Git gutter
  highlight clear SignColumn

" NERD tree
  map <Leader>w :NERDTreeToggle<CR>

" command-t
  set wildignore+=vendor/cache/*,vendor/ruby/*,public/system/*

" airline
  let g:airline_powerline_fonts = 1
  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif
  let g:airline_symbols.space = "\ua0"
  let g:airline_theme = "bubblegum"

" syntastic
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_html_checkers=['']
