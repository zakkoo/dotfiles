-- Keymaps that are easy to discover and change later.

local keymap = vim.keymap

keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>o", "<cmd>NvimTreeFocus<cr>", { desc = "Focus file explorer" })
keymap.set("n", "<leader>ff", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", { desc = "Format file" })
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "References" })
keymap.set("n", "<leader>td", "<cmd>lua require('dapui').toggle()<cr>", { desc = "Toggle DAP UI" })
keymap.set("n", "<leader>tb", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "Toggle breakpoint" })
keymap.set("n", "<leader>tc", "<cmd>lua require('dap').continue()<cr>", { desc = "DAP continue" })
