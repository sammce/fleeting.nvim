local log = require("fleeting.log")
local constants = require("fleeting.constants")

local global_start = constants.global_start
local global_initialised = constants.global_initialised


-- Calculate the total time spent in Neovim, without stopping the timer.
--- @return number? total_time: the total time in seconds, or nil if the timer has not been initialised
local function total()
  local previous_time = log.read()

  if previous_time == nil then
    return nil
  end

  local elapsed = os.difftime(os.time(), vim.g[global_start])

  return previous_time + elapsed
end


-- Calculate the elapsed time and write it to the log file.
local function stop()
  local total_time = total()

  if total_time == nil then
    return
  end

  log.write(total_time)

  vim.g[global_start] = nil
end


-- Set the start time to the current time and initialise the log file.
local function start()
  vim.g[global_start] = os.time()

  local error = log.init()
  if not error then
    vim.g[global_initialised] = true
  end
end


-- Reset the timer and log file.
local function reset()
  vim.g[global_start] = os.time()
  log.write(0)

  vim.notify("Timer reset", vim.log.levels.INFO, { title = constants.title })
end


return {
  stop = stop,
  start = start,
  total = total,
  reset = reset,
}
