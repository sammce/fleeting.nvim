local constants = require("fleeting.constants")


-- Show a notification with the fleeting time.
local function fleeting_time()
  local total_time = require("fleeting.timer").total()

  vim.notify(
    constants.fleeting_time_msg(total_time),
    vim.log.levels.INFO,
    { title = constants.title }
  )
end


return {
  fleeting_time = fleeting_time
}
