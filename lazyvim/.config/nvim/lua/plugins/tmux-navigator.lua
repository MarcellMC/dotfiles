return {
  "christoomey/vim-tmux-navigator",
  -- must load at startup (not lazily): its own plugin/tmux_navigator.vim sets
  -- up both normal- and terminal-mode <C-hjkl> mappings (needed so it works
  -- inside :terminal buffers like yazi.nvim's), but only once loaded, and
  -- terminal-mode has no keypress to lazy-trigger a load from
  lazy = false,
  -- also claim these keys through lazy.nvim's keys handler so LazyVim's
  -- default <C-hjkl> window-nav (set later, on VeryLazy) skips itself
  -- instead of overwriting the mappings this plugin just set up
  keys = {
    { "<c-h>", desc = "Go to Left Pane" },
    { "<c-j>", desc = "Go to Lower Pane" },
    { "<c-k>", desc = "Go to Upper Pane" },
    { "<c-l>", desc = "Go to Right Pane" },
    { "<c-\\>", desc = "Go to Previous Pane" },
  },
  config = function()
    -- The plugin's own terminal-mode mappings use a Vim-only `<C-w>` escape
    -- trick to leave terminal mode before running the command. Neovim
    -- doesn't honor it the same way, so those keystrokes get typed straight
    -- into the terminal program instead (e.g. triggering yazi's own
    -- keybindings). Override with Neovim's <Cmd> mapping, which runs the
    -- command directly without replaying synthetic keys into the terminal.
    local directions = { h = "Left", j = "Down", k = "Up", l = "Right", ["\\"] = "Previous" }
    local select_flag = { h = "-L", j = "-D", k = "-U", l = "-R", ["\\"] = "-l" }

    local function tmux_select_pane(key)
      local socket = vim.env.TMUX and vim.split(vim.env.TMUX, ",")[1]
      if not socket or not vim.env.TMUX_PANE then
        return
      end
      vim.fn.system({ "tmux", "-S", socket, "select-pane", "-t", vim.env.TMUX_PANE, select_flag[key] })
    end

    for key, dir in pairs(directions) do
      vim.keymap.set("t", "<C-" .. key .. ">", function()
        -- yazi.nvim (and similar terminal UIs) run in a *floating* window.
        -- `wincmd`/TmuxNavigate's boundary check resolves floating windows
        -- to whatever normal window sits underneath instead of reporting
        -- "no window there", so it never realizes it should forward to
        -- tmux. Detect that case and go straight to tmux ourselves.
        local win_cfg = vim.api.nvim_win_get_config(0)
        if win_cfg.relative ~= "" then
          tmux_select_pane(key)
        else
          vim.cmd("TmuxNavigate" .. dir)
        end
      end, { silent = true })
    end
  end,
}
