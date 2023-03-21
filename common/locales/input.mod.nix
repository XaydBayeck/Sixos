{ config, pkgs, ... }:

{
  # Select input method
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-rime fcitx5-chinese-addons sinur.fcitx5-nord ];
  };
}
