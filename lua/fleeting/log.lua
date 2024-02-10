local constants = require("fleeting.constants")
local log_file = constants.log_file
local title = constants.title
local global_initialised = constants.global_initialised


-- Show an error notification with the given message.
--- @param message string
local function notify_error(message)
  vim.notify(message, vim.log.levels.ERROR, { title = title })
end


--  Try to open the log file. If it doesn't exist,
--  create it and write the current time to it.
---  @return number? error
local function init()
  local file = io.open(log_file, "r")

  if file == nil then
    file = io.open(log_file, "w")

    if file == nil then
      notify_error("Error while creating log file")
      return 1
    end

    file:write(0 .. "\n")
  end

  file:close()
end


-- Read the duration from the log file (as a number).
--- @return number? duration
local function read()
  if not vim.g[global_initialised] then
    return nil
  end

  local file = io.open(log_file, "r")

  if file == nil then
    notify_error("Error while reading log file")
    return nil
  end

  local duration = tonumber(file:read())

  file:close()

  return duration
end


-- Write the given duration to the log file.
--- @param duration number
--- @return number? error
local function write(duration)
  if not vim.g[global_initialised] then
    return 1
  end

  local file = io.open(log_file, "w")

  if file == nil then
    notify_error("Error while writing to log file")
    return 1
  end

  file:write(duration .. "\n")
  file:close()
end


-- Delete the log file.
local function delete()
  local success = os.remove(log_file)

  if not success then
    notify_error("Error while deleting log file")
    return
  end

  vim.g[global_initialised] = false

  vim.notify("Deleted log file", vim.log.levels.INFO, { title = title })
end


return {
  init = init,
  read = read,
  write = write,
  notify_error = notify_error,
  delete = delete,
}
