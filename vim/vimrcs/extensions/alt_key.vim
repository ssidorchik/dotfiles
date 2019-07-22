if !has('nvim')
  " Setting up the usage of Alt/Option key
  " (do not forget to enable 'Use option as meta key' in OS X terminal preferences)
  let c='a'
  while c <= 'z'
      exec "set <A-".c.">=\e".c
      exec "imap \e".c." <A-".c.">"
      let c = nr2char(1+char2nr(c))
  endw
endif
