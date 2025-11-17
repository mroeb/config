return {
  -- the colorscheme should be available when starting Neovim
  {
    "morhetz/gruvbox",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme gruvbox]])
    end,
  },

  {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      main = "nvim-treesitter.configs",
      opts = {
          ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "python", "markdown" },
          auto_install = true,
          highlight = {
              enable = true,
              additional_vim_reges_highlighting = false,
          },
          indent = { enable = true },
      },
  },

}
