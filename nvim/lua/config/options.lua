-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Globally disable all snacks animations
vim.g.snacks_animate = false

-- Keep 10 lines of context above and below the cursor
vim.opt.scrolloff = 16

-- Exit insert mode instantly with jk
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })

-- Sync Neovim with the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Get the exact absolute path to the executable we downloaded
local win32yank = vim.fn.expand("~/.local/bin/win32yank.exe")

-- Force WSL to use win32yank. Note the proper Lua table { } syntax!
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = { win32yank, "-i", "--crlf" },
      ["*"] = { win32yank, "-i", "--crlf" },
    },
    paste = {
      ["+"] = { win32yank, "-o", "--lf" },
      ["*"] = { win32yank, "-o", "--lf" },
    },
    cache_enabled = 0,
  }
end
