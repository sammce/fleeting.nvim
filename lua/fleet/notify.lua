local timer = require("fleet.timer")

local function fleet_time()
  local total_time = timer.total()

  vim.notify("You have spent (at least) " .. total_time .. " seconds of your life in Neovim", vim.log.levels.INFO,
    { title = "Fleet" })
end

return {
  fleet_time = fleet_time
}
