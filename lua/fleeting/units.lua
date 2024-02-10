-- The number of seconds in various time units
local units = {
  years = 31536000,
  months = 2592000,
  weeks = 604800,
  days = 86400,
  hours = 3600,
  minutes = 60,
  seconds = 1,
}


-- Convert a number of seconds to a string of time units
--- @param seconds number: the number of seconds to convert
--- @return string result: the formatted string
local function format_time(seconds)
  local result = {}

  for unit, value in pairs(units) do
    local count = math.floor(seconds / value)
    seconds = seconds % value
    if count > 0 then
      table.insert(result, count .. " " .. unit)
    end
  end

  return table.concat(result, ", ")
end

return { format_time = format_time }
