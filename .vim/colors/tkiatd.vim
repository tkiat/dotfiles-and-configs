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
let b:colors_name = "tkiatd"
" background
set background=dark
" set 256 colors
set t_Co=256
" ----------------------------------------
" Helper functions
" ----------------------------------------
function! HighlightGroup(gm, tc, hc)
	for member in a:gm
		exe 'hi '.member.' ctermfg='.a:tc.' ctermbg='.a:hc
	endfor
endfunction

function! HighlightGroupCustom(gm_custom)
	for member in a:gm_custom
		let cmd='hi '.member['name']
		for [key,value] in items(member)
			if key !=# 'name'
				let cmd=cmd.' '.key.'='.value
			endif
		endfor
		exe cmd
	endfor
endfunction

function! PadZeroes(i)
	let temp='00'.a:i
	return temp[strlen(temp)-3:strlen(temp)-1]
endfunction
" ----------------------------------------
" Set all highlight groups to red for testing purpose
" ----------------------------------------
""for hl_group in getcompletion('', 'highlight')
""	if hl_group ==# 'CursorLine'
""		continue
""	 endif
""	exe 'hi '.hl_group.' ctermfg=red'
""endfor
" ----------------------------------------
" Show actual color for variables b:xtermxxx
" Note: Need to source .vimrc from here first
" ----------------------------------------
for i in range(0,255)
	let b:colorcode=PadZeroes(i)
	exe 'let b:xterm'.b:colorcode.'='.i
	exe 'syntax match xterm'.b:colorcode.' /\vb:(xterm'.b:colorcode.')@=/'
	exe 'hi xterm'.b:colorcode.' ctermfg='.i.' ctermbg='.i
endfor
" ----------------------------------------
" Assign group member (gm), text color (tc), and highlight color (hc)
" ----------------------------------------
let tc1=b:xterm214
let hc1='NONE'
let gm1=['Boolean', 'Directory', 'Float', 'Number', 'String']
" group 2: statement
let tc2=b:xterm149
let hc2='NONE'
let gm2=['Conditional', 'Exception', 'Label', 'Repeat', 'Statement']
" group 3: normal text, main background
let tc3=b:xterm015
let hc3=b:xterm233
let gm3=['Normal', 'Operator', 'Question', 'ModeMsg']
let gm3_reversed=['TabLineFill']
" group 4: non-focal text
let tc4=b:xterm245
let hc4='NONE'
let gm4=['Comment', 'Delimiter', 'EndOfBuffer', 'LineNr']
" group 5: type
let tc5=b:xterm123
let hc5='NONE'
let gm5=['Keyword', 'Type', 'Typedef', 'StorageClass', 'Structure']
" group 6:
let tc6=b:xterm213
let hc6='NONE'
let gm6=['Special']
" group 7:
let tc7=b:xterm075
let hc7='NONE'
let gm7=['Function', 'Identifier', 'Preproc']
" group 8:
let tc8=b:xterm067
let hc8='NONE'
let gm8=['Nontext', 'Specialkey']
" group 9: highlight: row
let tc9=b:xterm245
let hc9=b:xterm236
let gm9=['Folded']
let gm9_custom=[{'name':'CursorLine','cterm':'none','ctermbg':hc9},{'name':'CursorLineNr','cterm':'bold,italic','ctermfg':hc9,'ctermbg':tc9}]
" group 10: highlight: general (bright)
let tc10=b:xterm000
let hc10=b:xterm255
let gm10=['Pmenu', 'StatusLineTerm', 'TablineSel', 'Visual']
let gm10_reversed=['PmenuSbar', 'StatusLine']
" group 11: highlight: general (dim)
let tc11=b:xterm000
let hc11=b:xterm245
let gm11=['PmenuThumb', 'PmenuSel', 'StatusLineTermNC', 'TabLine']
let gm11_reversed=['StatusLineNC']
" group 12: highlight: error
let tc12=b:xterm015
let hc12=b:xterm001
let gm12=['Error', 'ErrorMsg']
" group 13: highlight: search
let tc13=b:xterm000
let hc13=b:xterm214
let gm13=['Search']
" group 14: highlight: more focus
let tc14=b:xterm000
let hc14=b:xterm166
let gm14_reversed=['IncSearch', 'MatchParen']
" ----------------------------------------
" Apply all highlights
" ----------------------------------------
let cur_group=1
while exists('gm'.cur_group) || exists('gm'.cur_group.'_reversed') || exists('gm'.cur_group.'_custom')
	if exists('gm'.cur_group)
		exe 'call HighlightGroup(gm'.cur_group.',tc'.cur_group.',hc'.cur_group.')'
	endif
	if exists('gm'.cur_group.'_reversed')
		exe 'call HighlightGroup(gm'.cur_group.'_reversed,hc'.cur_group.',tc'.cur_group.')'
	endif
	if exists('gm'.cur_group.'_custom')
		exe 'call HighlightGroupCustom(gm'.cur_group.'_custom)'
	endif
	let cur_group += 1
endwhile
