return {
    -- add tokyonight
    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = { style = "moon" },
    },

    -- Configure LazyVim to load tokyonight
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
        },
    }
}
