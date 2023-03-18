{ pkgs, lib, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      rainbow_parentheses-vim
    ];
    plugins = {
      # file manager
      nvim-tree = {
        enable = true;
      };
      # Telescope
      telescope = {
        enable = true;
        highlightTheme = "nord";
        keymaps = {
          "<lead>ff" = "find_files";
          "<lead>fl" = "live_grep";
          "<lead>fb" = "buffers";
          "<lead>fh" = "help_tags";
          # git
          "<lead>fgc" = "git_commits";
        };
      };
      # TODO
      todo-comments.enable = true;
      # Comment code
      comment-nvim.enable = true;
      # Surround
      surround.enable = true;
      # colors view
      nvim-colorizer.enable = true;
      # TODO: check: is auto pair work normal?
      nvim-autopairs = {
        enable = true;
      };
    };
    maps = {
      normal = {
        "<A-,>" = {
          silent = true;
          action = "<Cmd>BufferPrevious<CR>";
        };
        "<A-.>" = {
          silent = true;
          action = "<Cmd>BufferNext<CR>";
        };
        "<A-<>" = {
          silent = true;
          action = "<Cmd>BufferMovePrevious<CR>";
        };
        "<A->>" = {
          silent = true;
          action = "<Cmd>BufferMoveNext<CR>";
        };
        "<A-1>" = {
          silent = true;
          action = "<Cmd>BufferGoto 1<CR>";
        };
        "<A-2>" = {
          silent = true;
          action = "<Cmd>BufferGoto 2<CR>";
        };
        "<A-3>" = {
          silent = true;
          action = "<Cmd>BufferGoto 3<CR>";
        };
        "<A-4>" = {
          silent = true;
          action = "<Cmd>BufferGoto 4<CR>";
        };
        "<A-5>" = {
          silent = true;
          action = "<Cmd>BufferGoto 5<CR>";
        };
        "<A-6>" = {
          silent = true;
          action = "<Cmd>BufferGoto 6<CR>";
        };
        "<A-7>" = {
          silent = true;
          action = "<Cmd>BufferGoto 7<CR>";
        };
        "<A-8>" = {
          silent = true;
          action = "<Cmd>BufferGoto 8<CR>";
        };
        "<A-9>" = {
          silent = true;
          action = "<Cmd>BufferGoto 9<CR>";
        };
        "<A-0>" = {
          silent = true;
          action = "<Cmd>BufferLast<CR>";
        };
        "<A-p>" = {
          silent = true;
          action = "<Cmd>BufferPin<CR>";
        };
        "<A-c>" = {
          silent = true;
          action = "<Cmd>BufferClose<CR>";
        };
        "<A-P>" = {
          silent = true;
          action = "<Cmd>BufferPick<CR>";
        };
        "<C-P>" = {
          silent = true;
          action = "<Cmd>BufferPickDelete<CR>";
        };
      };
    };
  };
}
