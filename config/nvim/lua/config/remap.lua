vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { silent = true }

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = 'Show LSP definitions'
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = 'Show line diagnostics'
        keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

        opts.desc = 'Show documentation for what is under cursor'
        keymap.set('n', 'K', vim.lsp.buf.hover, opts)

        opts.desc = 'Show buffer diagnostics'
        keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)
    end,
})

local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

keymap.set('n', '<leader>t', '<cmd>Oil<CR>', opts)
keymap.set('n', '<leader>T', function()
    vim.cmd('vsplit | Oil')
end)
