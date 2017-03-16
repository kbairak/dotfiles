if exists("g:loaded_ghub")
    finish
endif
let g:loaded_ghub = 1

function s:strip(input_string)
    return substitute(a:input_string, '^\n*\(.\{-}\)\n*$', '\1', '')
endfunction

function s:get_remote_url()
    let l:url = system('git config --get remote.origin.url')

    " get rid of the '(https|ssh|git)://'
    let l:url = split(l:url, '://')[-1]

    " get rid of (potential) '@'
    let l:url = split(l:url, '@')[-1]

    return s:strip('https://' . l:url)
endfunction

function s:get_branch_name()
    let l:branch_name = system('git branch --contains HEAD')

    " remove the '* '
    return s:strip(split(l:branch_name, '* ')[-1])
endfunction

function s:get_path()
    return s:strip(expand('%'))
endfunction

function s:get_line()
    return s:strip(line('.'))
endfunction

function s:get_github_url()
    return s:strip(s:get_remote_url() . '/blob/' . s:get_branch_name() . '/' . s:get_path() . '#L' . s:get_line())
endfunction

function s:copy_github_url()
    call setreg('+', s:get_github_url())
endfunction

function s:open_github_url()
    call system('open ' . s:get_github_url())
endfunction

command Ghub call s:copy_github_url()
command GhubOpen call s:open_github_url()
