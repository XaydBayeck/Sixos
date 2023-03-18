-- https://github.com/folke/which-key.nvim

local wk = require("which-key")

local hop = require("hop")
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
      name = "Telescope git"
      f = { ":Telescope git_files<CR>", "Files" },
      c = { ":Telescope git_commits<CR>", "Commits" },
      b = { ":Telescope git_branches<CR>", "Branches" },
      s = { ":Telescope git_status<CR>", "Status" },
    },
    s = { ":w<CR>", "Save" }
  },
  o = {
    name = "open",
    t = { ":NvimTreeToggle<CR>", "Open files manager" }
  },
  r = { ":Telescope live_grep<CR>", "Telescope Live Grep" },
  g = { '<Plug>(lsp-previous-diagnotics)<CR>', 'Show line diagnostics' },
  l = {
    name = "LSP",
    i = { ":LspInfo<cr>", "Connected Language Servers" },
  },
  -- y = {
  --   name = "youdao cloud dictionary",
  --   d = { ":<C-u>Yde<CR>", "input words to translate" },
  --   o = { ":<C-u>Ydc<CR>", "translate words at your point" }
  -- }
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
  }
  L = {
    function () hop.hint_lines {direction = directions.BEFORE_CURSOR } end,
    "Fin {line} before cursor"
  }
}

wk.register(hopmotion, { prefix = "s", noremap = true, silent = true })

wk.register({
  ["b"] = { name = "Comment block" },
  ["c"] = { name = "Comment" }
}, { prefix = "g", noremap = true, silent = true })

local export = {}
export.lsp_on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local lspmapping = { g = {
    a = { vim.lsp.buf.code_action, "code action" },
    D = { vim.lsp.buf.declaration, "declaration" },
    d = { vim.lsp.buf.definition, "definition" },
    h = { vim.lsp.buf.hover, "hover" },
    i = { vim.lsp.buf.implementation, "implementation" },
    k = { vim.lsp.buf.signature_help, "signature help" },
    r = {
      name = "references+rename",
      r = { vim.lsp.buf.references, "references" },
      n = { vim.lsp.buf.rename, "rename" },
    },
    t = {
      name = "diagnostic goto",
      e = { vim.diagnostic.open_float, 'Show line diagnostic' },
      n = { vim.diagnostic.goto_next, "goto_next" },
      p = { vim.diagnostic.goto_prev, "goto_prev" },
      q = { vim.diagnostic.set_loclist, 'Set loclist' },
    },
  },
    leader = {
      l = {
        name = "LSP",
        a = { vim.lsp.buf.add_workspace_folder, "add workspace folder" },
        r = { vim.lsp.buf.remove_workspace_folder, "remove workspace folder" },
        l = { function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "list workspace folder" },
        f = { function() vim.lsp.buf.format { async = true } end, "format buffer" },
      }
    }
  }

  wk.register(lspmapping.g, { prefix = "g", buffer = bufnr, noremap = true, silent = true })
  wk.register(lspmapping.leader, { prefix = "<leader>", buffer = bufnr, noremap = true, silent = true })
end

return export
