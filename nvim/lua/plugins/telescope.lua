return { 
  "nvim-telescope/telescope.nvim", 
  dependencies = "tsakirist/telescope-lazy.nvim", 
  keys = {
    {"<leader>fb", ":Telescope file_browser<CR>"},
    {"<leader>ff", ":Telescope find_files<CR>"},
    {"<leader>fg", ":Telescope live_grep<CR>"},
    {"<leader>fh", ":Telescope help_tags<CR>"},
  },
	opts = {
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--follow",        -- Follow symbolic links
				"--hidden",        -- Search for hidden files
				"--no-heading",    -- Don't group matches by each file
				"--with-filename", -- Print the file path with the matched lines
				"--line-number",   -- Show line numbers
				"--column",        -- Show column numbers
				"--smart-case",    -- Smart case search

				 -- Exclude some patterns from search
				"--glob=!**/.git/*",
				"--glob=!**/.idea/*",
				"--glob=!**/.vscode/*",
				"--glob=!**/build/*",
				"--glob=!**/dist/*",
				"--glob=!**/yarn.lock",
				"--glob=!**/package-lock.json",
			},
		},
		pickers = {
			find_files = {
				hidden = true,
				-- needed to exclude some files & dirs from general search
				-- when not included or specified in .gitignore
				find_command = {
					"rg",
					"--files",
					"--hidden",
					"--glob=!**/.git/*",
					"--glob=!**/.idea/*",
					"--glob=!**/.vscode/*",
					"--glob=!**/build/*",
					"--glob=!**/dist/*",
					"--glob=!**/yarn.lock",
					"--glob=!**/package-lock.json",
				},
			},
		},
	}
}
