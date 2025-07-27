local builtin = require("telescope.builtin")
require("telescope").load_extension("ui-select")

vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fr", builtin.lsp_workspace_symbols)
vim.keymap.set("n", "<leader>fo", builtin.oldfiles)
