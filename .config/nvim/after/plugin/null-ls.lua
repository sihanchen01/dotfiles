local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})


local opts = {
    sources = {
        -- Formatters
        null_ls.builtins.formatting.prettier, -- JS, TS, HTML, CSS, JSON
        null_ls.builtins.formatting.black.with({
            command = "/Users/p1362005/venv/bin/black"
        }),                                  -- Python
        -- null_ls.builtins.formatting.ruff,    -- Python
        null_ls.builtins.formatting.stylua,  -- Lua
        null_ls.builtins.formatting.shfmt,   -- Shell scripts
        null_ls.builtins.formatting.rustfmt, -- Rust
        null_ls.builtins.formatting.hclfmt,  -- HCL

        -- Linters
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.ruff

    },

    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })

            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end
            })
        end
    end

}

null_ls.setup(opts)

return opts
