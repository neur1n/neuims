scriptencoding utf-8

function! neuims#keyboard#Enable(im_name) abort
  if g:neuims.im ==# a:im_name
    return
  endif

  if has_key(g:neuims.keyboards, a:im_name)
    let l:im_id = g:neuims.keyboards[a:im_name]
  else
    echohl WarningMsg
    echomsg '[neuims] Target input method is not specfied.'
    echohl NONE
    return
  endif

  if has('unix')
    call s:UnixEnable(l:im_id)
  elseif has('win32')
    call s:WinEnable(l:im_id)
  endif

  let g:neuims.im = a:im_name

  echohl WarningMsg
  echomsg '[neuims] Switched to '.a:im_name.'.'
  echohl clear
endfunction

function! s:WinEnable(im_id) abort
python3 << EOF
# from pynvim.api import Nvim
from win32.lib.win32con import WM_INPUTLANGCHANGEREQUEST
import win32.win32api as wi
import win32.win32gui as wg
import vim

win =  wg.GetForegroundWindow()
wi.SendMessage(win, WM_INPUTLANGCHANGEREQUEST, 0, int(vim.eval('a:im_id')))
EOF
endfunction

function! s:UnixEnable(im_id) abort
  echomsg 'ibus engin '.a:im_id
  call system('ibus engine '.a:im_id)
endfunction
