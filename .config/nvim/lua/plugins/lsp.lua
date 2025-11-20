return {
  -- 1. Mason (Installer)
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua_ls", "stylua",          -- Lua
        "clangd", "clang-format",    -- C/C++
        "pyright", "black", "isort", -- Python
        "rust_analyzer",             -- Rust
      },
    },
  },

  -- 2. Completion (Blink)
  {
    "saghen/blink.cmp",
    version = "*",
    opts = {
      keymap = { preset = 'default' },
      appearance = { use_nvim_cmp_as_default = true, nerd_font_variant = 'mono' },
      sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    },
  },

  -- 3. Formatting (Conform)
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function() require("conform").format({ async = true, lsp_fallback = true }) end,
        desc = "Format Buffer",
      },
    },
    opts = {
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
    },
  },

  -- 4. LSP Config (Native 0.11+ Setup)
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      -- Apply Blink capabilities to all LSP servers globally
      vim.lsp.config('*', {
        root_markers = { '.git' }, -- Recommended default
        capabilities = require('blink.cmp').get_lsp_capabilities(),
      })

      -- [[ LUA ]]
      vim.lsp.config('lua_ls', {})
      vim.lsp.enable('lua_ls')

      -- [[ C / C++ ]]
      vim.lsp.config('clangd', {
        cmd = { "clangd", "--offset-encoding=utf-16" },
      })
      vim.lsp.enable('clangd')

      -- [[ PYTHON ]]
      vim.lsp.config('pyright', {})
      vim.lsp.enable('pyright')

      -- [[ RUST ]]
      vim.lsp.config('rust_analyzer', {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = { command = "clippy" },
          },
        },
      })
      vim.lsp.enable('rust_analyzer')

      -- [[ Keymaps (LspAttach) ]]
      -- This acts as the new "on_attach"
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local opts = { buffer = args.buf }

          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  },
}