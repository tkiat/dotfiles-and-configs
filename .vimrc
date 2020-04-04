" execute pathogen plugin
execute pathogen#infect()
" set specialkeys (e.g. tab) color
hi SpecialKey ctermfg=67
" key map
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap (<CR> (<CR>)<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap {<CR> {<CR>}<Esc>ko<tab>
" netrw
	" open file in new tab
let g:netrw_browse_split = 3
	" tree listing style"
let g:netrw_liststyle = 3
	" enable line number
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro nornu'
" apply indentation of current line to the next
set autoindent
" fold code based on indentation
set foldmethod=indent
" disable auto-folding at start
set nofoldenable
" highlight searches
set hlsearch
" ignore case when search
set ignorecase
" enable listchar
set list
" set listchars
set listchars=tab:\|·,trail:_,eol:$
" show line number
set number
" set tab width
set tabstop=2
" shiftwidth/tabstop tabs will be indented after pressing <<, >>
set shiftwidth=2
" flash screen when error instead of beep
set visualbell
" enable syntax highlighting
syntax on
" grubbox plugin
colorscheme gruvbox
set background=dark
