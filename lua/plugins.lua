local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- local plugins = {
-- 
--     -- theme
--     "folke/tokyonight.nvim",
-- 
--     -- nvim-tree
--     {
--         "nvim-tree/nvim-tree.lua",
--         "kyazdani42/nvim-web-devicons",
--         config = function()
--             require("plugin-config.nvim-tree").setup()
--         end,
--     },
-- 
--     -- bufferline
--     { 
--         "akinsho/bufferline.nvim", 
--         config = function()
--             require("plugin-config.bufferline").setup()
--         end,
--         "moll/vim-bbye",
--     }, 
-- 
--     -- lualine
--     {
--         "nvim-lualine/lualine.nvim",
--         config = function()
--             require("plugin-config.lualine")
--         end,
--         "arkav/lualine-lsp-progress",
--     },
--     -- telescope
--     {
--         "nvim-telescope/telescope.nvim",
--         config = function()
--             require("plugin-config.telescope")
--         end,
--         "nvim-lua/plenary.nvim",
--         -- telescope-plugins
--         "LinArcX/telescope-env.nvim",
--     },
--     -- dashboard-nvim
--     {
--         "nvimdev/dashboard-nvim",
--         -- project
--         "ahmedkhalf/project.nvim",
--         config = function()
--             require("plugin-config.project")
--             require("plugin-config.dashboard")
--         end,
--     },
--     -- treesitter
--     {
--         "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" ,
--         config = function()
--             require("plugin-config.nvim-treesitter")
--         end,
--     },
-- 
--     {
--         "williamboman/mason.nvim",
--         "williamboman/mason-lspconfig.nvim",
--         "neovim/nvim-lspconfig",
-- 
--         "hrsh7th/nvim-cmp",
--         "L3MON4D3/LuaSnip",
--         "saadparwaiz1/cmp_luasnip",
-- 
--         "hrsh7th/cmp-vsnip",
--         "hrsh7th/cmp-nvim-lsp",
--         "hrsh7th/cmp-buffer",
--         "hrsh7th/cmp-path",
--         "hrsh7th/cmp-cmdline",
--         "hrsh7th/cmp-nvim-lsp-signature-help",
--         "rafamadriz/friendly-snippets",
--     },
-- 
-- }
-- 
local plugins = require("plugin-config")

local opts = {} -- 注意要定义这个变量
--require("lazy").setup(plugins, opts)
require("lazy").setup(plugins, opts)
