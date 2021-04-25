"
"



if &cp || exists('g:json2ts')
    finish
endif
let g:json2ts = 1
let s:save_cpo = &cpo
set cpo&vim


" @see https://stackoverflow.com/questions/4976776/how-to-get-path-to-the-current-vimscript-being-executed
let s:selfPath = resolve(expand('<sfile>:p'))
let s:bridgeJsPath = fnamemodify(s:selfPath, ':h') . '/bridge.js'

" @return string[]
function s:Json2tsFromClipboard()
    let command = 'node ' . shellescape(s:bridgeJsPath)
    let lines = systemlist(command)
    let first = get(lines, 0, '')
    if first !=# 'isValidJSON=true'
        echomsg 'json2ts failed: The system clipboard has no valid json string!'
        return
    endif
    let jsonLines = slice(lines, 1)
    call append(line('.'), jsonLines)
endfunction


command -nargs=0 Json2ts call s:Json2tsFromClipboard()


if !exists('g:json2ts_custom_keymap')
    nnoremap <leader>t :Json2ts<CR>
endif


let &cpo = s:save_cpo
