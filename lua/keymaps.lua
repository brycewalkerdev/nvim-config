local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true }
local keymaps = {

  map_basic = function()
    -- Keymaps for better default experience
    -- See `:help vim.keymap.set()`
    --
    -- LazyGit
    vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { silent = true })

    -- Remap forward in jumplist for compatibility
    vim.keymap.set('n', '<C-e>', '<C-i>', { noremap = true, desc = 'Jump forward in jumplist' })

    --
    vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
    -- vim.keymap.set('n', '<leader>sa', '<cmd>:wa<CR>', { desc = '[S]ave [A]ll buffers' })
    vim.keymap.set('n', '<Esc>', '<cmd> noh <CR>', { desc = 'Clear highlighting' })

    -- Remap for dealing with word wrap
    vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
    vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

    -- Diagnostic keymaps
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

    -- Buffers and Tabs
    vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Close current buffer' })
    vim.keymap.set('n', '<leader>bD', '<cmd>bdelete!<CR>', { desc = 'Force close current buffer' })
    vim.keymap.set('n', '<leader><tab>', '<cmd>tabnew<CR>', { desc = 'Move to next tab' })
    vim.keymap.set('n', '<tab>', '<cmd>tabn<CR>', { desc = 'Move to next tab' })
    vim.keymap.set('n', '<S-tab>', '<cmd>tabp<CR>', { desc = 'Move to previous tab' })

    -- Move between windows
    vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
    vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Window right' })
    vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
    vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Window up' })

    -- Terminal
    vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal' })
    vim.keymap.set('n', '<C-w>t', '<cmd>terminal <CR>', { desc = 'Open terminal' })
  end,

  map_telescope = function()
    -- See `:help telescope.builtin`
    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    local function telescope_live_grep_open_files()
      require('telescope.builtin').live_grep {
        find_command = 'rg',
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end
    map('n', '<leader>s/',
      "<cmd> lua require('telescope.builtin').live_grep({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
      { noremap = true, desc = '[S]earch by [G]rep' })

    vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
    vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })

    map('n', '<leader>sf',
      "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
      { noremap = true, desc = '[S]earch [F]iles' })

    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
    map('n', '<leader>sg',
      "<cmd> lua require('telescope.builtin').live_grep({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
      { noremap = true, desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
  end,

  map_debug = function()
    vim.keymap.set('n', '<F5>', require('dap').continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F6>', require('dap').pause, { desc = 'Debug: Pause' })
    vim.keymap.set('n', '<F10>', function()
      require('dapui').close()
      require('dap').terminate()
    end
    , { desc = 'Debug: Terminate' })
    vim.keymap.set('n', '<F9>', require('dap').run_last, { desc = 'Debug: Run Last' })
    vim.keymap.set('n', '<F1>', require('dap').step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', require('dap').step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', require('dap').step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<F4>', require('dap').step_back, { desc = 'Debug: Step Back' })
    vim.keymap.set('n', '<leader>b', require('dap').toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', require('dapui').toggle, { desc = 'Debug: See last session result.' })
  end,

  map_neogen = function()
    vim.keymap.set('n', '<leader>dc', require('neogen').generate,
      { desc = '[D]ocument [C]ode' })
  end,

  map_tabline = function()
    vim.keymap.set('n', '<Tab>', function() require('bufferline').cycle(1) end,
      { desc = 'Move to next buffer on bufferline' })
    vim.keymap.set('n', '<S-Tab>', function() require('bufferline').cycle(-1) end,
      { desc = 'Move to previous buffer on bufferline' })
    vim.keymap.set('n', '<leader>x', '<cmd>:bdelete<CR>',
      { desc = 'Close current buffer' })
  end,

  map_naba = function()
    vim.keymap.set('n', '<leader>k', require('nabla').popup,
      { desc = 'Hover Latex' })
  end,

  map_file_tree = function()
    vim.keymap.set('n', '<C-n>', '<Cmd>Neotree toggle<CR>')
    -- vim.keymap.set('n', '<C-n>', '<cmd>Neotree toggle<CR>',
    --   { desc = 'Toggle filetree' })
  end,

  map_better_term = function()
    local betterTerm = require('betterTerm')
    vim.keymap.set({ "n", "t" }, "<C-;>", betterTerm.open, { desc = "Open terminal" })
    -- Select term focus
    vim.keymap.set({ "n" }, "<leader>tt", betterTerm.select, { desc = "Select terminal" })
    -- Create new term
    local current = 2
    vim.keymap.set(
      { "n" }, "<leader>tn",
      function()
        betterTerm.open(current)
        current = current + 1
      end,
      { desc = "New terminal" }
    )
  end,
}

return keymaps
