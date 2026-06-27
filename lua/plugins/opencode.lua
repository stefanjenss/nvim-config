-- OpenCode integration for in-editor AI pairing.
return {
  {
    "nickjvandyke/opencode.nvim",
    version = "*",
    config = function()
      local opencode_cmd = "opencode --port"
      local terminal_opts = {
        win = {
          position = "right",
          width = 0.4,
          enter = false,
        },
      }

      ---@type opencode.Opts
      vim.g.opencode_opts = {
        server = {
          start = function()
            require("snacks.terminal").open(opencode_cmd, terminal_opts)
          end,
        },
      }

      -- Required for automatic reloads after OpenCode edits files on disk.
      vim.o.autoread = true

      vim.keymap.set({ "n", "x" }, "<leader>oa", function()
        require("opencode").ask("@this: ")
      end, { desc = "Ask OpenCode" })

      vim.keymap.set({ "n", "x" }, "<leader>os", function()
        require("opencode").select()
      end, { desc = "Select OpenCode" })

      vim.keymap.set({ "n", "t" }, "<C-.>", function()
        require("snacks.terminal").toggle(opencode_cmd, terminal_opts)
      end, { desc = "Toggle OpenCode" })

      vim.keymap.set("n", "<leader>on", function()
        require("opencode").command("session.new")
      end, { desc = "New OpenCode session" })

      vim.keymap.set("n", "<leader>ou", function()
        require("opencode").command("session.undo")
      end, { desc = "Undo OpenCode change" })

      vim.keymap.set("n", "<leader>or", function()
        require("opencode").command("session.redo")
      end, { desc = "Redo OpenCode change" })

      vim.keymap.set("n", "<leader>oi", function()
        require("opencode").command("session.interrupt")
      end, { desc = "Interrupt OpenCode" })

      vim.api.nvim_create_autocmd("User", {
        pattern = "OpencodeEvent:tui.command.execute",
        callback = function(args)
          local event = args.data.event
          if event.properties.command == "prompt.submit" then
            local win = require("snacks.terminal").get(opencode_cmd, { create = false })
            if win then
              win:show()
            end
          end
        end,
      })
    end,
  },
}
