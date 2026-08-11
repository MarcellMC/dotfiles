-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Mute text (not just the background) when the terminal/tmux pane loses
-- focus, matching tmux's window-style dimming. Requires `focus-events on`
-- in tmux.conf so pane switches trigger FocusLost/FocusGained here too.
local dim_group = vim.api.nvim_create_augroup("dim_on_focus_lost", { clear = true })
local muted_fg = "#585b70" -- thm_black4, same color tmux dims inactive panes to

vim.api.nvim_create_autocmd("FocusLost", {
  group = dim_group,
  callback = function()
    local highlights = vim.api.nvim_get_hl(0, {})
    for name, hl in pairs(highlights) do
      if hl.fg and not hl.link then
        hl.fg = muted_fg
        pcall(vim.api.nvim_set_hl, 0, name, hl)
      end
    end
  end,
})

vim.api.nvim_create_autocmd("FocusGained", {
  group = dim_group,
  callback = function()
    vim.cmd.colorscheme(vim.g.colors_name or "catppuccin")
  end,
})
