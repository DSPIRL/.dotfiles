-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
-- require("nushell")

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "csharp_ls", "pylsp", "bashls", "nushell" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }
end


-- lspconfig.nu.setup {
--     cmd = { "nu", "--lsp" }, -- Command to start the Nushell LSP
--     filetypes = { "nu" },    -- Filetypes associated with Nushell
--     root_dir = lspconfig.util.root_pattern(".git", "."),
--     -- on_attach = nvlsp.on_attach,
--     -- on_init = nvlsp.on_init,
--     -- capabilities = nvlsp.capabilities,
-- }


-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
