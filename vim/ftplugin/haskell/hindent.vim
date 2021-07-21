" Plugin for Haskell hindent
" Last Change: 2021 Jul 21
" Maintainer: Theerawat Kiatdarakun <tkiat@tutanota.com>
" License: Vim License.
" Source: https://hackage.haskell.org/package/hindent
" Adapt From: https://github.com/alx741/vim-hindent
" ==============================================================================
" Enable at Most Once
" ==============================================================================
if exists("g:ftplugin_haskell_hindent_disabled")
  finish
endif
let g:ftplugin_haskell_hindent_disabled = 1
" ==============================================================================
" Config
" ==============================================================================
let s:apply_on_save = 1
let s:command = "hindent"
let s:opt_indent_size = 2
let s:opt_line_length = 80
" ==============================================================================
" Script
" ==============================================================================
if !executable(s:command)
  echomsg "hindent not found in $PATH"
  finish
endif

function! hindent#HindentDisable()
  let s:apply_on_save = 0
endfunction

function! hindent#Hindent() range
  " push the buffer, not file on disk, to the command
  silent! exe "w !" . s:command . " > /dev/null 2>&1"

  if v:shell_error
    echoerr "hindent: parsing error"
    return
  endif

  let l:indent_opt = " --indent-size " . s:opt_indent_size
  let l:opt_line_length_opt = " --line-length " . s:opt_line_length

  silent! exe "keepjumps " . a:firstline . "," . a:lastline . "!" . s:command . l:indent_opt . l:opt_line_length_opt

  call winrestview(b:winview)
endfunction

function! hindent#HindentOnSave()
  if s:apply_on_save == 1
    let b:winview = winsaveview()
    exe "%call hindent#Hindent()"
    echo('use :HindentDisable to disable hindent')
  endif
endfunction

augroup hindent
  autocmd!
  autocmd BufWritePre *.hs call hindent#HindentOnSave()
augroup  END
