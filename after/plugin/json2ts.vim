"
"



if &cp || exists('g:json2ts')
    finish
endif
let g:json2ts = 1
let s:save_cpo = &cpo
set cpo&vim

function! s:OpenUrl(url)
    if strlen(a:url)
        " open url from shell command line
        " @see http://www.dwheeler.com/essays/open-files-urls.html
        let urlStr = shellescape(a:url)
        let cmdStr = ''

        if has('win32') || has('win64')
            let cmdStr = 'cmd /c start "" ' . urlStr
        elseif has('mac')
            let cmdStr = 'open -a Safari ' . urlStr
            let findStr = system('ls /Applications/ | grep -i google\ chrome')
            let findStrLocal = system('ls ~/Applications/ | grep -i google\ chrome')
            if strlen(findStr) > 5 || strlen(findStrLocal) > 5
                let cmdStr = 'open -a Google\ Chrome ' . urlStr
            endif
        elseif has('unix')
            " unix/linux
            let cmdStr = 'xdg-open ' . urlStr . ' &'
        else
            echomsg 'Url "' . urlStr . '" can NOT be opened!'
            return
        endif

        call system(cmdStr)
        echomsg cmdStr

    endif
endfunction




if !exists('g:json2ts_custom_keymap')
    nnoremap <leader>t :TryParseAndPaste<CR>
endif


let &cpo = s:save_cpo
