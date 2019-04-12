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

    " get rid of (potential) 'git@'
    let l:url = split(l:url, '@')[-1]

    return s:strip('https://' . l:url)
endfunction

function s:get_branch_name()
    let l:branch_name = system('git symbolic-ref HEAD 2> /dev/null')
    if l:branch_name == ''
        let l:branch_name = system('git rev-parse --short HEAD 2> /dev/null')
    else
        let l:branch_name = split(l:branch_name, '/')[-1]
    endif
    return s:strip(l:branch_name)

    "let l:branch_name = system('git branch --contains HEAD | head -1')

    "" remove the '* '
    "return s:strip(split(l:branch_name, '* ')[-1])
endfunction

function s:get_path()
    let l:pwd = getcwd()
    let l:return_value = s:strip(expand('%'))
    if stridx(l:return_value, l:pwd)
        let l:return_value = l:return_value[strlen(l:pwd):]
    endif
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
