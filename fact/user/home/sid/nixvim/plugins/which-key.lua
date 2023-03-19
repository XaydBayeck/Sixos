-- nvim-nu settings
require("nu").setup()

-- https://github.com/folke/which-key.nvim

local wk = require("which-key")

local hop = require("hop")
hop.setup()

local directions = require("hop.hint").HintDirection

local mappings = {
  q = {
    name = "Quit",
    q = { ":q<CR>", "Quit" },
    w = { ":wq<CR>", "Save & Quit" },
  },
  b = {
    name = "buffer order",
    b = { "<Cmd>BufferOrderByBufferNumber<CR>", "by number" },
    d = { "<Cmd>BufferOrderByBufferDirectory<CR>", "by directory" },
    l = { "<Cmd>BufferOrderByBufferLanguage<CR>", "by language" },
    w = { "<Cmd>BufferOrderByBufferWindowNumber<CR>", "by window number" },
  },
  f = {
    name = "Telescope + FileCMD",
    f = { ":Telescope find_files<CR>", "Telescope Find Files" },
    l = { ":Telescope live_grep<CR>", "Telescope Live Grep" },
    b = { ":Telescope buffers<CR>", "Telescope Buffers" },
    h = { ":Telescope help_tags<CR>", "Neovim help tags" },
    g = {
      name = "Telescope git",
      f = { ":Telescope git_files<CR>", "Files" },
      c = { ":Telescope git_commits<CR>", "Commits" },
      b = { ":Telescope git_branches<CR>", "Branches" },
      s = { ":Telescope git_status<CR>", "Status" },
    },
    s = { ":w<CR>", "Save" },
  },
  o = {
    name = "open",
    t = { ":NvimTreeToggle<CR>", "Open files manager" },
  },
  g = { '<Plug>(lsp-previous-diagnotics)<CR>', 'Show line diagnostics' },
  l = {
    name = "LSP",
    i = { ":LspInfo<cr>", "Connected Language Servers" },
  },
}
wk.register(mappings, { prefix = "<leader>", noremap = true, silent = true })

local hopmotion = {
  f = {
    function () hop.hint_char1 {direction = directions.AFTER_CURSOR } end,
    "Find one {char} after cursor"
  },
  F = {
    function () hop.hint_char1 {direction = directions.BEFORE_CURSOR } end,
    "Find one {char} before cursor"
  },
  s = {
    function () hop.hint_char2 {direction = directions.AFTER_CURSOR } end,
    "Find tow {char} after cursor"
  },
  S = {
    function () hop.hint_char2 {direction = directions.BEFORE_CURSOR } end,
    "Find tow {char} before cursor"
  },
  w = {
    function () hop.hint_words {direction = directions.AFTER_CURSOR } end,
    "Find {word} after cursor"
  },
  W = {
    function () hop.hint_words {direction = directions.BEFORE_CURSOR } end,
    "Find {word} before cursor"
  },
  l = {
    function () hop.hint_lines {direction = directions.AFTER_CURSOR } end,
    "Fin {line} after cursor"
  },
  L = {
    function () hop.hint_lines {direction = directions.BEFORE_CURSOR } end,
    "Fin {line} before cursor"
  },
}

wk.register(hopmotion, { prefix = "s", noremap = true, silent = true })

wk.register({
  ["b"] = { name = "Comment block" },
  ["c"] = { name = "Comment" }
}, { prefix = "g", noremap = true, silent = true })


