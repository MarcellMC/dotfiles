return {
  "roobert/activate.nvim",
  keys = {
    {
      "<leader>vp",
      '<CMD>lua require("activate").list_plugins()<CR>',
      desc = "Plugins",
    },
  },
  dependencies = {
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } }
  }
}
