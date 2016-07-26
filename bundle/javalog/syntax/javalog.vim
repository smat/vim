
syn clear

setlocal foldmethod=syntax

syn cluster javalogInside contains=javalogList,javalogHashmap,javalogClass,javalogEmail

syn match javalogNumber /\<\d\+\>/
syn region javalogString matchgroup=javalogQuotes start=/\z(["']\)/ end=/\(\z1\|$\)/
syn keyword javalogNull null
syn keyword javalogLevel TRACE DEBUG INFO WARN Trace Debug Info Warning
syn keyword javalogLevelError ERROR FATAL Error Fatal
syn match javalogClass /\<[A-Za-z0-9_$]\+\.[A-Za-z0-9_$\.]\+/ nextgroup=javalogLocation
syn match javalogLocation /@[a-f0-9]\{8\}/ contained
syn region javalogList matchgroup=javalogListAround start=/\[/ end=/\(\]\|$\)/ contains=@javalogInside
syn region javalogHashmap matchgroup=javalogHashmapAround start=/{/ end=/}/ contains=javalogKey,@javalogInside
syn match javalogSeperator /,/
syn match javalogSeperator /\s-\s/
syn match javalogDate /\v\d{4}-\d{2}-\d{2}[T ]{,3}\d{2}:\d{2}(:\d{2})?([,\.]\d+)?([\+-]\d{2}:?(\d{2})?|Z)?/
syn match javalogKey /[A-Za-z0-9\._-]\+=/me=e-1,re=e-1,he=e-1 nextgroup=javalogEquals
syn match javalogEquals /=/ contained nextgroup=javalogValue,javalogString,javalogClass
syn match javalogValue /[^[:space:]&="'\[\];{}]\+/ contained
syn match javalogEmail /\<[[:alnum:]\.+]\+@\w\+\.[[:alnum:]\.]\+\>/
syn match javalogURL /\(https\|http\|ftp\):\/\/[[:alnum:]\.\-]\+:\?\d*\/\?[[:alnum:]\/\.\-%_\*]*/ nextgroup=javalogUrlParams
syn match javalogUrlParams /?/ contained nextgroup=javalogKey

hi link javalogNumber Constant
hi link javalogString Constant
hi link javalogQuotes Statement
hi link javalogNull Error
hi link javalogLevel Statement
hi link javalogLevelError Error
hi link javalogClass Type
hi link javalogLocation Comment
hi link javalogList Constant
hi link javalogListAround Special
hi link javalogHashmapAround Special
hi link javalogSeperator Special
hi link javalogDate Identifier
hi link javalogKey PreProc
hi link javalogEquals Statement
hi link javalogValue Constant
hi link javalogEmail Underlined
hi link javalogURL Underlined
hi link javalogUrlParams Statement

syn region javastackException start=/^[A-Za-z0-9_$\.]\+\(Exception\|Error\|Throwable\):\?/ skip=/^Caused/ end=/^\(\t\| \{8\}\)\@!/me=s-1,he=s-1,re=s-1 contains=javastackStart,javastackClass,javastackParantheses,javastackCausedBy fold keepend
syn match javastackStart /^\(Caused By:\s*\)\?[A-Za-z0-9_$\.]\+\ze:\?/ nextgroup=javastackMessage contained
syn match javastackMessage /:\s\+.*$/hs=s+1 contained
syn match javastackClass /^\s\+\(at \)\?[A-Za-z0-9_$\.]\+/ contained
syn cluster javastackInsideParantheses contains=javastackFile,javastackLinenumber,javastackNative,javastackGenerated
syn region javastackParantheses start=/(/ end=/)/ contains=@javastackInsideParantheses contained
syn match javastackFile /\w\+\.java/ contained
syn match javastackLinenumber /:\zs\d\+/ contained
syn match javastackNative /Native Method/ contained
syn match javastackGenerated /<generated>/ contained
syn region javastackCausedBy start=/^Caused By:/ end=/^Caused By:/me=s-1,he=s-1,re=s-1 contains=javastackStart,javastackClass,javastackParantheses,javastackCausedBy fold contained

hi link javastackException NONE
hi link javastackCausedBy NONE
hi link javastackCausedByString Special
hi link javastackStart Type
hi link javastackMessage Constant
hi link javastackClass Type
hi link javastackParantheses NONE
hi link javastackFile PreProc
hi link javastackLinenumber Constant
hi link javastackNative Special
hi link javastackGenerated Special

