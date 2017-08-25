
syn clear

setlocal iskeyword=@,48-57,_,-,.,192-255
setlocal foldmethod=syntax
setlocal foldlevel=1

syn region hapComment start=/^\s*#/ end=/$/
hi link hapComment Comment

syn cluster hapAll contains=hapComment
syn cluster hapGlobal contains=@hapAll
syn cluster hapDefaults contains=@hapAll
syn cluster hapRuleset contains=@hapAll
syn cluster hapListen contains=@hapAll
syn cluster hapFrontend contains=@hapAll
syn cluster hapBackend contains=@hapAll
syn cluster hapPeers contains=@hapAll

syn region hapString start=/./ end=/\(\s\|$\)/ skip=/\\\s/ contained contains=hapEscapeSpace
syn region hapString16 start=/\s*"/ end=/"/ skip=/\\"/ contained
syn region hapLog start=/./ end=/\(\s\|$\)/ skip=/\\\s/ contained contains=hapEscapeSpace,hapEscapedPercent,hapLogStart
syn region hapLog16 start=/\s*"/ end=/"/ skip=/\\"/ contained contains=hapEscapedPercent,hapLogStart
syn match hapEscapeSpace /\\\s/ contained
syn match hapNumber /\d\+/ contained
syn match hapIpPort /\d\+\.\d\+\.\d\+\.\d\+:\d\+/
syn region hapParantheses start=/(/ end=/)/ contained contains=hapFunctionParameter
syn match hapFunctionParameter /\k\+/ contained
syn match hapError /.\+/ contained
syn match hapFunction /\k\+/ contained nextgroup=hapParantheses
syn match hapLogStart /%/ contained nextgroup=hapLogFormatting,hapLogVarRegion,hapLogVar
syn match hapEscapedPercent /%%/ contained transparent contains=NONE
syn region hapLogFormatting start=/{/ end=/}/ contained nextgroup=hapLogVarRegion,hapLogVar
syn region hapLogVarRegion start=/\[/ end=/\]/ contained contains=hapFunction
syn match hapLogVar /\k\+/ contained
syn keyword hapSectionHeader nextgroup=hapString skipwhite contained listen frontend backend


hi link hapSectionHeader Identifier
hi link hapString Constant
hi link hapString16 Constant
hi link hapLog Constant
hi link hapLog16 Constant
hi link hapEscapeSpace Special
hi link hapNumber Constant
hi link hapIpPort Type
hi link hapKeyword NONE
hi link hapParantheses NONE
hi link hapFunctionParameter Constant
hi link hapError Error
hi link hapFunction PreProc
hi link hapLogStart NONE
hi link hapLogVar Identifier
hi link hapLogFormatting Type


syn region hapServerRegion start=/^\s*server/ end=/$/ contains=hapServer,hapServerArguments,hapServerSpecialArguments skipwhite contained keepend
syn keyword hapServer nextgroup=hapServerNamePilot,hapServerName skipwhite contained server
syn match hapServerName /\k\+/ nextgroup=hapIpPort skipwhite contained
syn match hapServerNamePilot /\k\+pilot\k\+/ nextgroup=hapIpPort skipwhite contained
syn keyword hapServerArguments contained
\ check slowstart backup non-stick cookie inter send-proxy
syn keyword hapServerArguments contained nextgroup=hapString
\ id port
syn keyword hapServerSpecialArguments contained disabled
syn cluster hapBackend add=hapServerRegion
syn cluster hapListen add=hapServerRegion

hi link hapServer Identifier
hi link hapServerArguments Statement
hi link hapServerSpecialArguments Error
hi link hapServerName Constant
hi link hapServerNamePilot Special

syn region hapStickRegion start=/^\s*stick/ end=/$/ contains=hapStickOn,hapStickStoreResponse
syn match hapStickOn /^\s*stick on/ contained skipwhite nextgroup=hapFunction
syn match hapStickStoreResponse /^\s*stick store-response/ contained skipwhite nextgroup=hapFunction
syn match hapStickJessionid /JSESSIONID/ contained containedin=hapStickRegion,hapParantheses
syn cluster hapBackend add=hapStickRegion
syn cluster hapListen add=hapStickRegion

hi link hapStickOn Identifier
hi link hapStickStoreResponse Identifier
hi link hapStickJessionid Special

syn keyword hapFrontendKeywords contained reqrep reqirep use_backend default_backend
syn cluster hapFrontend add=hapFrontendKeywords

hi link hapListenKeywords NONE
hi link hapFrontendKeywords Identifier

syn keyword hapLogFormat contained skipwhite nextgroup=hapLog,hapLog16 log-format
syn cluster hapDefaults add=hapLogFormat
syn cluster hapListen add=hapLogFormat
syn cluster hapFrontend add=hapLogFormat

hi link hapLogFormat Identifier

syn match hapOption /\(no \)\?option/ contained skipwhite nextgroup=hapOptionName
syn match hapOptionName /\k\+/ contained
syn cluster hapAll add=hapOption

hi link hapOption Identifier
hi link hapOptionName Statement

syn region hapSectionGlobal matchgroup=hapSectionHeader start=/^\s*global/ end=/^\s*\(listen\|global\|defaults\|frontend\|backend\|ruleset\|peers\)/re=s-1,me=s-1,he=s-1 fold contains=@hapGlobal
syn region hapSectionDefaults matchgroup=hapSectionHeader start=/^\s*defaults/ end=/^\s*\(listen\|global\|defaults\|frontend\|backend\|ruleset\|peers\)/re=s-1,me=s-1,he=s-1 fold contains=@hapDefaults
syn region hapSectionRuleset matchgroup=hapSectionHeader start=/^\s*ruleset/ end=/^\s*\(listen\|global\|defaults\|frontend\|backend\|ruleset\|peers\)/re=s-1,me=s-1,he=s-1 fold contains=@hapRuleset
syn region hapSectionListen start=/^\s*listen/ end=/^\s*\(listen\|global\|defaults\|frontend\|backend\|ruleset\|peers\)/re=s-1,me=s-1,he=s-1 fold contains=hapSectionHeader,@hapListen
syn region hapSectionFrontend start=/^\s*frontend/ end=/^\s*\(listen\|global\|defaults\|frontend\|backend\|ruleset\|peers\)/re=s-1,me=s-1,he=s-1 fold contains=hapSectionHeader,@hapFrontend
syn region hapSectionBackend start=/^\s*backend/ end=/^\s*\(listen\|global\|defaults\|frontend\|backend\|ruleset\|peers\)/re=s-1,me=s-1,he=s-1 fold contains=hapSectionHeader,@hapBackend
syn region hapSectionPeers start=/^\s*peers/ end=/^\s*\(listen\|global\|defaults\|frontend\|backend\|ruleset\|peers\)/re=s-1,me=s-1,he=s-1 fold contains=hapSectionHeader,@hapPeers
