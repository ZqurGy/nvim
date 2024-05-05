local status, ls = pcall(require, "luasnip")
if not status then
  return
end

local status, types = pcall(require, "luasnip.util.types")
if not status then
  return
end

ls.config.set_config({
  history = true,
  update_events = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        -- virt_text = { { "choiceNode", "Comment" } },
        virt_text = { { "<--", "Error" } },
      },
    },
  },
})

vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end)

vim.keymap.set({ "i", "s" }, "<C-h>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end)

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end)
