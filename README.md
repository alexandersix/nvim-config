# Alex's Neovim Config

*Built live on stream on [my Twitch channel](https://twitch.tv/alexandersix_) - follow for 
notifications when I go live to build other things like this!*

This is my personal, custom Neovim setup, written in Lua! It is built to work well with the 
sorts of web projects that I work on, including mostly Laravel and JavaScript projects, but 
it is easily extensible to other types of programming as well. Be forewarned, though, these
dotfiles are my personal dotfiles, and are subject to change at any time.

As always, feel free to use these as a reference or a template, but make sure to configure 
Neovim to **YOUR** liking. That means plugins, keymaps, and options. Using my files as-is
will certainly work, but going through to tweak them to your specifications will make sure
that you have more of an idea of what's going on!

## How this Config Works

This config consists of a few important files:

`init.lua` - The entrypoint to the config which will *rarely* be changed

`options.lua` - All Neovim options (ex: tabstop, number, etc.)

`keybinds.lua` - All of my non-plugin-related keymappings

`lua/plugins/X.lua` - Each plugin has its own dedicated installation/configuration file 
(more on this below)

### Adding a New Plugin

This config uses the [Lazy Plugin Manager](https://github.com/folke/lazy.nvim), which is
similar to Packer but with a few notable differences; for our purposes, the focus on lazy-loading
is the most important.

In order to add a new plugin, create a new Lua file in the `lua/plugins/` directory. You 
can call the file whatever you want, but the convention is to name the file after the plugin.
Once the file is created, you can add your plugin declaration and on Neovim's next start,
Lazy will see the file and install the plugin.

### Configuring a Plugin

You can add a `config` key to the plugin table in each of the plugin Lua files in the 
`lua/plugins/` directory. This `config` should have a Lua function as a value, where 
you can run whatever configuration and setup code is needed for the plugin. This should
look like the following:

```lua
{
    config = function()
        -- configuration and setup goes here
    end
}
```

### Adding Key Bindings for a Plugin

In order to leverage the lazy-loading functionality of the Lazy plugin manager, you can 
add a `keys` key to the plugin table in each of the plugin Lua files in the `lua/plugins/`
directory. This should look like the following:

```lua
{
    keys = {
        { "<leader>fm", function() require("harpoon.mark").add_file() end }
    }
}
```

where the first parameter of each key mapping is the key combination to be pressed and the
second parameter is the code to be executed when the mapping is initiated.


## Features

- Startup Dashboard
- LSP and Code Completion (including format-on-save)
- Syntax Highlighting & Indentation w/ Treesitter
- Built-Tn Testing Capabilities
- Fuzzy Finder
- Quick File Navigation w/ Harpoon
- Git Integrations
- Tmux Integrations
- Undo Tree Navigation

## License

[GPL3](https://choosealicense.com/licenses/gpl-3.0/)

