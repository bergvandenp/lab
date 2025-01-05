-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { 
      "<leader>e", ":NvimTreeToggle<CR>",
    },
  },
  config = function()
    require("nvim-tree").setup {
      view = {
        float = {
	  enable = true,
	  quit_on_focus_loss = true,
	}
      },
      update_focused_file = {
        enable = true,
        update_root = {
          enable = false,
          ignore_list = {},
        },
        exclude = false,
      },
    }
  end,
}

