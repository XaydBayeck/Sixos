{ ... }:

{
  programs.nixvim.plugins = {
    rust-tool = {
      enable = true;
      inlayHints.parameterHintsPrefix = "::";
    };
    lsp.servers.rust-analyzer.enable = true;
  };
}
