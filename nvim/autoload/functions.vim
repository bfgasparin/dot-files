" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! functions#WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

function! functions#DeleteFileAndCloseBuffer()
	let choice = confirm("Delete file and close buffer?", "&Do it!\n&Nonono", 1)
	if choice == 1 | call delete(expand('%:p')) | q! | endif
endfunction
