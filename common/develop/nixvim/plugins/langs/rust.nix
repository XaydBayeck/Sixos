{ ... }:

{
  programs.nixvim.plugins = {
    rust-tools = {
      enable = true;
      inlayHints.parameterHintsPrefix = "::";
    };
    lsp.servers.rust-analyzer.enable = true;
  };
}
