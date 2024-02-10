-- The number of seconds in various time units
local units = {
  year = 31536000,
  weeks = 604800,
  day = 86400,
  hour = 3600,
  minutes = 60,
  seconds = 1
}


-- Decide the maximum number of units to display
--- @param seconds number: the number of seconds to convert
--- @return string unit: the maximum unit to display
local function max_unit(seconds)
  local max = "seconds"

  for unit, value in pairs(units) do
    if seconds >= value then
      max = unit
    end
  end

  return max
end


-- Convert a number of seconds to a string of time units
--- @param seconds number: the number of seconds to convert
--- @return string result: the formatted string
local function format_time(seconds)
  local result = ""
  local max = max_unit(seconds)

  for unit, value in pairs(units) do
    local count = math.floor(seconds / value)

    if count > 0 then
      result = result .. count .. " " .. unit .. " "
      seconds = seconds - count * value
    end

    if unit == max then
      break
    end
  end

  return result
end


return { format_time = format_time, max_unit = max_unit }
