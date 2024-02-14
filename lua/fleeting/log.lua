local constants = require("fleeting.constants")
local log_file = constants.log_file
local title = constants.title
local global_initialised = constants.global_initialised

local M = {}

-- Show an error notification with the given message.
--- @param message string: the error message
M.notify_error = function(message)
  vim.notify(message, vim.log.levels.ERROR, { title = title })
end


-- Try to convert the log file to the correct format, returning an error code if it fails.
--- @return number? error: an error code, or nil if the file was converted successfully
M.convert = function()
  local file = io.open(log_file, "r+")

  if file == nil then
    M.notify_error("Log file not found")
    return
  end

  local previous_time = tonumber(file:read())

  if previous_time == nil then
    file:close()
    return 1
  end

  file:write(previous_time .. "\n")
  file:write(os.time() .. "\n")

  file:close()
end


--  Try to open the log file. If it doesn't exist,
--  create it and write the current time to it.
---  @return number? error: an error code, or nil if the file was created successfully
M.init = function()
  local file = io.open(log_file, "r")

  if file == nil then
    file = io.open(log_file, "w")

    if file == nil then
      M.notify_error("Error while creating log file")
      return 1
    end

    file:write(0 .. "\n")
    file:write(os.time() .. "\n")

    file:close()
    return
  end

  local previous_time = tonumber(file:read())
  local last_write = tonumber(file:read())

  if previous_time == nil or last_write == nil then
    local err = M.convert()
    if err then
      vim.notify("Invalid log file, run :FleetingReset to reset it", vim.log.levels.ERROR, { title = title })
    end
  end

  file:close()
end


-- Read the duration and time of last write from the log file (numbers).
--- @return number? duration: the duration in seconds, or nil if the file could not be read
--- @return number? last_write: the time the file was last written to, or nil if the file could not be read
M.read = function()
  if not vim.g[global_initialised] then
    return nil
  end

  local file = io.open(log_file, "r")

  if file == nil then
    M.notify_error("Log file not found")
    return nil
  end

  local previous_time = tonumber(file:read())
  local last_write = tonumber(file:read())

  file:close()

  return previous_time, last_write
end


-- Write the given duration to the log file.
--- @param duration number
--- @return number? error: an error code, or nil if the file was written to successfully
M.write = function(duration)
  if not vim.g[global_initialised] then
    return 1
  end

  local file = io.open(log_file, "w")

  if file == nil then
    M.notify_error("Error while writing to log file")
    return 1
  end

  file:write(duration .. "\n")
  file:write(os.time() .. "\n")
  file:close()
end


-- Delete the log file.
M.delete = function()
  local success = os.remove(log_file)

  if not success then
    M.notify_error("Error while deleting log file")
    return
  end

  vim.g[global_initialised] = false

  vim.notify("Deleted log file", vim.log.levels.INFO, { title = title })
end

return M
