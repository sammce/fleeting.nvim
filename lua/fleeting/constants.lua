local units = require("fleeting.units")

local M = {}

M.is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win32unix") == 1
M.path_sep = M.is_windows and "\\" or "/"

-- The path to the log file
M.log_file = vim.fn.stdpath("cache") .. M.path_sep .. "fleeting.log"

-- The title for the notifications
M.title = "Fleeting.nvim"

-- Format the message to display in the timer notification.
--- @param total_time number: the total time in seconds
--- @return string formatted_time: the formatted time string
M.fleeting_time_msg = function(total_time)
  local formatted_time = units.format_time(total_time)
  return "You have spent (at least) " .. formatted_time .. " of your life in Neovim"
end

-- The name of the global variable that stores the start time
M.global_start = "fleeting_start_time"

-- The name of the global variable that stores the initialisation status
M.global_initialised = "fleeting_initialised"

return M
