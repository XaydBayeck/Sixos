{ pkgs, lib, ... }:

{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      ensureInstalled = [ "c" "rust" "lua" "haskell" "cpp" "html" "javascript" "typescript" "nix" ];
      folding = true;
      indent = true;
      nixGrammars = true;
      incrementalSelection = {
        enable = true;
        keymap = {
          initSelection = "<CR>";
          nodeIncremental = "<CR>";
          nodeDecremental = "<BS>";
          scopeIncremental = "<TAB>";
        };
      };
    };
    treesitter-context.enable = true;
  };
}
