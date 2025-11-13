return {
  {
    "stevearc/conform.nvim",
    config = function()
      local util = require("conform.util")

      require("conform").setup({
        formatters_by_ft = {
          python     = { "black" },
          vhdl       = { "vsg" },
          javascript = { "prettierd", "prettier" },
          typescript = { "prettierd", "prettier" },
        },
        format_on_save = {
          timeout_ms = 8000, -- VSG cold start can be slow
          lsp_format = "fallback",
        },
        -- this replaces the old nested {} behavior
        stop_after_first = true,

        formatters = {
          vsg = {
            cwd = require("conform.util").root_file({ ".vsg.yaml", ".git" }),
            command = "vsg",
            stdin = false,             -- VSG wants filenames
            args = { "--fix", "-f", "$FILENAME" },
            tempfile_postfix = ".vhd", -- ensure proper extension
            exit_codes = { 0, 1 },     -- 1 = violations found
            -- Optional: run from repo root if you keep .vsg config there
            -- cwd = require("conform.util").root_file({ ".vsg.json", ".vsg.yaml", ".git" }),
          },
        },
      })
    end,
  },
}
