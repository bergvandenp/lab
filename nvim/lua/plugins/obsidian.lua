return {
	{
		-- https://github.com/epwalsh/obsidian.nvim
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		keys = {
			{ "<leader>on", ":ObsidianNew <CR>" },
			{ "<leader>ot", ":ObsidianToday <CR>" },
			{ "<leader>ob", ":ObsidianBacklinks <CR>" },
		},
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		--   -- refer to `:h file-pattern` for more examples
		--   "BufReadPre path/to/my-vault/*.md",
		--   "BufNewFile path/to/my-vault/*.md",
		-- },
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
			-- see below for full list of optional dependencies 👇
		},
		opts = {
			ui = {
				enable = false,
			},
			workspaces = {
				{
					name = "personal",
					path = "~/Obsidian",
				},
			},
			notes_subdir = "Inbox",
			new_notes_location = "notes_subdir",
			daily_notes = {
				folder = "Journal",
			},
			note_id_func = function(title)
				local log = require("obsidian.log")
				-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
				-- In this case a note with the title 'My new note' will be given an ID that looks
				-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
				local suffix = ""
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					-- If title is nil, just add 4 random uppercase letters to the suffix.
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return tostring(os.time()) .. "-" .. suffix
			end,
			-- see below for full list of options 👇
		},
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			{ "epwalsh/obsidian.nvim", "saghen/blink.compat", lazy = true, version = false },
		},
		opts = {
			sources = {
				-- LazyVim as custom option copmpat to pass in external sources with blink.compat
				compat = { "obsidian", "obsidian_new", "obsidian_tags" },
			},
		},
	},
}
