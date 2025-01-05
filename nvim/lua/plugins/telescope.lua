return { 
  "nvim-telescope/telescope.nvim", 
  dependencies = "tsakirist/telescope-lazy.nvim", 
  keys = {
    {"<leader>fb", ":Telescope file_browser<CR>"},
    {"<leader>ff", ":Telescope find_files<CR>"},
    {"<leader>fg", ":Telescope live_grep<CR>"},
    {"<leader>fh", ":Telescope help_tags<CR>"},
  }
}
