local colors = {
    green = "#98BE65",
    yellow = "#ECBE7B",
    red = "#EC5F67",
}

local handle = vim.fn.system("~/.config/nvim/scripts/moon.py")
handle = string.gsub(handle, "\n", "")

local function moon()
    return handle
end

return {
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = { "NvimTree" },
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
                "WinEnter",
                "BufEnter",
                "BufWritePost",
                "SessionLoadPost",
                "FileChangedShellPost",
                "VimResized",
                "Filetype",
                "CursorMoved",
                "CursorMovedI",
                "ModeChanged",
            },
        },
    },
    sections = {
        lualine_a = { moon },
        lualine_b = { "branch" },
        lualine_c = {
            {
                "diff",
                symbols = { added = "  ", modified = "  ", removed = "  " },
                diff_color = {
                    added = { fg = colors.green },
                    modified = { fg = colors.yellow },
                    removed = { fg = colors.red },
                },
            },
            "diagnostics",
        },
        lualine_x = {
            {
                "fileformat",
                symbols = {
                    unix = "LF",
                    dos = "CRLF",
                    mac = "CR",
                },
            },
            { "filetype" },
            { "lsp_status", icon = "󰍉", symbols = { done = "󰸞" }, ignore_lsp = { "null-ls" } },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
}
