-- NvChad 2.5  –  extend the stock Treesitter config
return {
  { "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- keep whatever NvChad already asked for, then append "cuda"
      local ensure = opts.ensure_installed or {}
      if type(ensure) == "table" then
        table.insert(ensure, "cuda")
      elseif ensure == "all" then
        -- nothing to do; parser is already included
      else
        opts.ensure_installed = { ensure, "cuda" }
      end
    end,
  },
}

