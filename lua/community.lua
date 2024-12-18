---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.completion.avante-nvim" },
  { import = "astrocommunity.completion.tabnine-nvim" },
  { import = "astrocommunity.code-runner.molten-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
--  { import = "astrocommunity.workflow.hardtime-nvim" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  {
    {
      "quarto-dev/quarto-nvim",
      ft = { "quarto", "qmd", "markdown" },
      opts = {},
      dependencies = {
        { "hrsh7th/nvim-cmp" },
        { "jmbuhr/otter.nvim" },
      },
      config = function()
        vim.api.nvim_create_user_command(
          "QuartoPreviewRemote",
          function() vim.cmd ":QuartoPreview --port 4848" end,
          { desc = "Start Quarto Preview on port 4848 for remote access." }
        )
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      optional = true,
      opts = function(_, opts)
        if opts.ensure_installed ~= "all" then
          opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
            "r",
            "python",
            "markdown",
            "markdown_inline",
            "julia",
            "bash",
            "yaml",
            "lua",
            "vim",
            "query",
            "vimdoc",
            "latex",
            "html",
            "css",
          })
        end
      end,
    },
  },
}
