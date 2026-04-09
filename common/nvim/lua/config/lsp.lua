local function on_attach(client, buffer)
  local keymap = vim.keymap.set

  keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = buffer })
  keymap("n", "gr", vim.lsp.buf.references, { desc = "Find references", buffer = buffer })
  keymap("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = buffer })
  keymap("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = buffer })
  keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover", buffer = buffer })

  keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions", buffer = buffer })

  keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename", buffer = buffer })

  if client.server_capabilities.documentFormattingProvider then
    keymap("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format", buffer = buffer })
  end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.enable("pyright")

vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        -- Modes: [off, basic, standard, strict]
        typeCheckingMode = "standard",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})

vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰰍",
      [vim.diagnostic.severity.WARN] = "󰀪",
      [vim.diagnostic.severity.HINT] = "󰌶",
      [vim.diagnostic.severity.INFO] = "󰋽",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})
