return {
    -- Syntax highlighting and more.
    {
        "nvim-treesitter/nvim-treesitter",
        -- Based on https://www.lazyvim.org/plugins/treesitter#nvim-treesitter
        -- treesitter.setup() doesn't install parsers, instead we need
        -- treesitter.config.setup(opts).
        -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#lazynvim
        -- documents all this.

        main = "nvim-treesitter.configs",

        opts = {
            -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
            ensure_installed = {
                -- keep-sorted start
                "awk",
                "asm",
                "bash",
                "c",
                "c_sharp",
                "cmake",
                "cpp",
                "css",
                "diff",
                "disassembly",
                "dockerfile",
                "doxygen",
                "gitcommit",
                "go",
                "gnuplot",
                "html",
                --"latex",
                "luadoc",
                "make",
                "markdown",
                "markdown_inline",
                "ninja",
                "php",
                "printf",
                "python",
                "r",
                "regex",
                "rust",
                "vim",
                "vimdoc",
                "xml",
                -- keep-sorted end
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            -- :help nvim-treesitter-incremental-selection-mod
            -- Consider "nvim-treesitter/nvim-treesitter-textobjects" ?
        },
    },
}
