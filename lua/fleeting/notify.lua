local constants = require("fleeting.constants")

local M = {}

-- Show a notification with the fleeting time.
M.fleeting_time = function()
  local total_time = require("fleeting.timer").total()

  if total_time == nil then
    return
  end

  vim.notify(
    constants.fleeting_time_msg(total_time),
    vim.log.levels.INFO,
    { title = constants.title }
  )
end

return M
