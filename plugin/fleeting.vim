if exists("g:fleeting_loaded")
    finish
endif
let g:fleeting_loaded = 1

command -nargs=0 Fleeting lua require('fleeting').notify.fleeting_time()
command -nargs=0 FleetingReset lua require('fleeting').timer.reset()
command -nargs=0 FleetingDelete lua require('fleeting').log.delete()

augroup fleet
    autocmd!
    autocmd VimEnter * lua require('fleeting').timer.start()
    autocmd VimLeavePre * lua require('fleeting').timer.stop()
