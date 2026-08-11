return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = { hidden = true, ignored = true },
      },
    },
  },
  keys = {
    -- freed up for yazi.nvim (see plugins/yazi.lua)
    { "<leader>e", false },
    { "<leader>E", false },
    {
      "<leader>t",
      function()
        Snacks.explorer({ cwd = LazyVim.root() })
      end,
      desc = "Explorer Snacks (root dir)",
    },
    {
      "<leader>T",
      function()
        Snacks.explorer()
      end,
      desc = "Explorer Snacks (cwd)",
    },
  },
}
