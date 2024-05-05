vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

-- 取消 s 默认功能
map.set("n", "s", "", opt)
-- windows 分屏快捷键
map.set("n", "sv", ":vsp<CR>", opt)
map.set("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map.set("n", "sc", "<C-w>c", opt)
-- 关闭其他
map.set("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map.set("n", "<A-h>", "<C-w>h", opt)
map.set("n", "<A-j>", "<C-w>j", opt)
map.set("n", "<A-k>", "<C-w>k", opt)
map.set("n", "<A-l>", "<C-w>l", opt)

-- 左右比例控制
map.set("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map.set("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map.set("n", "s,", ":vertical resize -20<CR>", opt)
map.set("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map.set("n", "sj", ":resize +10<CR>", opt)
map.set("n", "sk", ":resize -10<CR>", opt)
map.set("n", "<C-Down>", ":resize +2<CR>", opt)
map.set("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map.set("n", "s=", "<C-w>=", opt)

-- Terminal相关
map.set("n", "<leader>t", ":sp | terminal<CR>", opt)
map.set("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map.set("t", "<Esc>", "<C-\\><C-n>", opt)
map.set("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map.set("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map.set("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map.set("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual模式下缩进代码
map.set("v", "<", "<gv", opt)
map.set("v", ">", ">gv", opt)
-- 上下移动选中文本
map.set("v", "J", ":move '>+1<CR>gv-gv", opt)
map.set("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 上下滚动浏览
map.set("n", "<C-j>", "4j", opt)
map.set("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map.set("n", "<C-u>", "9k", opt)
map.set("n", "<C-d>", "9j", opt)

-- 在visual 模式里粘贴不要复制
map.set("v", "p", '"_dP', opt)

-- 退出
map.set("n", "q", ":q<CR>", opt)
map.set("n", "qq", ":q!<CR>", opt)
map.set("n", "Q", ":qa!<CR>", opt)

-- bufferline
-- 左右Tab切换
map.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map.set("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map.set("n", "<C-w>", ":Bdelete!<CR>", opt)
map.set("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map.set("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map.set("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map.set("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map.set("n", "<C-f>", ":Telescope live_grep<CR>", opt)

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

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    return {
        -- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        -- 取消
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- 上一个
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- 确认
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- 如果窗口内容太多，可以滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    }
end


return pluginKeys

