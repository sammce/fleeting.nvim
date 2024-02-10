local units = require("fleeting.units")

return {
  -- The path to the log file
  -- TODO: Make this work on non *nix systems
  log_file = vim.fn.stdpath("cache") .. "/fleeting.log",

  -- The title for the notifications
  title = "Fleeting.nvim",

  -- Format the message to display in the timer notification.
  --- @param total_time number: the total time in seconds
  --- @return string formatted_time: the formatted time string
  fleeting_time_msg = function(total_time)
    formatted_time = units.format_time(total_time)
    return "You have spent > " .. formatted_time .. " of your life in Neovim"
  end,

  -- The name of the global variable that stores the start time
  global_start = "fleeting_start_time",

  -- The name of the global variable that stores the initialisation status
  global_initialised = "fleeting_initialised"
}
