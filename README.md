# new-moon-nvim

Config files based on LunarVim, but without hard dependencies on specific versions of plugins

## Purpose

I have been using LunarVim as my neovim distribution for a long time now. It has relatively sane defaults and is reasonably easy to configure. However, its development has been discontinued for a while, and I am running into issues using LSPs without error messages. As such, I have ported the important (in my opinion) parts of the distrubution to regular neovim config files.

## Limitations

DAP config and breadcrumbs have not been included because I never used those features. I have also edited the lualine bar and bufferline to my liking, mostly because i don't know how exactly to replicate the original config. However, the general design ethos has been maintained. My purpose with this project was to port my own config primarily; replicating lunarvim in general is secondary.

## Dependencies

- Latest neovim
- Latest python 3.x (for moon icon)
- [Python Astral Module](https://pypi.org/project/astral/) (for moon icon)

## Usage

The following files are used for the following purposes. Pick and choose as needed, or just decompress the whole `nvim` folder into `~/.config/nvim` (or whatever the windows equivalent is) if you're feeling adventurous:

- **init.lua:** initialized lazy and telescope configs, as well as my own personal keybinds and the lunarvim keybinds I actually had use for. Also configures some modules that don't play nicely with lazy.nvim
- **lua/plugins/lunarvim.lua:** Loads and configures most lunarvim-specific plugins that don't require extensive configurations
- **lua/plugins/alpha.lua:** Custom dashboard screen similarly styled to the lunarvim native one
- **lua/plugins/gitsigns.lua:** Configures gitsigns to use lunarvim-style icons
- **lua/plugins/lazydev.lua:** Sets up lazydev so lua LSPs correctly parse nvim config files.
- **lua/plugins/nvim-cmp.lua:** nvim-cmp setup to use LSP, buffer, and filepaths for completion
- **lua/plugins/session-management.lua:** session management setup used to replace the unmaintained project module used by LunarVim
- **lua/config/bufferline.lua:** minimalist bufferline at the top of the terminal to display diagnostics and open files
- **lua/config/lazy.lua:** lazy.nvim bootstrap script
- **lua/config/lualine.lua:** custom lualine styled after the LunarVim one but with some modifications
- **lua/config/telescope.lua:** telescope fuzzy-finder config with separate keybinds from the LunarVim ones because i literally never used them.
- **scripts/moon.py:** helper script for the moon icon in the statusline. **If you are on Windows, the way this is called by lualine will probably have to be changed.**
- **ftplugin/markdown.lua:** changes to screenline-editing for j and k for markdown files. Could make the behavior of these keys unintuitive for movement operations like `5j` or `3j`, but it generally seems fine for text manipulation operations.

## Future Plans

1. Reorganize the config so that LunarVim configuration is separate from my personal configuration
2. Implement LazyGit support
3. Maybe figure out the projects module
4. Maybe figure out breadcrumbs in the bufferline.
