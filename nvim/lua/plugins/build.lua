return {
    {
        "Civitasv/cmake-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
        require("cmake-tools").setup({
            cmake_command = "cmake",
            cmake_build_directory = "build",  -- Where your build folder is located
            cmake_generate_options = { "-G", "Ninja" },
            cmake_build_options = {},
            cmake_console_size = 20,
            cmake_show_console = "only_on_error",
            cmake_dap_configuration = {
                name = "CMake Debug",
                type = "gdb",  -- Use gdb as the debugger
                request = "launch",
                stopAtEntry = true,
                runInTerminal = true,
            },
            cmake_dap_open_command = require("dap").repl.open,
        })
        end,
    },
}
