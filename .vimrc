" clear last search pattern
let @/ = ""
" define variables
let mapleader=','
let template_dir= '~/dotfiles/.vim/template/'
" ----------------------------------------
" Mapping: insert mode
" ----------------------------------------
" auto-closing ...
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap (<CR> (<CR>)<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap {<CR> {<CR>}<Esc>ko<tab>
" ----------------------------------------
" Mapping: normal mode
" ----------------------------------------
" comment
:autocmd BufNewFile,BufRead *.sh,*.zshrc nnoremap <buffer> <leader>c I# <esc>
:autocmd BufNewFile,BufRead *.vim,*.vimrc nnoremap <buffer> <leader>c I" <esc>h
:autocmd BufNewFile,BufRead *.js,*.cpp nnoremap <buffer> <leader>c I// <esc>
" enclose word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" insert at the end of current line
nnoremap <leader>, mqA,<esc>`q
nnoremap <leader>; mqA;<esc>`q
" open file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>ec :vsplit ~/.vim/colors/tkiatd.vim<cr>
" source file
nnoremap <leader>sv :source $MYVIMRC<cr>
" strip trailing whitespace
nnoremap <leader>ss mq:%s/\s\+$//<cr>`q
" template
nnoremap :shebang i#!/usr/bin/env<space>
exe 'nnoremap :html5 <ESC>:r '.template_dir.'html5.template<CR>kdd/body<CR>:nohl<CR>o<TAB>'
exe 'nnoremap :vue <ESC>:r '.template_dir.'vue.template<CR>kdd'
" ----------------------------------------
" Mapping: operator-pending
" ----------------------------------------
" dp -> empty text in parenthesis
onoremap p i(
" ----------------------------------------
" Abbreviation & Correction
" ----------------------------------------
iabbrev emailend <bs><cr><cr>Best regards,<cr>Theerawat Kiatdarakun
" spelling correction
iabbrev adn and
iabbrev tehn then
iabbrev waht what
" ----------------------------------------
" Style
" ----------------------------------------
colorscheme tkiatd
" netrw
let g:netrw_browse_split = 3 " open file in new tab
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro nornu' " enable line number
let g:netrw_liststyle = 3 " tree listing style"
" set ...
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
set shiftwidth=2 " indent (shiftwidth/tabstop) tabs with <<, >>
set tabstop=2 " spaces per tab

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
""function! s:OnInsertLeave()
""	let s:inputBuffer = ''
""endfunction

