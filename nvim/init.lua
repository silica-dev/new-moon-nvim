require("config.lazy")
require("config.telescope")

vim.cmd.color("lunar")
vim.opt.cursorline = true

vim.o.winborder = "rounded"

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    desc = "Hightlight selection on yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 120 })
    end,
})

-- transparency
local trans_groups = {
    "Normal",
    "NvimTreeNormal",
    "NvimTreeNormalFloat",
    "NvimTreeNormalNC",
    "NvimTreePopup",
    "NormalNC",
    "Comment",
    "Constant",
    "Special",
    "Identifier",
    "Statement",
    "PreProc",
    "Type",
    "Underlined",
    "Todo",
    "String",
    "Function",
    "Conditional",
    "Repeat",
    "Operator",
    "Structure",
    "LineNr",
    "NonText",
    "SignColumn",
    "EndOfBuffer",
}
for _, group in ipairs(trans_groups) do
    vim.cmd.highlight({ group, "ctermbg=NONE", "guibg=NONE" })
end

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "󰌶",
            [vim.diagnostic.severity.INFO] = "󰌶",
        },
    },
})

-- keymap
vim.keymap.set("n", "<Tab>", ":bn<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")
vim.keymap.set("n", "<S-X>", ":BufferKill<CR>")
vim.keymap.set("n", "gR", ":lua vim.lsp.buf.rename()<CR>")

vim.keymap.set("n", "ge", ":lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "gE", ":lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("v", "ge", ":lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("v", "gE", ":lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "Y", "+y")
vim.keymap.set("n", "P", "+p")
vim.keymap.set("n", "ga", require("actions-preview").code_actions)
vim.keymap.set("n", "<leader>dB", "ggdG")
vim.keymap.set("n", "<leader>lp", ":LatexPreviewToggle<CR>")
vim.keymap.set("n", "<leader>l[", ":PrevLatexPreviewMode<CR>")
vim.keymap.set("n", "<leader>l]", ":NextLatexPreviewMode<CR>")

vim.keymap.set("n", "<PageUp>", "<nop>")
vim.keymap.set("n", "<PageDown>", "<nop>")
vim.keymap.set("i", "<PageUp>", "<nop>")
vim.keymap.set("i", "<PageDown>", "<nop>")
vim.keymap.set("v", "<PageUp>", "<nop>")
vim.keymap.set("v", "<PageDown>", "<nop>")

vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<Leader>c", ":bd<CR>")
vim.keymap.set("n", "<Leader>Lc", ":e $MYVIMRC<CR>")
vim.keymap.set("n", "<Leader>Ls", "<CMD>SessionManager load_session<CR>")

vim.keymap.set("n", "S", ":%s//g<Left><Left>")

vim.opt.clipboard = "unnamed"

vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.wo.relativenumber = true
vim.wo.number = true

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_command('silent! normal! g`"zv')
    end,
})

-- autoformat on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
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
})

-- config needs to be done here for some reason
local config = require("session_manager.config")
require("session_manager").setup({
    autoload_mode = config.AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. See "Autoload mode" section below.
    autosave_last_session = true,              -- Automatically save last session on exit and on session switch.
    autosave_ignore_not_normal = true,         -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
    autosave_ignore_dirs = {},                 -- A list of directories where the session will not be autosaved.
    autosave_ignore_filetypes = {              -- All buffers of these file types will be closed before the session is saved.
        "gitcommit",
        "gitrebase",
    },
    autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
    autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
    max_path_length = 80,          -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
    load_include_current = false,  -- The currently loaded session appears in the load_session UI.
})
