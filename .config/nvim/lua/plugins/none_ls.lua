-- ~/.config/nvim/lua/plugins/none_ls.lua
return {
  {
    "nvimtools/none-ls.nvim",          -- plugin name
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local null_ls = require("null-ls")   -- ← keep the historical name!
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.diagnostics.clang_tidy,
        },
      })
    end,
  },
}

