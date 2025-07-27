local nlsp = {
    config_home = "~/.config/nvim/lsp-settings",
    append_default_schemas = true,
    ignored_servers = {},
    loader = "json",
}

-- autoformat on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local nonels = {
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
}

local nvim_tree = {
    diagnostics = {
        enable = true,
        icons = {
            hint = "󰌶",
            info = "󰌶",
            warning = "",
            error = "",
        },
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    renderer = {
        highlight_git = true,
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                git = {
                    unstaged = "U",
                    staged = "S",
                    unmerged = "UM",
                    renamed = "R",
                    deleted = "D",
                    untracked = "X",
                    ignored = "I",
                },
            },
        },
    },
}

return {
    { "neovim/nvim-lspconfig" },
    { "tamago324/nlsp-settings.nvim",   opts = nlsp },
    { "nvimtools/none-ls.nvim",         opts = nonels },
    { "jay-babu/mason-null-ls.nvim",    event = { "BufReadPre", "BufNewFile" }, opts = { handlers = {} } },
    { "mason-org/mason-lspconfig.nvim", opts = {} },
    { "mason-org/mason.nvim",           opts = {} },
    "folke/tokyonight.nvim",
    "lunarvim/lunar.nvim",
    { "nvim-lua/plenary.nvim" },
    { "nvim-lua/popup.nvim" },
    { "nvim-telescope/telescope.nvim",   tag = "0.1.8" },
    { "windwp/nvim-autopairs",           opts = {} },
    { "nvim-treesitter/nvim-treesitter", opts = { branch = "master", lazy = false, build = ":TSUpdate" } },
    { "kyazdani42/nvim-tree.lua",        opts = nvim_tree },
    { "numToStr/Comment.nvim",           opts = {} },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = require("config.lualine"),
    },
    { "akinsho/bufferline.nvim", opts = require("config.bufferline") },
    { "RRethy/vim-illuminate" },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = "▏" },
        },
    },
}
