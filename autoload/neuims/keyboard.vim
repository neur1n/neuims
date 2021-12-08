scriptencoding utf-8

function! neuims#keyboard#Enable(im_name) abort
  if g:neuims.im ==# a:im_name
    return
  endif

  let l:im_id = g:neuims.keyboards[a:im_name]
  " if has_key(g:neuims.keyboards, a:im_name)
  "   let l:im_id = g:neuims.keyboards[a:im_name]
  " else
  "   echohl WarningMsg
  "   echomsg '[neuims] Target input method is not specfied.'
  "   echohl NONE
  "   return
  " endif

  if system('uname -r') =~ 'WSL'
    call s:WinEnable(l:im_id)
  elseif has('unix')
    call s:UnixEnable(l:im_id)
  elseif has('win32')
    call s:WinEnable(l:im_id)
  endif

  let g:neuims.im = a:im_name

  " echohl WarningMsg
  " echomsg '[neuims] Switched to '.a:im_name.'.'
  " echohl clear
endfunction

let s:win_ims = expand('<sfile>:h:h:h').'/bin/win_ims.exe'

function! s:WinEnable(im_id) abort
  call system(s:win_ims.' '.a:im_id)
endfunction

function! s:UnixEnable(im_id) abort
  call system('ibus engine '.a:im_id)
endfunction
