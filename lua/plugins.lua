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

local plugins = {

    -- theme
    "folke/tokyonight.nvim",

    -- nvim-tree
    {
        "nvim-tree/nvim-tree.lua",
        "kyazdani42/nvim-web-devicons",
    },

    -- bufferline
    { 
        "akinsho/bufferline.nvim", 
        "moll/vim-bbye",
    }, 

    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        "arkav/lualine-lsp-progress",
    },

}

local opts = {} -- 注意要定义这个变量
require("lazy").setup(plugins, opts)
