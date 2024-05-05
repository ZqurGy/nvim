vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

-- 取消 s 默认功能
keymap.set("n", "s", "", opt)
-- windows 分屏快捷键
keymap.set("n", "sv", ":vsp<CR>", opt)
keymap.set("n", "sh", ":sp<CR>", opt)
-- 关闭当前
keymap.set("n", "sc", "<C-w>c", opt)
-- 关闭其他
keymap.set("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
keymap.set("n", "<A-h>", "<C-w>h", opt)
keymap.set("n", "<A-j>", "<C-w>j", opt)
keymap.set("n", "<A-k>", "<C-w>k", opt)
keymap.set("n", "<A-l>", "<C-w>l", opt)

-- 左右比例控制
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opt)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opt)
keymap.set("n", "s,", ":vertical resize -20<CR>", opt)
keymap.set("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
keymap.set("n", "sj", ":resize +10<CR>", opt)
keymap.set("n", "sk", ":resize -10<CR>", opt)
keymap.set("n", "<C-Down>", ":resize +2<CR>", opt)
keymap.set("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
keymap.set("n", "s=", "<C-w>=", opt)

-- Terminal相关
keymap.set("n", "<leader>t", ":sp | terminal<CR>", opt)
keymap.set("n", "<leader>vt", ":vsp | terminal<CR>", opt)
keymap.set("t", "<Esc>", "<C-\\><C-n>", opt)
keymap.set("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
keymap.set("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
keymap.set("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
keymap.set("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual模式下缩进代码
keymap.set("v", "<", "<gv", opt)
keymap.set("v", ">", ">gv", opt)
-- 上下移动选中文本
keymap.set("v", "J", ":move '>+1<CR>gv-gv", opt)
keymap.set("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 上下滚动浏览
keymap.set("n", "<C-j>", "4j", opt)
keymap.set("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
keymap.set("n", "<C-u>", "9k", opt)
keymap.set("n", "<C-d>", "9j", opt)

-- 在visual 模式里粘贴不要复制
keymap.set("v", "p", '"_dP', opt)

-- 退出
keymap.set("n", "q", ":q<CR>", opt)
keymap.set("n", "qq", ":q!<CR>", opt)
keymap.set("n", "Q", ":qa!<CR>", opt)

-- bufferline
-- 左右Tab切换
keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
keymap.set("n", "<C-w>", ":Bdelete!<CR>", opt)
keymap.set("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
keymap.set("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
keymap.set("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
keymap.set("n", "<C-f>", ":Telescope live_grep<CR>", opt)

-- 插件快捷键
local pluginKeys = {}

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {

    i = {
        -- 上下移动
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",
        -- 历史记录
        ["<C-n>"] = "cycle_history_next",
        ["<C-p>"] = "cycle_history_prev",
        -- 关闭窗口
        ["<C-c>"] = "close",
        -- 预览窗口上下滚动
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down",
    },
}

pluginKeys.mapLSP = function(mapbuf)
    -- rename
    --[[
  Lspsaga 替换 rn
  mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
  --]]
    mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
    -- code action
    --[[
  Lspsaga 替换 ca
  mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
  --]]
    mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    -- go xx
    --[[
    mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  --]]

    mapbuf("n", "gd", function()
        require("telescope.builtin").lsp_definitions({
            initial_mode = "normal",
            -- ignore_filename = false,
        })
    end)
    --[[
  mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
  Lspsaga 替换 gh
  --]]
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>")
    --[[
  Lspsaga 替换 gr
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
  --]]
    mapbuf(
        "n",
        "gr",
        "<cmd>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_ivy())<CR>"
    )

    if vim.fn.has("nvim-0.8") == 1 then
        mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")
    else
        mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
    end

    --[[
  Lspsaga 替换 gp, gj, gk
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --]]
    -- diagnostic
    -- mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
    -- mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
    -- mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)

    mapbuf("n",  "gp", "<cmd>lua vim.diagnostic.open_float()<CR>")
    mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>")
    mapbuf("n",  "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
    -- 未用
    -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

return pluginKeys

