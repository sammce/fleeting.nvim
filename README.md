# Fleeting.nvim

Time is fleeting, and what better way to spend it than ~~configuring~~ using [Neovim](https://github.com/neovim/neovim)!

This plugin simply keeps track of the amount of time you have spent in (currently only in seconds).

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

## How does it work

No, this plugin is not magic (unfortunately). The plugin simply marks the time when you enter and leave neovim, calculates the difference, and stores it in a file at `vim.fn.stdpath("cache") .. "/fleeting.log"`, usually equivalent to `~/.cache/nvim/fleeting.log`. This allows the plugin to persist the timer over multiple neovim sessions.

Running the `Fleet` command in neovim will show a notification detailing the amount of precious fleeting seconds you've spent with neovim open.

## Reset the timer

To reset the timer, simply close neovim and remove the file shown above.

## Contributing

If you would like to contribute, please open a pull request! I'd be more than happy to expand this plugin.
