-- Installation:
-- ln -s ~/code/dotfiles/nvim/init.lua ~/.config/nvim/init.lua

-- Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 5
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
vim.opt.grepformat = "%f:%l:%c:%m"

-- Keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", ">", ">gv", { desc = "Indent and re-select" })
vim.keymap.set("v", "<", "<gv", { desc = "Unindent and re-select" })

-- Autocommands
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
  { "folke/tokyonight.nvim", lazy = false, priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end
  },

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "haskell" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },

  { "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local util = require("lspconfig.util")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      function have_static_ls()
        return vim.fn.executable("static-ls") == 1
      end

      function base_root_dir(bufnr, on_dir)
        local filename = vim.api.nvim_buf_get_name(bufnr)
        on_dir(
          util.root_pattern(
            "hie.yaml", "stack.yaml", "cabal.project", "*.cabal", "package.yaml"
          )(filename))
      end

      vim.lsp.config("static-ls", {
        name = "hls(static-ls)",
        cmd = { "static-ls" },
        filetypes = { "haskell", "lhaskell" },
        root_dir = function(bufnr, on_dir)
          if have_static_ls() then
            base_root_dir(bufnr, on_dir)
          end
        end,
        capabilities = capabilities,
        settings = {
          haskell = {
            formattingProvider = "treefmt",
            cabalFormattingProvider = "cabalfmt",
          },
        },
      })

      vim.lsp.config("hls", {
        name = "hls",
        cmd = { "haskell-language-server-wrapper", "--lsp" },
        filetypes = { "haskell", "lhaskell" },
        root_dir = function(bufnr, on_dir)
          if not have_static_ls() then
            base_root_dir(bufnr, on_dir)
          end
        end,
        capabilities = capabilities,
        settings = {
          haskell = {
            formattingProvider = "formolu",
            cabalFormattingProvider = "cabalfmt",
          },
        },
      })

      vim.lsp.enable("static-ls")
      vim.lsp.enable("hls")
    end
  },

  { "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    config = function ()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),

          ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            fallback()
          end, {  "i", "s" }),
          ["<CR>"] = cmp.mapping(function(fallback)
            fallback()
          end),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })
    end,
  },

  { "stevearc/conform.nvim",
    opts = {
      notify_on_error = true,
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "ruff_fix" },
        haskell = { "fourmolu" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        scss = { "prettier" },
      },
    },
  },

  { "folke/snacks.nvim",
    opts = {
      picker = {},
      explorer = {},
    },
    keys = {
      { "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>f", function() Snacks.picker.smart() end, desc = "Files (smart)" },
      { "<leader>F", function() Snacks.picker.files() end, desc = "Files" },
      { "<leader>p", function() Snacks.picker.projects() end, desc = "Projects" },
      { "<leader>r", function() Snacks.picker.recent() end, desc = "Recent" },
      { "<leader>s", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>S", function() Snacks.picker.grep({ search=vim.fn.expand("<cword>") }) end, desc = "Grep word under cursor" },
      -- LSP
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
      { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      { "<leader>gs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      { "<leader>gS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    }
  },

  { "folke/trouble.nvim",
    opts = {},
  },

  { "folke/which-key.nvim", event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end
  },

  { "neovimhaskell/haskell-vim",
    ft = { "haskell", "lhaskell", "cabal" }
  },

  { "tpope/vim-rsi" },
})
