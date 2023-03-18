{ pkgs, lib, ... }:

{
  programs.nixnvim = {
    # colorscheme
    colorscheme.nord = {
      enable = true;
      cursorline_transparent = true;
      italic = true;
      contrast = true;
    };
    # basic options
    globals = {
      # leader key
      mapleader = " ";
      maplocalleader = " ";
      # utf8
      encoding = "UTF-8";
      # disable default file manager
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;
    };
    options = {
      # utf8
      fileencoding = "utf-8";
      # jk移动时光标下上方保留8行
      scrolloff = 8;
      sidescrolloff = 8;
      # 使用相对行号
      number = true;
      relativenumber = true;
      # 高亮所在行
      cursorline = true;
      # 显示左侧图标指示列
      signcolumn = "yes";
      # 右侧参考线，超过表示代码太长了，考虑换行
      colorcolumn = "80";
      # 缩进2个空格等于一个Tab
      tabstop = 2;
      softtabstop = 2;
      shiftround = true;
      # >> << 时移动长度
      shiftwidth = 2;
      # 新行对齐当前行，空格替代tab
      expandtab = true;
      autoindent = true;
      smartindent = true;
      # 搜索大小写不敏感，除非包含大写
      ignorecase = true;
      smartcase = true;
      # 搜索不要高亮
      hlsearch = false;
      # 边输入边搜索
      incsearch = true;
      # 使用增强状态栏后不再需要 vim 的模式提示
      showmode = false;
      # 命令行高为2，提供足够的显示空间
      cmdheight = 2;
      # 当文件被外部程序修改时，自动加载
      autoread = true;
      # 禁止折行
      wrap = true;
      # 行结尾可以跳到下一行
      whichwrap = "b,s,<,>,[,],h,l";
      # 允许隐藏被修改过的buffer
      hidden = true;
      # 鼠标支持
      mouse = "a";
      # 禁止创建备份文件
      backup = false;
      writebackup = false;
      swapfile = false;
      # smaller updatetime 
      updatetime = 300;
      # 等待mappings
      timeoutlen = 100;
      # split window 从下边和右边出现
      splitbelow = true;
      splitright = true;
      # 自动补全不自动选中
      completeopt = "menu,menuone,noselect,noinsert";
      # 样式
      background = "dark";
      termguicolors = true;
      guifont = "CodeNewRoman_Nerd Font:h14";
      # 不可见字符的显示，这里只把空格显示为一个点
      list = true;
      listchars = "space:·,tab:>_,precedes:«,extends:»,trail:-";
      # 补全增强
      wildmenu = true;
      # Dont' pass messages to |ins-completin menu|
      pumheight = 10;
      # always show tabline
      showtabline = 2;
      # enable fold
      # foldmethod = "expr";
      # foldexpr = "nvim_treesitter#foldexpr()";
      # foldlevelstart = 99;
    };
  };
}
