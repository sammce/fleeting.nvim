# Fleeting.nvim

Time is fleeting, and what better way to spend it than ~~configuring~~ using [Neovim](https://github.com/neovim/neovim)!

This plugin simply keeps track of the amount of time you have spent in neovim (since installing it, it's not magic).

This is a dastardly simple plugin, and by dastardly simple, I mean I wrote it today.
Today is obviously not _today_ for you, but it is for me. Anyway...

## Installation

##### Please note: this plugin currently only works on \*nix systems.

Using lazy:

```lua
{
    'sammce/fleeting.nvim'
},
```

## Usage

Refer to the table of command below:

| Command           | Effect                                                          |
| ----------------- | --------------------------------------------------------------- |
| `:Fleeting`       | Displays a notification showing how long you've spent in neovim |
| `:FleetingReset`  | Reset the timer and log file to 0. Doesn't get your time back   |
| `:FleetingDelete` | Delete the log file, effectively resetting the timer            |

## How does it work

No, again, this plugin is not magic (unfortunately). The plugin simply marks the time when you enter and leave neovim, calculates the difference, and stores it in a file at `vim.fn.stdpath("cache") .. "/fleeting.log"`, usually equivalent to `~/.cache/nvim/fleeting.log`. This allows the plugin to persist the timer over multiple neovim sessions.

## Contributing

If you would like to contribute, please open a pull request! I'd be more than happy to expand this plugin.
