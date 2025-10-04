-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ---------- Python workflow keymaps ----------

-- Run current Python file in split terminal
vim.keymap.set("n", "<leader>r", function()
  vim.cmd("w")
  local file = vim.fn.fnameescape(vim.fn.expand("%:p"))
  vim.cmd("botright 12split | terminal python3 " .. file)
end, { desc = "Run Python file" })

-- ---------- IPython integration ----------
_G.IPY = { term = nil, buf = nil }

-- Open IPython in a bottom split
vim.keymap.set("n", "<leader>pi", function()
  local venv_ipy = vim.fn.getcwd() .. "/.venv/bin/ipython"
  local ipy_cmd = vim.loop.fs_stat(venv_ipy) and venv_ipy or "ipython"
  vim.cmd("botright 12split | terminal " .. ipy_cmd .. " -i")
  _G.IPY.buf = vim.api.nvim_get_current_buf()
  _G.IPY.term = vim.b.terminal_job_id
  vim.notify("IPython ready in split", vim.log.levels.INFO)
end, { desc = "Open IPython" })

local function send_to_ipy(lines)
  local term = _G.IPY and _G.IPY.term
  if not term then
    vim.notify("No IPython split found. Press <leader>pi first.", vim.log.levels.WARN)
    return
  end
  vim.fn.chansend(term, table.concat(lines, "\n") .. "\n")
end

-- Send current line to IPython
vim.keymap.set("n", "<leader>ps", function()
  send_to_ipy({ vim.api.nvim_get_current_line() })
end, { desc = "Send line to IPython" })

-- Send visual selection to IPython
vim.keymap.set("v", "<leader>ps", function()
  local s = vim.fn.getpos("'<")[2] - 1
  local e = vim.fn.getpos("'>")[2]
  local lines = vim.api.nvim_buf_get_lines(0, s, e, false)
  send_to_ipy(lines)
end, { desc = "Send selection to IPython" })

-- Send whole file to IPython
vim.keymap.set("n", "<leader>pf", function()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  send_to_ipy(lines)
end, { desc = "Send file to IPython" })
