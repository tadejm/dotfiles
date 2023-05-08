require("other-nvim").setup({
  mappings = {
    {
      pattern = "/lib/(.*).rb",
      target = {
        { context = "test", target = "/spec/%1_spec.rb" },
      },
    },
    {
      pattern = "/lib/(.*).rb",
      target = {
        { context = "test", target = "/spec/lib/%1_spec.rb" },
      },
    },
    {
      pattern = "/spec/(.*)_spec.rb",
      target = {
        { target = "/apps/%1.rb" },
        { target = "/lib/%1.rb" },
      },
    },
    {
      pattern = "/apps/(.*).rb",
      target = {
        { context = "test", target = "/spec/%1_spec.rb" },
      },
    },
  },
  transformers = {
    -- defining a custom transformer
    lowercase = function (inputString)
      return inputString:lower()
    end
  },
  style = {
    -- How the plugin paints its window borders
    -- Allowed values are none, single, double, rounded, solid and shadow
    border = "solid",

    -- Column seperator for the window
    seperator = "|",

    -- width of the window in percent. e.g. 0.5 is 50%, 1.0 is 100%
    width = 0.7,

    -- min height in rows.
    -- when more columns are needed this value is extended automatically
    minHeight = 2
  },
})

vim.keymap.set("n", "<leader>,", vim.cmd.Other)
