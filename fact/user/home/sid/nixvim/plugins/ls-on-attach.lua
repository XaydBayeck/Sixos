local wk = require("which-key")
local lsp_on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local lspmapping = { g = {
    a = { vim.lsp.buf.code_action, "code action" },
    D = { vim.lsp.buf.declaration, "declaration" },
    d = { vim.lsp.buf.definition, "definition" },
    h = { vim.lsp.buf.hover, "hover" },
    i = { vim.lsp.buf.implementation, "implementation" },
    k = { vim.lsp.buf.signature_help, "signature help" },
    r = {
      name = "references+rename",
      r = { vim.lsp.buf.references, "references" },
      n = { vim.lsp.buf.rename, "rename" },
    },
    t = {
      name = "diagnostic goto",
      e = { vim.diagnostic.open_float, 'Show line diagnostic' },
      n = { vim.diagnostic.goto_next, "goto_next" },
      p = { vim.diagnostic.goto_prev, "goto_prev" },
      q = { vim.diagnostic.set_loclist, 'Set loclist' },
    },
  },
    leader = {
      l = {
        name = "LSP",
        a = { vim.lsp.buf.add_workspace_folder, "add workspace folder" },
        r = { vim.lsp.buf.remove_workspace_folder, "remove workspace folder" },
        l = { function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "list workspace folder" },
        f = { function() vim.lsp.buf.format { async = true } end, "format buffer" },
      }
    }
  }

  wk.register(lspmapping.g, { prefix = "g", buffer = bufnr, noremap = true, silent = true })
  wk.register(lspmapping.leader, { prefix = "<leader>", buffer = bufnr, noremap = true, silent = true })
end
