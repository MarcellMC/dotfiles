return {
  "folke/snacks.nvim",
  opts = {
    -- Snacks hijacks netrw for directories by default, on top of yazi.nvim's
    -- own hijack (see plugins/yazi.lua) - let yazi be the only one that does
    explorer = { replace_netrw = false },
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
