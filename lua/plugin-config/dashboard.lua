
local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

db.setup {
    -- config
    theme = 'hyper',
    config = {
        header = {
            [[]],
            [[]],
            [[]],
            [[          ▀████▀▄▄              ▄█ ]],
            [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
            [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
            [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
            [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
            [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
            [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
            [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
            [[   █   █  █      ▄▄           ▄▀   ]],
            [[]],
            [[]],
            [[]],
        },
        week_header = {
            enable = true;
        },
        shortcut = {
            { desc = '󰊳 Update', action = 'Lazy update', key = 'u' },
            { desc = " Projects", action = "Telescope projects", key = 'o' },
            { desc = " Recently Files", action = "Telescope oldfiles", key = 'f' },
            { desc = " Edit Keybindings", action = "edit ~/.config/nvim/lua/keybindings.lua", key = 'e' },
            { desc = " Edit Projects", action = "edit ~/.local/share/nvim/project_nvim/project_history", key = 'w' },
        },
        packages = { enable = false },
        project = { enable = false },
        footer = {
            [[]],
            [[]],
            [[zqurgy:学习Vim使我强大！！！]],
            [[]],
            [[]],
        },
    },

}








