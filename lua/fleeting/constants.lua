return {
  -- The path to the log file
  -- TODO: Make this work on non *nix systems
  log_file = vim.fn.stdpath("cache") .. "/fleeting.log",

  -- The title for the notifications
  title = "Fleeting.nvim",

  -- The message to display in the timer notification
  fleeting_time_msg = function(total_time)
    return "You have spent (at least) " .. total_time .. " seconds of your life in Neovim"
  end,

  -- The name of the global variable that stores the start time
  global_start = "fleeting_start_time",

  -- The name of the global variable that stores the initialisation status
  global_initialised = "fleeting_initialised"
}
