syntax keyword sealKeyword define if then else while for
syntax keyword sealKeyword skip stop return
syntax keyword sealKeyword and or not
syntax keyword sealKeyword include as do in typeof

syntax match sealBuiltin /\<\%(print\|scan\|exit\|len\|int\|float\|push\|pop\)\>\ze\s*(/

syntax keyword sealBoolean true false null

syntax match sealNumber /\v(0x[0-9A-Fa-f]+)/
syntax match sealNumber /\v\d+/
syntax match sealNumber /\v\d+\.\d+/

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
