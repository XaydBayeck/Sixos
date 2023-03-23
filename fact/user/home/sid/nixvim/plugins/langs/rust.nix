{ ... }:

{
  programs.nixvim.plugins = {
    rust-tools = {
      enable = true;
      inlayHints.parameterHintsPrefix = "::";
      server.check.allTargets = false;
    };
    lsp.servers.rust-analyzer.enable = true;
  };
}
