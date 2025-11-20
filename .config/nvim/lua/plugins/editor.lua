return {
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
    },
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules", ".git", "target", "build" },
      }
    },
  },

  -- Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
    },
  },
  
  -- Oil (File manipulation)
  {
    "stevearc/oil.nvim",
    opts = {},
    keys = { { "-", "<CMD>Oil<CR>", desc = "Open Parent Directory" } },
  },

  -- Which Key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
}