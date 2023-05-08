require('copilot').setup({
  panel = {
    enabled = false,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = false,
    auto_trigger = false,
    debounce = 75,
    keymap = {
      accept = "<M-l>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = true,
    help = false,
    gitcommit = true,
    gitrebase = true,
    svn = false,
    cvs = false,
    ruby = true,
    javascript = true,
    ["."] = false,
  },
  copilot_node_command = '/Users/tadej/.volta/tools/image/node/18.12.1/bin/node', -- Node.js version must be > 16.x
  server_opts_overrides = {},
})
require("copilot_cmp").setup()
