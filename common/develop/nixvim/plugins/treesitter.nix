{ config, pkgs, lib, ... }:

{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      ensureInstalled = [ "c" "rust" "lua" "haskell" "cpp" "html" "javascript" "typescript" "nix" ];
      folding = true;
      indent = true;

      grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
        agda
        arduino
        awk
        bash
        bibtex
        c
        c_sharp
        clojure
        cmake
        comment
        commonlisp
        cpp
        css
        cuda
        diff
        dockerfile
        dot
        elixir
        erlang
        fennel
        fish
        gdscript
        git_rebase
        gitcommit
        gitattributes
        gitignore
        glsl
        godot_resource
        gomod
        graphql
        haskell
        hlsl
        http
        html
        help # neovim help
        java
        javascript
        json
        json5
        julia
        kotlin
        latex
        llvm
        lua
        make
        markdown
        markdown_inline
        mermaid
        nix
        ocaml
        ocaml_interface
        ocamllex
        regex
        python
        rust
        ron
        ruby
        scala
        scheme
        solidity
        typescript
        tsx
        toml
        verilog
        vim
        vue
        wgsl
        wgsl_bevy
        yaml
        zig
      ];

      incrementalSelection = {
        enable = true;
        keymaps = {
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
