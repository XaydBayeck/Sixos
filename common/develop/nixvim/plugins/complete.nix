{ lib, pkgs, ... }:

{
  programs.nixvim.plugins = {
    # TODO: move and config luasnip
    luasnip.enable = true;
    nvim-cpm = {
      enable = true;
      snippet = {
        expand = "luasnip";
      };
      mapping = {
        "<C-d>" = "cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' })";
        "<C-u>" = "cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' })";
        "<C-CR>" = "cmp.mapping(cmp.mapping.complete(), { 'i', 'c' })";
        "<C-y>" = "cmp.config.disable";
        "<C-g>" = ''cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        })'';
        "<CR>" = ''cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }'';
        "<Tab>" = {
          modes = [ "i" "s" ];
          action = ''
            function(fallback)
              unpack = unpack or table.unpack
              local line, col = unpack(vim.api.nvim_win_get_cursor(0))
              local has_words_before = (col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil)

              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expandable() then
                luasnip.expand()
              elseif has_words_before then
                cmp.complete()
              else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
              end
            end
          '';
        };
        "<C-p>" = {
          modes = [ "i" "s" ];
          action = ''
            function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif lua.jumpable(-1) then
                luasnip.jump()
              else 
                fallback()
              end
            end
          '';
        };
      };
      window = {
        completion = {
          winhighlight = "Normal:Pmenu,FloatBoarder:Pmenu,Search:None";
          colOffset = -3;
          sidePadding = 0;
        };
      };
      formatting = {
        fields = [ "kind" "abbr" "menu" ];
        format = ''
          function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = "    (" .. (strings[2] or "") .. ")"
            return kind
          end
        '';
      };
      sources = [
        { name = "nvim_lsp"; }
        { name = "luasnip"; }
        { name = "path"; }
        { name = "buffer"; }
        { name = "nvim_lua"; }
        { name = "fish"; }
        { name = "crates"; }
      ];
    };
    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp-cmdline.enable = true;
    cmp-nvim-lua = true;
    cmp-fish = true;
    crates.enable = true;
  };

  programs.nixvim.autoCmd = [
    {
      event = "BufRead";
      pattern = "Cargo.toml";
      callback = { _raw = ''
        function()
          require("cmp").setup.buffer({ sources = {{name = "crates"}} })
        end
      ''; };
    }
  ];
}
