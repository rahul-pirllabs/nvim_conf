local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep >")});
end)
vim.keymap.set('n', '<leader>pws', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>pwd', builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set('n', '<leader>pd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>pgd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>prr', builtin.lsp_references, {})
