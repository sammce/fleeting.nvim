local log = require("fleet.log")

--- Calculate the total time spent in Neovim, without stopping the timer.
--
--- @return number? total_time
local function total()
  local previous_time = log.read()

  if previous_time == nil then
    return nil
  end

  local elapsed = os.difftime(os.time(), vim.g.fleet_start_time)

  return previous_time + elapsed
end

--- Calculate the elapsed time and write it to the log file.
local function stop()
  local total_time = total()

  if total_time == nil then
    return
  end

  log.write(total_time)

  vim.g.fleet_start_time = nil
end

--- Set the start time to the current time and initialise the log file.
local function start()
  vim.g.fleet_start_time = os.time()

  local error = log.init()
  if not error then
    vim.g.fleet_initialised = true
  end
end


return {
  stop = stop,
  start = start,
  total = total
}
