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

return pluginKeys

