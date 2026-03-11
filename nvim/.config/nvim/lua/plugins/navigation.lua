return {
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<CR>", desc = "Window left" },
      { "<C-l>", "<cmd>TmuxNavigateRight<CR>", desc = "Window right" },
      { "<C-j>", "<cmd>TmuxNavigateDown<CR>", desc = "Window down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<CR>", desc = "Window up" },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    keys = {
      { "<leader>sB", ":Telescope file_browser path=%:p:h=%:p:h<cr>", desc = "Browse Files" },
    },
    config = function()
      require("telescope").load_extension("file-browser")
    end,
  },
}
