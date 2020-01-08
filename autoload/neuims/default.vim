scriptencoding utf-8

function! neuims#default#Config() abort
  let l:config = {
        \ 'im': 'US Keyboard',
        \ 'status': 0,
        \ 'keyboards': {
        \   'US Keyboard': 0x0409,
        \   'Microsoft Pinyin': 0x0804,
        \ },
        \ }

  return l:config
endfunction
