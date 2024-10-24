return {

    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require("configs.lspconfig")
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },

    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },

    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require("configs.mason-lint")
        end,
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require("configs.conform")
        end,
    },

    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        config = function()
            require("configs.mason-conform")
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        keys = {
            {
                "<leader>lg",
                "<cmd> LazyGit<CR>",
                mode = "n",
                desc = "LazyGit",
            },
            {
                "<leader>gg",
                "<cmd> LazyGit<CR>",
                mode = "n",
                desc = "LazyGit",
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^5", -- Recommended
        lazy = false, -- This plugin is already lazy
        ft = "rust",
        config = function()
            local mason_registry = require("mason-registry")
            local codelldb = mason_registry.get_package("codelldb")
            local extension_path = codelldb:get_install_path() .. "/extension/"
            local codelldb_path = extension_path .. "adapter/codelldb"
            local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
            -- If you are on Linux, replace the line above with the line below:
            -- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
            local cfg = require("rustaceanvim.config")

            vim.g.rustaceanvim = {
                dap = {
                    adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
                },
            }
        end,
    },
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            require("dapui").setup()
        end,
    },
    {
        "saecki/crates.nvim",
        ft = { "toml" },
        config = function()
            require("crates").setup({
                completion = {
                    cmp = {
                        enabled = false,
                    },
                },
            })
            require("cmp").setup.buffer({
                sources = { { name = "crates" } },
            })
        end,
    },
    {
        "sveltejs/language-tools",
        config = function()
            require("plugins.configs.lspconfig").svelte.setup()
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "svelte",
            "typescript",
            "javascript",
        },
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        "ThePrimeagen/htmx-lsp",
        config = function()
            require("plugins.configs.lspconfig").htmx.setup()
        end,
    },
}
