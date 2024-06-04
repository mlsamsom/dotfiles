require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", {desc = "Toggle breakpoint"})
map("n", "<leader>dus", function ()
  local widgets = require("dap.ui.widgets");
  local sidebar = widgets.sidebar(widgets.scopes);
  sidebar.open();
end, {desc = "Open debugging sidebar"})
map("n", "<leader>rcu", function ()
  require("crates").upgrade_all_crates()
end, {desc = "Update crates"})
-- map("n", "<leader>gg", "<cmd> LazyGit <CR>", {desc = "Start lazy git"})
map("n", "<leader>|", "<cmd> vsp <CR>", {desc = "Split window"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
