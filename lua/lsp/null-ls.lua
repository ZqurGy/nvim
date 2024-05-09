local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("没有找到 null-ls")
	return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
	debug = false,
	sources = {
		-- Formatting ---------------------
		--  brew install shfmt
		formatting.shfmt,
		-- StyLua
		formatting.stylua,
		-- clang_format
		formatting.clang_format,
		formatting.clang_format.with({
			extra_args = {
				"-style=file:" .. vim.fn.expand("~/.clang-format"),
			},
		}),
		-- cmake
		-- formatting.cgersemi,
		-- frontend
		formatting.prettier.with({ -- 只比默认配置少了 markdown
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"markdown",
				"markdown.mdx",
				"graphql",
				"handlebars",
			},
			prefer_local = "node_modules/.bin",
		}),
	},
	diagnostics_format = "[#{s}] #{m}",
	-- 保存自动格式化
	on_attach = function(_)
		-- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()']])
	end,
})
