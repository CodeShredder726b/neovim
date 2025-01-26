return {
    {
        -- Improved status bar.
        --dir = vim.fn.expand("~/.vim/bundle/vim-airline"),
    },
    {
        -- Makes filename:line-number[:column] work.
        --dir = vim.fn.expand("~/.vim/bundle/vim-fetch"),
    },
    {
        -- Jumps to the last exited location in files.
        "farmergreg/vim-lastplace",
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = { enabled = true },
            dashboard = { enabled = true },
            indent = { enabled = true },
            input = { enabled = true },
            picker = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
    },
}
