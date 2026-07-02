local lsp = require("lsp-zero")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp.preset("recommended")

lsp.ensure_installed({
    'rust_analyzer',
    'eslint',
    'lua_ls',
    'gopls',
    'terraformls',
    'ruff',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- Disable <Tab> for completion if preferred
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})


lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    -- Auto-format on save
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            callback = function()
                -- Check and exclude YAML
                if vim.bo.filetype ~= "yaml" then
                    vim.lsp.buf.format({ async = false })
                end
            end,
        })
    end
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

-- gopls
require('lspconfig').gopls.setup({
    on_attach = lsp.on_attach,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
            usePlaceholders = true,
            completeUnimported = true, -- Enable auto-import
            experimentalPostfixCompletions = true,
        },
    },
    capabilities = capabilities
})

-- pyright
require('lspconfig').pyright.setup({
    on_attach = lsp.on_attach, -- Reuse the global on_attach
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic", -- "off", "basic", or "strict"
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
    capabilities = capabilities
})
