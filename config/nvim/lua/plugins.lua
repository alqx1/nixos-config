-- theme
vim.cmd('colorscheme cyberdream')

-- tree-sitter
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("EnableTreesitterHighlighting", { clear = true }),
    desc = "Try to enable tree-sitter syntax highlighting",
    pattern = "*", -- run on *all* filetypes
    callback = function()
        pcall(function() vim.treesitter.start() end)
    end,
})

-- oil
require('oil').setup()

-- lsp
local lsps = {
    {
        "clangd",
        {
            cmd = { "clangd" },
            filetypes = { "c", "cpp", "objc", "objcpp" },
        },
    },
    {
        "nixd",
        {
            cmd = { "nixd" },
            filetypes = { "nix" },
        },
    },
}

for _, lsp in pairs(lsps) do
    local name, config = lsp[1], lsp[2]
    vim.lsp.enable(name)
    if config then
        vim.lsp.config(name, config)
    end
end

-- completion
local cmp = require('cmp')
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp"},
        { name = "buffer" },
        { name = "path" },
    }),
})

_ = require('cmp_nvim_lsp').default_capabilities()
