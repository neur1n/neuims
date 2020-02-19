scriptencoding utf-8

if exists('g:loaded_neuims')
  finish
endif
let g:loaded_neuims = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

call neuims#Init()

augroup neuims
  autocmd!
  autocmd InsertEnter,InsertLeave * call neuims#Switch(1)
augroup END

command! IMSToggle call neuims#Toggle()

let &cpoptions = s:save_cpo
unlet s:save_cpo
