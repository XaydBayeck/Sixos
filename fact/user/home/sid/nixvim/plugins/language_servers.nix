{ ... }:

{
  imports = [
    ./langs
  ];

  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      preConfig = ''
        vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
        vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

        local border = {
              {"🭽", "FloatBorder"},
              {"▔", "FloatBorder"},
              {"🭾", "FloatBorder"},
              {"▕", "FloatBorder"},
              {"🭿", "FloatBorder"},
              {"▁", "FloatBorder"},
              {"🭼", "FloatBorder"},
              {"▏", "FloatBorder"},
        }
      '';
      capabilities = ''
        (function()
          capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
          capabilities.textDocument.completion.completionItem.snippetSupport = true
          return capabilities
         end)()
      '';
      onAttach = ''
        require('plugin-config.which-key').lsp_on_attach(client, bufnr)
        require('illuminate').on_attach(client)
        -- You will likely want to reduce updatetime which affects CursorHold
        -- note: this setting is global and should be set only once
        vim.o.updatetime = 250
        vim.api.nvim_create_autocmd("CursorHold", {
          buffer = bufnr,
          callback = function()
            local opts = {
              focusable = false,
              close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
              border = 'rounded',
              source = 'always',
              prefix = ' ',
              scope = 'cursor',
            }
            vim.diagnostic.open_float(nil, opts)
          end
        })
      '';

    };
    lsp-lines.enable = true;
  };
}
