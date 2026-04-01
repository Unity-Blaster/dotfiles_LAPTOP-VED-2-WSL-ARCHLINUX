-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Paste over highlighted text without losing clipboard (Ctrl + p)
vim.keymap.set("x", "<C-p>", '"_dP', { desc = "Paste without yanking" })

-- Remap line moving to Shift+Up/Down since Windows Terminal eats Alt+j/k
vim.keymap.set("n", "<S-Down>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<S-Up>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
vim.keymap.set("v", "<S-Down>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<S-Up>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Select entire file (Ctrl + a)
vim.keymap.set({ "n", "i", "v" }, "<C-a>", "<Esc>ggVG", { desc = "Select All" })

-- Keep cursor strictly centered when jumping pages
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Keep cursor centered when cycling through search results
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search result and center" })

-- Stay in visual mode after indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and keep selection" })

-- Replace the word under the cursor across the whole file
vim.keymap.set(
  "n",
  "<leader>rw",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" }
)

-- Add granular undo points while typing
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- Inject blank lines without leaving normal mode
vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "Add blank line below" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "Add blank line above" })

-- Force reload file from disk while preserving exact cursor position
-- Context-Aware Reload: Preserves cursor in both Text Files AND Oil Directories
vim.keymap.set("n", "<F5>", function()
  -- Check if we are currently looking at an Oil directory buffer
  if vim.bo.filetype == "oil" then
    require("oil.actions").refresh.callback()
    vim.notify("Directory refreshed", vim.log.levels.INFO, { title = "Oil" })
    return
  end

  -- Normal file refresh behavior
  local cursor = vim.api.nvim_win_get_cursor(0)
  vim.cmd("edit!")
  pcall(vim.api.nvim_win_set_cursor, 0, cursor)
  vim.notify("Buffer reloaded from disk", vim.log.levels.INFO, { title = "Neovim" })
end, { desc = "Reload Buffer/Directory (Keep Cursor)" })
