
local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("没有找到 nvim-tree")
  return
end

local keymap = vim.keymap

-- leader + m 键打开关闭tree
keymap.set("n", "<leader>m", ":NvimTreeToggle<CR>")

-- 列表操作快捷键
local function on_attach(bufnr)
    local api = require("nvim-tree.api")
    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    keymap.set("n", "R", api.tree.reload, opts("Refresh"))

    -- open / close --
    keymap.set("n", "o", api.node.open.edit, opts("Open"))
    keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
    keymap.set("n", "<CR>", api.node.run.system, opts("Run System"))
    keymap.set("n", "sv", api.node.open.vertical, opts("Open: Vertical Split"))
    keymap.set("n", "sh", api.node.open.horizontal, opts("Open: Horizontal Split"))
    keymap.set("n", "st", api.node.open.tab, opts("Open: New Tab"))

    -- movement --
    keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
    keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
    keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
    keymap.set("n", ">", api.tree.change_root_to_node, opts("CD"))
    keymap.set("n", "<", api.tree.change_root_to_parent, opts("Up"))

    -- file toggle --
    keymap.set("n", "i", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
    keymap.set("n", ".", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
    keymap.set("n", "u", api.tree.toggle_custom_filter, opts("Toggle Hidden"))

    -- file operate --
    keymap.set("n", "a", api.fs.create, opts("Create"))
    keymap.set("n", "d", api.fs.remove, opts("Delete"))
    keymap.set("n", "r", api.fs.rename, opts("Rename"))
    keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
    keymap.set("n", "x", api.fs.cut, opts("Cut"))
    keymap.set("n", "p", api.fs.paste, opts("Paste"))
    keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
    keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
    keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
    keymap.set("n", "gh", api.node.show_info_popup, opts("Info"))
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
    
    -- 快捷键配置
    on_attach = on_attach,
    -- project plugin 需要这样设置
    update_cwd = true,
    update_focused_file = {
        enable = true,
 --       update_root = true,
        update_cwd = true,
    },
    -- 显示 git 状态图标
    git = {
        enable = true,
        ignore = true,
    },
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
        -- hide dot files
        dotfiles = true,
        -- hide node_modules folder
        -- custom = { "node_modules" },
    },
    view = {
        -- 宽度
        width = 34,
        -- or 'right'
        side = "left",
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = "yes",
    },
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            quit_on_open = true,
        },
    },
    system_open = {
        -- NOTE: WSL need wsl-open
        -- npm install -g wsl-open
        -- https://github.com/4U6U57/wsl-open/
--        cmd = 'wsl-open', -- mac 直接设置为 open
    },
    renderer = {
        root_folder_label = false,
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "after",
        },
    },
})
