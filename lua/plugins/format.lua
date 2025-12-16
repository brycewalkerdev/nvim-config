return {
  {
    "stevearc/conform.nvim",
    config = function()
      local conform = require("conform")
      local util = require("conform.util")

      conform.setup({
        formatters_by_ft = {
          c          = { "clang_format" },
          cpp        = { "clang_format" },
          python     = { "black" },
          vhdl       = { "vsg" },
          tex        = { "tex-fmt" },
          latex      = { "tex-fmt" },
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
            cwd = util.root_file({ ".vsg.yaml", ".git" }),
            command = "vsg",
            stdin = false, -- VSG wants filenames
            -- use built-in "indent_only" style so case formatting is left alone
            args = { "--style", "indent_only", "--fix", "-f", "$FILENAME" },
            tempfile_postfix = ".vhd", -- ensure proper extension
            exit_codes = { 0, 1 },     -- 1 = violations found
          },
          clang_format = {
            prepend_args = { '--style=file', '--fallback-style=LLVM' },
          },
        },
      })
    end,
  },
}
