return {

    -- requires
    { "kyazdani42/nvim-web-devicons" },
    { "moll/vim-bbye" },
    { "nvim-lua/plenary.nvim" },

    -- theme
    --    -- tokyonight
    {
        "folke/tokyonight.nvim",
        config = function()
            require("plugin-config.tokyonight")
        end,
    },

    -- nvim-tree
    {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("plugin-config.nvim-tree")
        end,
    },

    -- bufferline
    {
        "akinsho/bufferline.nvim",
        config = function()
            require("plugin-config.bufferline")
        end,
    },

    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plugin-config.lualine")
        end,
    },

    -- telescope
    { "LinArcX/telescope-env.nvim" },
    {
        "nvim-telescope/telescope.nvim",
        -- opt = true,
        -- cmd = "Telescope",
        config = function()
            require("plugin-config.telescope")
        end,
    },

    -- dashboard-nvim
    {
        "nvimdev/dashboard-nvim",
        config = function()
            require("plugin-config.dashboard")
        end,
    },

    -- project
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("plugin-config.project")
        end,
    },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
        config = function()
            require("plugin-config.nvim-treesitter")
        end,
    },
    
    ------------------------------------lsp--------------------------------------------
    -- lsp
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },

    -- Lspconfig
    { "neovim/nvim-lspconfig" },

    -- Completion engine
    { "hrsh7th/nvim-cmp" },

    -- Snippet engine
    { "L3MON4D3/LuaSnip" },
    { "hrsh7th/vim-vsnip" },
    { "saadparwaiz1/cmp_luasnip" },

    -- Completion sources
    { "hrsh7th/cmp-vsnip" },
    { "hrsh7th/cmp-nvim-lsp" }, -- { name = nvim_lsp }
    { "hrsh7th/cmp-buffer" }, -- { name = 'buffer' },
    { "hrsh7th/cmp-path" }, -- { name = 'path' }
    { "hrsh7th/cmp-cmdline" }, -- { name = 'cmdline' }
    { "hrsh7th/cmp-nvim-lsp-signature-help" }, -- { name = 'nvim_lsp_signature_help' }

    -- common snippets
    { "rafamadriz/friendly-snippets" },

    -- ui 美化
    { "onsails/lspkind-nvim" },
}

