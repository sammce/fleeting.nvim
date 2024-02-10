if exists("g:fleet_loaded")
    finish
endif
let g:fleet_loaded = 1

command -nargs=0 Fleet lua require('fleet').notify.fleet_time()

augroup fleet
    autocmd!
    autocmd VimEnter * lua require('fleet').timer.start()
    autocmd VimLeavePre * lua require('fleet').timer.stop()
