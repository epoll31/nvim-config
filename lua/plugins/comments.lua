-- FIX: fix
-- FIXME: fixme
-- BUG: bug
-- FIXIT: fixit
-- ISSUE: issue
-- TODO: todo
-- HACK: hack
-- WARN: warn
-- WARNING: warning
-- XXX: xxx
-- PERF: perf
-- OPTIM: optim
-- PERFORMANCE: performance
-- OPTIMIZE: optimize
-- NOTE: note
-- INFO: info
-- TEST: test
-- TESTING: testing
-- PASSED: passed
-- FAILED: failed
-- SECTION: section

return {

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({
				keywords = {
					FIX = {
						icon = " ", -- icon used for the sign, and in search results
						color = "error", -- can be a hex color, or a named color (see below)
						alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
						-- signs = false, -- configure signs for some keywords individually
					},
					TODO = { icon = " ", color = "info" },
					HACK = { icon = " ", color = "warning" },
					WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
					PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
					NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
					TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
					SECTION = { icon = "󰚟", color = "hint" },
				},
			})

			vim.keymap.set("n", "]t", function()
				require("todo-comments").jump_next()
			end, { desc = "Next todo comment" })

			vim.keymap.set("n", "[t", function()
				require("todo-comments").jump_prev()
			end, { desc = "Previous todo comment" })

			-- You can also specify a list of valid jump keywords

			-- vim.keymap.set("n", "]t", function()
			-- 	require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
			-- end, { desc = "Next error/warning todo comment" })
		end,
	},
}
