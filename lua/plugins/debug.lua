-- Docs at https://github.com/mfussenegger/nvim-dap-python are useful.
return {
    -- keep-sorted start block=yes

    -- nvim-dap core
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        -- from LazyVim/lua/lazyvim/plugins/extras/dap/core.lua and
        keys = {
            {
                "<leader>db",
                function() require("dap").toggle_breakpoint() end,
                desc = "Toggle Breakpoint"
            },

            {
                "<leader>dc",
                function() require("dap").continue() end,
                desc = "Continue"
            },

            {
                "<leader>dC",
                function() require("dap").run_to_cursor() end,
                desc = "Run to Cursor"
            },

            {
                "<leader>dT",
                function() require("dap").terminate() end,
                desc = "Terminate"
            },
        },
    },

    -- nvim-dap-ui visual debugging interface
    {
        "rcarriga/nvim-dap-ui",
        config = true,
        keys = {
            {
                "<leader>du",
                function() require("dapui").toggle({})
                end,
                desc = "Dap UI"
            },
        },
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },

    -- mason-nvim-dap for automatic installation of DAP servers
    {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
            handlers = {},
            automatic_installation = {
                exclude = { "python", },
            },
            ensure_installed = { "python", "codelldb", },  -- Make sure Python is included
        },
        dependencies = {
            "mfussenegger/nvim-dap",
            "williamboman/mason.nvim",
        },
    },

    -- nvim-dap-python configuration for Python debugging
    {
        "mfussenegger/nvim-dap-python",
        lazy = true,
        config = function()
        local python_path = vim.fn.expand("~/.virtualenvs/debugpy/bin/python")
        require("dap-python").setup(python_path, {
            justMyCode = false,  -- Debug all code (not just user code)
        })
        end,
        dependencies = { "mfussenegger/nvim-dap" },
    },


    -- nvim-dap-cpp setup for C/C++ debugging
    {
        "mfussenegger/nvim-dap",
        config = function()
        -- Configure GDB Adapter
        require('dap').adapters.gdb = {
            type = "executable",
            command = "/usr/bin/gdb",  -- GDB executable
            args = { "-i", "dap" },
            name = "gdb",
        }

        -- Debugging configurations for C and C++
        require('dap').configurations.c = {
            {
                name = "Launch executable with GDB",
                type = "gdb",
                request = "launch",
                --request = "attach",
                target = "localhost:1234",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
                end,
                cwd = "${workspaceFolder}",
                stopAtEntry = true,
            },
        }

        require('dap').configurations.cpp = {
            {
                name = "Launch C++ executable with GDB",
                type = "gdb",
                --request = "attach",
                request = "launch",
                target = "localhost:1234",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
                end,
                cwd = "${workspaceFolder}",
                stopAtEntry = true,
                setupCommands = {
                    {
                        text = '-enable-pretty-printing',
                        description = 'Enable pretty printing in gdb',
                        ignoreFailures = false,
                    },
                },
                miDebuggerPath = "/usr/bin/gdb",
            },
        }
        end,
    },

    {
        "nvim-neotest/nvim-nio",
    },

    -- nvim-dap-virtual-text for inline variable display during debugging
    {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
        require("nvim-dap-virtual-text").setup({
            enabled = true,
            enabled_for_current_line = true,
            highlight_changed_variables = true,
            highlight_new_as_changed = true,
            show_stop_reason = "always",
            commented = true,
        })
        end,
        dependencies = { "mfussenegger/nvim-dap" },
    },


    -- nvim-telescope for integration with DAP (optional, for better navigation)
    {
        "nvim-telescope/telescope-dap.nvim",
        dependencies = { "mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim" },
    },






}


