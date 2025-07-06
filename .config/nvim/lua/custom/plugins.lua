local plugins = {
  {
      "christoomey/vim-tmux-navigator",   -- written for Vim but works fine in Neovim
      lazy = false,                       -- load immediately
      init = function()                   -- optional: keep its default mappings
        -- If you prefer to create your own mappings, uncomment the next line:
        -- vim.g.tmux_navigator_no_mappings = 1
      end,
  }
}

return plugins
