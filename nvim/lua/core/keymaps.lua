-- Keymaps that are easy to discover and change later.

local keymap = vim.keymap

-- File explorer
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>o", "<cmd>NvimTreeFocus<cr>", { desc = "Focus file explorer" })

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })

-- LSP
keymap.set("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", { desc = "Format file" })
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "References" })

-- DAP (Debug Adapter Protocol)
keymap.set("n", "<leader>td", "<cmd>lua require('dapui').toggle()<cr>", { desc = "Toggle DAP UI" })
keymap.set("n", "<leader>tb", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "Toggle breakpoint" })
keymap.set("n", "<leader>tc", "<cmd>lua require('dap').continue()<cr>", { desc = "DAP continue" })
keymap.set("n", "<leader>so", "<cmd>lua require('dap').step_over()<cr>", { desc = "Step over" })
keymap.set("n", "<leader>si", "<cmd>lua require('dap').step_into()<cr>", { desc = "Step into" })
keymap.set("n", "<leader>su", "<cmd>lua require('dap').step_out()<cr>", { desc = "Step out" })
keymap.set("n", "<leader>tt", "<cmd>lua require('dap').terminate()<cr>", { desc = "Terminate debugging" })
keymap.set("n", "<leader>tr", "<cmd>lua require('dap').restart()<cr>", { desc = "Restart debugging" })
