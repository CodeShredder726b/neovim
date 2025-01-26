return {
    {
        'stevearc/aerial.nvim',
        opts = {
            layout = {
                default_direction = "prefer_left",
                placement = "window",
                max_width = {40, 0.2},
                min_width = 10,
                resize_to_content = true,
                preserve_equality = false,
            },

            attach_mode = "window",
            autojump = true,
            nerd_font = "auto",
        },
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },

    -- Telescope plugin configuration
    {
        'nvim-telescope/telescope.nvim',
        opts = {
            defaults = {
                prompt_prefix = "> ",
                selection_caret = "> ",
                path_display = { "smart" },
            },
            pickers = {
                find_files = {
                    theme = "dropdown",
                },
                live_grep = {
                    theme = "ivy",
                },
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
            "junegunn/fzf",
        },
    },

    -- FZF plugin configuration (optional)
    {
        'junegunn/fzf',
        run = function()
        vim.fn["fzf#install"]()
        end,
    },
}

