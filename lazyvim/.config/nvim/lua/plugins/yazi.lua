return {
  "mikavilpas/yazi.nvim",
  version = "*",
  -- must load at startup (not lazily) so `open_for_directories` reliably
  -- hijacks `nvim .` before anything else claims the directory buffer
  lazy = false,
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  init = function()
    -- yazi.nvim replaces netrw for opening directories
    vim.g.loaded_netrwPlugin = 1
  end,
  keys = {
    {
      "<leader>e",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      "<leader>cw",
      "<cmd>Yazi cwd<cr>",
      desc = "Open yazi in nvim's working directory",
    },
    {
      "<c-up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  ---@type YaziConfig | {}
  opts = {
    open_for_directories = true,
    keymaps = {
      show_help = "<f1>",
    },
  },
}
