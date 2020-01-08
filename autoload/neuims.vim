scriptencoding utf-8

function! neuims#Init() abort
  if !exists('g:neuims')
    let g:neuims = neuims#default#Config()
  endif
  " if exists('g:neuims')
  "   if !has_key(g:neuims, 'keyboards')
  "     echohl WarningMsg
  "     echomsg '[neuims]Please specify keyboards in g:neuims.'
  "     echohl NONE
  "   else
  "     if !has_key(g:neuims.keyboards, g:neuims.im)
  "       echohl WarningMsg
  "       echomsg '[neuims]The current input method is not in specified keyboards.'
  "       echohl NONE
  "     endif
  "   endif
  " endif
endfunction

function! neuims#Toggle() abort
  if g:neuims.status == 0
    let g:neuims.status = 1
  else
    let g:neuims.status = 0
  endif
endfunction

function! neuims#Switch(silent) abort
  if !g:neuims.status
    if !a:silent
      echohl WarningMsg
      echomsg '[neuims]Disabled. Call neuims#Toggle() first.'
      echohl NONE
    endif
    return
  endif

  let l:keyboards = deepcopy(g:neuims.keyboards)
  call remove(l:keyboards, g:neuims.im)

  call neuims#keyboard#Enable(keys(l:keyboards)[0])
endfunction
