return {
  -- nvim-lspconfig
  -- neovim default configurations for LSP servers
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
    },
    config = function()
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("pyright")
      vim.lsp.enable("marksman")
      vim.lsp.enable("gopls")
      vim.lsp.enable("yamlls")
      vim.lsp.enable("bashls")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("taplo")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("terraformls")
      vim.lsp.enable("nixd")
      -- ZK for notes and marksman for any other md
      vim.lsp.config("marksman", {
        root_dir = function(bufnr, on_dir)
          if vim.fs.root(bufnr, { ".zk" }) then
            return
          end
          on_dir(vim.fs.root(bufnr, { ".marksman.toml", ".git" }) or vim.fn.getcwd())
        end,
      })

      -- Go to definition
      -- which is different but similar of C-[ which uses tagfunc
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
        callback = function(ev)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
            buffer = ev.buf,
            desc = "Go to definition",
          })
        end,
      })
    end,
  },
  -- lazy-dev.nvim
  -- LuaLS setup for neovim
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    config = true,
  },
  {
    "ravibrock/spellwarn.nvim",
    event = "VeryLazy",
    config = true,
  },
}
