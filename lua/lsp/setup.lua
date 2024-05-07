local status, mason = pcall(require, "mason")
if not status then
	vim.notify("没有找到 mason")
	return
end

local status, mason_config = pcall(require, "mason-lspconfig")
if not status then
	vim.notify("没有找到 mason-lspconfig")
	return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
	vim.notify("没有找到 lspconfig")
	return
end

-- :h mason-default-settings
-- ~/.local/share/nvim/mason
mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
mason_config.setup({
	ensure_installed = {
		"lua_ls",
		"bashls",
		"clangd",
		"cmake",
	},
})

local servers = {
	lua_ls = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
	bashls = require("lsp.config.bash"),
	-- remark_ls = require("lsp.config.markdown"),
	clangd = require("lsp.config.clangd"),
	cmake = require("lsp.config.cmake"),
}
for name, config in pairs(servers) do
	if config ~= nil and type(config) == "table" then
		-- 自定义初始化配置文件必须实现on_setup 方法
		config.on_setup(lspconfig[name])
	else
		-- 使用默认参数
		lspconfig[name].setup({})
	end
end

require("lsp.ui")
require("lsp.null-ls")
