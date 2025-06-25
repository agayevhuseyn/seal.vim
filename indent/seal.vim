if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab

setlocal indentexpr=SealIndent()

function! SealIndent()
    let lnum = v:lnum
    let prev_lnum = prevnonblank(lnum - 1)
    let prev_line = getline(prev_lnum)
    let curr_line = getline(lnum)

    if prev_line =~ 'define.*(.\{-})\s*$'
        return indent(prev_lnum) + &shiftwidth
    endif

    if prev_line =~ 'define\s*(.\{-})\s*\S'
        return indent(prev_lnum)
    endif

    if curr_line =~ '^\s*else\>'
        return indent(prev_lnum) - &shiftwidth
    endif

    if prev_line =~ '^\s*else\>'
        return indent(prev_lnum) + &shiftwidth
    endif

    if prev_line =~ '^\s*\(if\|while\|for\)\>'
        return indent(prev_lnum) + &shiftwidth
    endif

    if prev_line =~ '^\s*\(return\|stop\|skip\)\>'
        return max([0, indent(prev_lnum) - &shiftwidth])
    endif

    if prev_line =~ '[{\[]\s*$'
        return indent(prev_lnum) + &shiftwidth
    endif

    if curr_line =~ '[}\[]'
        return indent(prev_lnum) - &shiftwidth
    endif

    return indent(prev_lnum)
endfunction
