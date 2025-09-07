return {
  {
    "stevearc/conform.nvim",
    config = function()
      local util = require("conform.util")

      require("conform").setup({
        formatters_by_ft = {
          python = { "black" },
          vhdl   = { "vsg" },
        },
        format_on_save = {
          timeout_ms = 8000, -- VSG cold start can be slow
          lsp_format = "fallback",
        },
        formatters = {
          vsg = {
            command = "vsg",
            stdin = false, -- don't pipe; VSG wants a filename
            -- IMPORTANT: pass the filename explicitly
            args = { "--fix", "-f", "$FILENAME" },
            -- helps some tools key off extension
            tempfile_postfix = ".vhd",
            exit_codes = { 0, 1 }, -- <- accept "violations found" as OK
            -- (optional) run from project root if you keep .vsg.json there
            cwd = util.root_file({ ".vsg.json", ".vsg.yaml", ".git" }),
            meta = {
              url = "https://github.com/jeremiah-c-leary/vhdl-style-guide",
              description = "VHDL Style Guide (VSG) formatter",
            },
          },
        },
      })
    end,
  },
}
