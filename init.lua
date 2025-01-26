-- Copied from https://lazy.folke.io/installation
-- Bootstrap lazy.nvim.
require("config.lazy")

-- Set leader key to space, must be done before loading lazy
vim.g.mapleader = " "

-- https://lazy.folke.io/usage/structuring
-- Load all the configs defined in lua/plugins/*.lua
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  change_detection = {
    -- Stop telling me that a package spec was reloaded.
    notify = false,
  },
})

-- Some config that doesn't really fit elsewhere.
vim.cmd.colorscheme("tokyonight")
vim.o.guifont = "JetBrains Mono Nerd Font:h12"
-- Configure folding to use Treesitter.
--vim.opt.foldmethod = "expr"
--vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- disable netrw (the builtin vim file explorer)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_set_keymap('n', '<leader>du', '<cmd>lua require("dapui").toggle()<CR>', { noremap = true, silent = true })


vim.fn.sign_define('DapBreakpoint', {
  text = '🔴',
  texthl = 'DiagnosticSignError',
  linehl = '',
  numhl = ''
})


-- Support local config.  If the file doesn't exist this will fail quietly, and
-- if it does exist the file will be loaded.  All setup needs to be done as part
-- of loading - we don't call setup() or similar.
pcall(require, "config.local")
