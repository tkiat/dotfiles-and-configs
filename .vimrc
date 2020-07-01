" Author: Theerawat Kiatdarakun
" I group all codes by scopes
" Scope: Local Variable
" Scope: Character
" Scope: Word
" Scope: Line
" Scope: Visual Select
" Scope: All Text in File
" Scope: File
" Scope: Plugin
" Scope: Configuration
" ========================================
"                    Scope: Local Variable
" ========================================
let mapleader=','
let template_dir='~/.vim/template/'
let space_per_tab=2
" ========================================
"                         Scope: Character
" ========================================
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap (<CR> (<CR>)<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko
inoremap {<CR> {<CR>}<Esc>ko
" ========================================
"                              Scope: Word
" ========================================
" replace
inoremap esc& &amp;
inoremap esc< &lt;
inoremap esc> &gt;
" enclose
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>* viw<esc>a*<esc>bi*<esc>
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>
nnoremap <leader>) viw<esc>a)<esc>bi(<esc>
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <leader>] viw<esc>a]<esc>bi[<esc>lel
" abbreviation
inoreabbrev shebang #!/usr/bin/env
inoreabbrev bestregards <bs><cr><cr>Best regards,<cr>Theerawat Kiatdarakun
inoreabbrev lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit. In dapibus convallis massa, nec gravida diam pellentesque at. Aliquam mollis tempor mi sed venenatis. Maecenas neque massa, pulvinar vitae lacus et, convallis interdum ligula. Suspendisse rhoncus a arcu quis volutpat. Donec ac risus eros. Pellentesque convallis lectus eu sodales ornare. Quisque egestas ex non purus porta porttitor. Ut blandit feugiat iaculis. Nulla mollis venenatis pulvinar. Nullam pulvinar efficitur aliquet. Donec in nibh eleifend, finibus dui nec, faucibus dui.
" spelling correction
iabbrev adn and
iabbrev tehn then
iabbrev waht what
" template
exe 'nnoremap <leader>html5 <ESC>:r '.template_dir.'html5.template<CR>kdd/body<CR>:nohl<CR>o<TAB>'
exe 'nnoremap <leader>vue <ESC>:r '.template_dir.'vue.template<CR>kdd'
exe 'nnoremap <leader>pkgm <ESC>:r '.template_dir.'main.go.template<CR>kddjjjjjjA'
" ========================================
"                              Scope: Line
" ========================================
" comment
:autocmd BufNewFile,BufRead *.html nnoremap <buffer> <leader>c mqI<!--<esc>A--><esc>`qllll
:autocmd BufNewFile,BufRead *.py,*.sh,*.tmux.conf,*.zshrc,*.zshrc.local nnoremap <buffer> <leader>c mqI# <esc>`qll
:autocmd BufNewFile,BufRead *.vim,*.vimrc nnoremap <buffer> <leader>c mqI" <esc>`qll
:autocmd BufNewFile,BufRead *.adoc,*.go,*.js,*.cpp nnoremap <buffer> <leader>c mqI// <esc>`qll
:autocmd BufNewFile,BufRead *.css nnoremap <buffer> <leader>c mqI/*<esc>A*/<esc>`qll
" uncomment
:autocmd BufNewFile,BufRead *.html nnoremap <buffer> <leader>u mqI<del><del><del><del><esc>A<bs><bs><bs><esc>`qhhhh
:autocmd BufNewFile,BufRead *.py,*.sh,*.tmux.conf,*.zshrc,*.zshrc.local nnoremap <buffer> <leader>u mqI<del><del><esc>`qhh
:autocmd BufNewFile,BufRead *.vim,*.vimrc nnoremap <buffer> <leader>u mqI<del><del><esc>`qhh
:autocmd BufNewFile,BufRead *.adoc,*.go,*.js,*.cpp nnoremap <buffer> <leader>u mqI<del><del><esc>`qhh
:autocmd BufNewFile,BufRead *.css nnoremap <buffer> <leader>u mqI<del><del><esc>A<bs><bs><esc>`qhh

" insert at the end of current line
nnoremap <leader>, mqA,<esc>`q
nnoremap <leader>; mqA;<esc>`q
" delete last character
nnoremap <leader>a mq$x<esc>`q
" insert line above/below
nnoremap <leader>O mqO<esc>`q
nnoremap <leader>o mqo<esc>`q
" ========================================
"                     Scope: Visual Select
" ========================================
" map 2 tabs to 1 tab
vnoremap <leader><tab><tab> :s/\%V\t\t/\t/g<cr>:nohl<cr>
" comment
:autocmd BufNewFile,BufRead *.html vnoremap <buffer> <leader>c :s/^/<!--/g<cr>gv:s/$/-->/g<cr>:nohl<cr>
:autocmd BufNewFile,BufRead *.py,*.sh,*.tmux.conf,*.zshrc,*.zshrc.local vnoremap <buffer> <leader>c :s/^\%V/# /g<cr>:nohl<cr>
:autocmd BufNewFile,BufRead *.vim,*.vimrc vnoremap <buffer> <leader>c :s/^\%V/" /g<cr>:nohl<cr>
:autocmd BufNewFile,BufRead *.adoc,*.go,*.js,*.cpp vnoremap <buffer> <leader>c :s/^\%V/\/\/ /g<cr>:nohl<cr>
:autocmd BufNewFile,BufRead *.css vnoremap <buffer> <leader>c :s/^/\/*/g<cr>gv:s/$/*\//g<cr>:nohl<cr>
" uncomment
:autocmd BufNewFile,BufRead *.html vnoremap <buffer> <leader>u :s/<!--//g<cr>gv:s/-->//g<cr>:nohl<cr>
:autocmd BufNewFile,BufRead *.py,*.sh,*.tmux.conf,*.zshrc,*.zshrc.local vnoremap <buffer> <leader>u :s/^\%V# //g<cr>
:autocmd BufNewFile,BufRead *.vim,*.vimrc vnoremap <buffer> <leader>u :s/^\%V" //g<cr>
:autocmd BufNewFile,BufRead *.adoc,*.go,*.js,*.cpp vnoremap <buffer> <leader>u :s/^\%V\/\/ //g<cr>
:autocmd BufNewFile,BufRead *.css vnoremap <buffer> <leader>u :s/\/\*//g<cr>gv:s/\*\///g<cr>:nohl<cr>
" ========================================
"                  Scope: All Text in File
" ========================================
" colorscheme
colorscheme tkiatd
" clear last search pattern
let @/ = ""
" search current word
nnoremap <leader>/ viw"qy/<C-r>q<cr>N
" replace current word
nnoremap <leader>R viw"qy:%s/<C-r>q//g<left><left>
" replace spaces at beginning with tab(s)
exe 'nnoremap <leader><tab> mq:%s/\(^ *\)\@<= \{'.space_per_tab.'\}/<tab>/g<cr>`q'
" strip trailing whitespace
nnoremap <leader>ss mq:%s/\s\+$//<cr>`q
" toggle highlight
nnoremap <expr> <leader>hl (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
" ========================================
"                              Scope: File
" ========================================
" save file
nnoremap <leader>s :update<cr>
vnoremap <leader>s <c-c>:update<cr>
" open file
nnoremap <leader>oa :vsplit ~/.aliases<cr>
nnoremap <leader>oc :vsplit ~/.vim/colors/tkiatd.vim<cr>
nnoremap <leader>ov :vsplit $MYVIMRC<cr>
nnoremap <leader>oz :vsplit ~/.zshrc<cr>
" source file
nnoremap <leader>sv :source $MYVIMRC<cr>
" netrw
let g:netrw_browse_split = 3 " open file in new tab
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro nornu' " enable line number
let g:netrw_liststyle = 3 " tree listing style"
" ========================================
"                            Scope: Plugin
" ========================================
" pathogen.vim
call pathogen#infect()
" NERDTree Plugin
filetype plugin indent on
let NERDTreeShowHidden=1
" start NERDTree without filename specified"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" ========================================
"                     Scope: Configuration
" ========================================
" Set
set autoindent " auto indent next line
set cursorline " highlight current line
set foldmethod=indent
set hlsearch " highlight searches
set ignorecase " ignore case when search
set incsearch " highlight while still typing search
set list " enable listchars
set listchars=eol:$,tab:\|·,trail:_
set nofoldenable " disable auto-folding at start
set number " show line number
set pumheight=10 " Pmenu max height
exe 'set shiftwidth='.space_per_tab
exe 'set tabstop='.space_per_tab
"
" TODO to check if file empty when will use template.this copied from somewhere and i dont understand
" function! BufferListEmpty()
"   let BufferListFile = @%
"   let lines = readfile(BufferListFile)    " read the file *contents* into a list
"   let matched_index = match(lines, '\S')  " find the first entry with a non-space
"   return matched_index == -1              " if no match was found -1 was returned
" endfunction
" if BufferListEmpty()
"   echo "Empty"
" else
"   echo "Not"
" endif
