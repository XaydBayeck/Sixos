{ ... }:

let
  silent = true;
in
{
  programs.nixvim.maps = {
    normalVisualOp = {
      ";" = ":";
      # magic search
      "/" = {
        inherit silent;
        action = "/\\v";
      };
    };
    normal = {
      # ctrl u / ctrl d 半屏移动
      "<C-u>" = {
        inherit silent;
        action = "9k";
      };
      "<C-d>" = {
        inherit silent;
        action = "9j";
      };
      # 分屏
      "sv" = {
        inherit silent;
        action = ":vsp<CR>";
      };
      "sh" = {
        inherit silent;
        action = ":sp<CR>";
      };
      # 分屏比例
      "s>" = {
        inherit silent;
        action = ":vertical resize +20<CR>";
      };
      "s<" = {
        inherit silent;
        action = ":vertical resize -20<CR>";
      };
      "s=" = {
        inherit silent;
        action = "<C-w>=";
      };
      "sj" = {
        inherit silent;
        action = ":resize +10=";
      };
      "sk" = {
        inherit silent;
        action = ":resize -10=";
      };
      # alt + hjkl 窗口跳转
      "<A-h>" = {
        inherit silent;
        action = "<C-w>h";
      };
      "<A-j>" = {
        inherit silent;
        action = "<C-w>j";
      };
      "<A-k>" = {
        inherit silent;
        action = "<C-w>k";
      };
      "<A-l>" = {
        inherit silent;
        action = "<C-w>l";
      };
    };
    visual = {
      # 缩进代码
      "<" = {
        inherit silent;
        action = "<gv";
      };
    };
  };
}
