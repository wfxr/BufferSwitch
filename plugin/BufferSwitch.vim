" BufferSwitch:  Switch buffer by its position number in the buffers list
" Date:    2015-01-03
" Version: 1.1
"
" This script provides a function to switch to  a vim buffer by passing it the position in the buffers list and maps it to <M-number> to easily switch between open buffers.

function! BufferSwitch_ActivateBuffer(num)
    let l:count = 1
    for i in range(1, bufnr("$"))
        if buflisted(i) && getbufvar(i, "&modifiable") 
            if l:count == a:num
                exe "buffer " . i
                return 
            endif
            let l:count = l:count + 1
        endif
    endfor
    echo "No buffer!"
endfunction

function! BufferSwitch_Initialize()
    for i in range(1, 9) 
        exe "map " . i . " :call BufferSwitch_ActivateBuffer(" . i . ")<CR>"
    endfor
endfunction

autocmd VimEnter * call BufferSwitch_Initialize()
