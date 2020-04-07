" execute pathogen plugin
execute pathogen#infect()
" clear last search pattern
let @/ = ""
" define variables
let mapleader = ','
" basic key mapping
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap (<CR> (<CR>)<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap {<CR> {<CR>}<Esc>ko<tab>
" enclose current word with "
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" enclose current word with '
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" split vertically and open .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" put semilon end of line while retain cursor location
nnoremap <leader>; mqA;<esc>`q
" strip trailing whitespace while retain cursor position
nnoremap <leader>ss mq:%s/\s\+$//<cr>`q
" comment for each file extension
:autocmd BufNewFile,BufRead *.zshrc nnoremap <buffer> <leader>c I#<esc>
:autocmd BufNewFile,BufRead *.vim,*.vimrc nnoremap <buffer> <leader>c I" <esc>h
:autocmd BufNewFile,BufRead *.js,*.cpp nnoremap <buffer> <leader>c I//<esc>
" dp -> empty text in parenthesis
onoremap p i(
" abbreviation
iabbrev emailend <bs><cr><cr>Best regards,<cr>Theerawat Kiatdarakun
" spell correction
iabbrev adn and
iabbrev tehn then
iabbrev waht what
" netrw
let g:netrw_browse_split = 3 " open file in new tab
let g:netrw_liststyle = 3 " tree listing style"
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro nornu' " enable line number
" apply indentation of current line to the next
set autoindent
" cursorline
set cursorline
" fold code based on indentation
set foldmethod=indent
" highlight searches
set hlsearch
" ignore case when search
set ignorecase
" highlight while still typing
set incsearch
" enable listchar
set list
" set listchars
set listchars=tab:\|·,eol:$,trail:_
" disable auto-folding at start
set nofoldenable
" show line number
set number
" Pmenu max height
set pumheight=10
" shiftwidth/tabstop tabs will be indented after pressing <<, >>
set shiftwidth=2
" set tab width
set tabstop=2
" theme
colorscheme tkiatd

inoremap html5<C-y>, <ESC>:r .vim/template/html5.template<CR>kdd/body<CR>:nohl<CR>o<TAB>
inoremap vue<C-y>, <ESC>:r .vim/template/vue.template<CR>kdd
"nnoremap <leader>; :execute "normal! mqA;<c-v><esc>`q"<cr>

""let s:inputBuffer = ''
""
""augroup _silentInsertTrigger
""    autocmd!
""    autocmd InsertCharPre * call <sid>OnPreEnterChar()
""    autocmd InsertLeave * call <sid>OnInsertLeave()
""augroup END
""
""function! s:OnPreEnterChar()
""	let s:inputBuffer .= v:char
""	if s:inputBuffer[-3:] ==# 'abc'
""		":r .vim/template/html5.template<CR>kdd/body<CR>:nohl<CR>o<TAB>
""		"echo '<do stuff>'
""		:execute "normal! :wq"
""	endif
""	return v:char
""endfunction
""
""
""function! s:OnInsertLeave()
""	let s:inputBuffer = ''
""endfunction

""dasdasdsadas
""adsadasdsadas
