syntax keyword sealKeyword define if then else while for
syntax keyword sealKeyword skip stop return
syntax keyword sealKeyword and or not
syntax keyword sealKeyword include as do in typeof

syntax match sealBuiltin /\<\%(print\|scan\|exit\|len\|int\|float\|str\|bool\|push\|pop\)\>\ze\s*(/

syntax keyword sealBoolean true false null

syntax match sealNumber /-\?\<\d\+\>/
syntax match sealNumber /-\?\<\d\+\.\d*\>/
syntax match sealNumber /\<0x\x\+\>/

syntax match sealString /"\([^"\\]\|\\.\)*"/
syntax match sealString /'\([^'\\]\|\\.\)*'/
syntax match sealEscape /\\./ containedin=sealString

syntax match sealComment "//.*"
syntax region sealComment start="/\*" end="\*/" contains=sealComment

highlight def link sealKeyword Keyword
highlight def link sealBoolean Boolean
highlight def link sealNumber Number
highlight def link sealString String
highlight def link sealEscape Special
highlight def link sealComment Comment
highlight def link sealBuiltin Function


setlocal formatoptions+=cro
