" Made by Theerawat Kiatdarakun
" Note - I don't use gVim so I did not take it in mind when writing this file
" ----------------------------------------
" General settings
" ----------------------------------------
" reset syntax highlighting
hi clear
syntax reset
syntax on
" colorscheme name
let g:colors_name = "tkiatd"
" background
set background=dark
" set 256 colors
set t_Co=256
" ----------------------------------------
" Declare common color variable
" ----------------------------------------
" group 01: background color
" Background
" TabLineFill -> tabline without entry
let group01=233
" group 02
" Background currentline
let group02=236
" ----------------------------------------
" group 1: non-code text
" ----------------------------------------
" group 11: non-focal text
" Line number
" End of buffer -> filter lines ~ after last line in buffer
" Vertsplit pipe character in vertical bar
let group11=245
" group 12:
" Directory
let group12=10
" group13: popup text
" Question
" ModeMsg e.g. -- INSERT --
let group13=15
" ----------------------------------------
" group 2: highlights
" ----------------------------------------
" group 21: Search
let group21=0
let group21hl=215
" group 22: IncSearch e.g. when use :%s///gc
let group22=0
let group22hl=10
" group 23
" Error
" ErrorMsg
let group23=15
let group23hl=1
" group 24:
" MatchParten -> hightlight when hover over macthed parentheses
" Pmenu -> pop up when autocompletion
" PmenuSbar
" StatusLine of active window
" StatusLineTerm of active window
" TabLine of active window
" Visual mode selection
let group24=0
let group24hl=255
" group 25:
" PmenuSel
" PmenuThumb
" StatusLine of non-active window
" StatusLineTerm of non-active window
" TabLine of non-active window
let group25=0
let group25hl=245
" group 26
" CursorLine -> line of current cursor
" CursorLineNr
" Folded
let group26=group11
let group26hl=235
" ----------------------------------------
" group 3: code text
" ----------------------------------------
" Normal
" Operator -> e.g. +, -
let group31=15
" Nontext e.g. eol
" Specialkey -> text displayed differently than what it really is e.g. listchars
let group32=67
" Identifier -> any variables
" Function name
let group33=75
" group 34: constant
" Float
" Number
" Boolean
" String
let group34=214
" group 35: statement
" Statement -> general statement
" Conditional
" Exception -> try, catch
" Label -> e.g. case, default
" Repeat -> e.g. for, while
let group35=149
" group 36:
" Keyword -> e.g. extends, document
" Preproc -> preprocesor e.g. $1
" Special -> any special symbol e.g. \u
let group36=83
" group 37: type
" Type -> e.g. int, long
" StorageClass -> e.g. static, volatile
" Structure -> e.g. struct, enum
let group37=159
" ----------------------------------------
" Set all known highlight groups to red for testing purpose
" ----------------------------------------
for hl_group in getcompletion('', 'highlight')
	if hl_group ==# 'CursorLine'
		continue
	 endif
	exe 'hi '.hl_group.' ctermfg=red'
endfor
" ----------------------------------------
" Set all variables above
" ----------------------------------------
" Boolean
exe 'hi Boolean ctermfg='.group34
" Comment
exe 'hi Comment ctermfg='.group11
" Conditional
exe 'hi Conditional ctermfg='.group35
" CursorLine
exe 'hi CursorLine cterm=none ctermbg='.group26hl
exe 'hi CursorLineNr cterm=bold,italic ctermfg='.group26.' ctermbg='.group26hl
" Directory
exe 'hi Directory ctermfg='.group12
" EndOfBuffer
exe 'hi EndOfBuffer ctermfg='.group11
" Error
exe 'hi Error ctermfg='.group23.' ctermbg='.group23hl
" ErrorMsg
exe 'hi ErrorMsg ctermfg='.group23.' ctermbg='.group23hl
" Exception
exe 'hi Exception ctermfg='.group35
" Folded
exe 'hi Folded ctermfg='.group26.' ctermbg='.group26hl
" Function
exe 'hi Function ctermfg='.group33
" Float
exe 'hi Float ctermfg='.group34
" Identifier
exe 'hi Identifier ctermfg='.group33
" IncSearch
exe 'hi IncSearch ctermfg='.group22hl.' ctermbg='.group22
" Keyword
exe 'hi Keyword ctermfg='.group36
" Label
exe 'hi Label ctermfg='.group35
" Line number
exe 'hi LineNr ctermfg='.group11
" MatchParen
exe 'hi MatchParen ctermfg='.group24hl.' ctermbg='.group24
" ModeMsg
exe 'hi ModeMsg ctermfg='.group13
" Nontext
exe 'hi NonText ctermfg='.group32
" Normal
exe 'hi Normal ctermfg='.group31.' ctermbg='.group01
" Number
exe 'hi Number ctermfg='.group34
" Operator
exe 'hi Operator ctermfg='.group31
" Pmenu
exe 'hi Pmenu ctermfg='.group24.' ctermbg='.group24hl
exe 'hi PmenuSel ctermfg='.group25.' ctermbg='.group25hl
exe 'hi PmenuSbar ctermfg='.group24hl
exe 'hi PmenuThumb ctermbg='.group25hl
" Preproc
exe 'hi Preproc ctermfg='.group36
" Question
exe 'hi Question ctermfg='.group13
" Repeat
exe 'hi Repeat ctermfg='.group35
" Search
exe 'hi Search  ctermfg='.group21.' ctermbg='.group21hl
" Special
exe 'hi Special ctermfg='.group36
" Specialkey
exe 'hi SpecialKey ctermfg='.group32
" Statement
exe 'hi Statement ctermfg='.group35
" StatusLine
exe 'hi StatusLine ctermfg='.group24hl.' ctermbg='.group24
exe 'hi StatusLineTerm ctermfg='.group24.' ctermbg='.group24hl
exe 'hi StatusLineNC ctermfg='.group25hl.' ctermbg='.group25
exe 'hi StatusLineTermNC ctermfg='.group25.' ctermbg='.group25hl
" StorageClass
exe 'hi StorageClass ctermfg='.group37
" String
exe 'hi String ctermfg='.group34
" Structure
exe 'hi Structure ctermfg='.group37
" Tabline
exe 'hi TabLine ctermfg='.group25.' ctermbg='.group25hl
exe 'hi TabLineFill ctermfg='.group01
exe 'hi TabLineSel ctermfg='.group24.' ctermbg='.group24hl
" Type
exe 'hi Type ctermfg='.group37
" Vertsplit
exe 'hi VertSplit ctermfg='.group01.' ctermbg='.group11
" Visual
exe 'hi Visual ctermfg='.group24.' ctermbg='.group24hl

" exe 'hi Statement ctermfg=13 ctermbg=21'
" MoreMsg
" exe 'hi MoreMsg ctermbg=15 ctermfg='.group31
