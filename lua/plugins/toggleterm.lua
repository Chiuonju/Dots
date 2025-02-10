return {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm", "TerminalFloating", "CompileCpp" },
    keys = { "<F6>", "<F5>" },
    config = function()
        local Terminal = require("toggleterm.terminal").Terminal

        -- Enhanced C++ compilation function
        local function run_cpp()
            local file = vim.fn.expand("%:p")
            local file_no_ext = vim.fn.expand("%:t:r")
            local file_dir = vim.fn.expand("%:p:h")
            local output_path = file_dir .. "/" .. file_no_ext

            if not vim.fn.filereadable(file) then
                vim.notify("No valid file open", vim.log.levels.ERROR)
                return
            end

            if not file:match("%.cpp$") and not file:match("%.cc$") then
                vim.notify("This is not a C++ file", vim.log.levels.ERROR)
                return
            end

            vim.cmd("write")

            local cmd =
                string.format("cd %s && g++ -std=c++17 %s -o %s && %s", file_dir, file, output_path, output_path)

            local term = Terminal:new({
                cmd = cmd,
                direction = "float",
                close_on_exit = false,
            })
            term:toggle()
        end

        -- Simplified C++ compilation and execution
        -- local function run_cpp_simple()
        --     local file = vim.fn.expand("%:p")
        --     if not file:match("%.cpp$") and not file:match("%.cc$") then
        --         vim.notify("This is not a C++ file", vim.log.levels.ERROR)
        --         return
        --     end
        --     vim.cmd("write")
        --     vim.cmd("!g++ -std=c++17 % -o %:r && ./%:r")
        -- end





        -- Pre-configured terminals
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
        local node = Terminal:new({ cmd = "node", hidden = true })
        local python = Terminal:new({ cmd = "python3", hidden = true })

        -- Toggle functions for predefined terminals
        local function toggle_lazygit()
            lazygit:toggle()
        end

        local function toggle_node()
            node:toggle()
        end

        local function toggle_python()
            python:toggle()
        end

        -- Terminal keymaps setup
        _G.set_terminal_keymaps = function()
            local opts = { noremap = true }
            vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
            vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
            vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
            vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
            vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
            vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
        end

        -- Configure toggleterm
        require("toggleterm").setup({
            size = 20,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "float",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "curved",
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        })

        -- Commands for toggling terminals and compilation
        vim.api.nvim_create_user_command("ToggleTerm", function()
            require("toggleterm").toggle()
        end, {})
        vim.api.nvim_create_user_command("CompileCpp", run_cpp, {})

        -- Key mappings for C++ compilation
        vim.keymap.set(
            "n",
            "<F5>",
            ":cd %:p:h | w | !g++ -std=c++17 % -o %:r && %:r.exe<CR>",
            { noremap = true, silent = true, desc = "Compile and run C++ (simple)" }
        )
        vim.keymap.set("n", "<F6>", run_cpp, { noremap = true, silent = true, desc = "Compile and run C++ (advanced)" })
        -- Autocmd for terminal keymaps
        vim.cmd("autocmd! TermOpen term://* lua _G.set_terminal_keymaps()")
    end,
}
