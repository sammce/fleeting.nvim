--- Show an error notification with the given message.
---
--- @param message string
local function notify_error(message)
  vim.notify(message, vim.log.levels.ERROR, { title = "Fleet" })
end

-- TODO: Make this work on non *nix systems
local log_file = vim.fn.stdpath("cache") .. "/fleet.log"

---  Try to open the fleet log file. If it doesn't exist,
---  create it and write the current time to it.
---
---  @return number? error
local function init()
  local file = io.open(log_file, "r")

  if file == nil then
    file = io.open(log_file, "w")

    if file == nil then
      notify_error("Error while creating fleet log file")
      return 1
    end

    file:write("0\n")
  end

  file:close()
end

--- Read the duration from the fleet log file (as a number).
---
--- @return number? duration
local function read()
  if not vim.g.fleet_initialised then
    return nil
  end

  local file = io.open(log_file, "r")

  if file == nil then
    notify_error("Error while reading fleet log file")
    return nil
  end

  local duration = tonumber(file:read())

  file:close()

  return duration
end

--- Write the given duration to the fleet log file.
---
--- @param duration number
--- @return number? error
local function write(duration)
  if not vim.g.fleet_initialised then
    return 1
  end

  local file = io.open(log_file, "w")

  if file == nil then
    notify_error("Error while writing to fleet log file")
    return 1
  end

  file:write(duration .. "\n")
  file:close()
end

return {
  init = init,
  read = read,
  write = write,
  notify_error = notify_error
}
