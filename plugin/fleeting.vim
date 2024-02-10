if exists("g:fleeting_loaded")
    finish
endif
let g:fleeting_loaded = 1

command -nargs=0 Fleet lua require('fleeting').notify.fleeting_time()

augroup fleet
    autocmd!
    autocmd VimEnter * lua require('fleeting').timer.start()
    autocmd VimLeavePre * lua require('fleeting').timer.stop()
