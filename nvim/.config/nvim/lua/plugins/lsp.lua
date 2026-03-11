return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jsonls = { mason = false },
        vtsls = { mason = false },
      },
    },
  },
  { "nvim-pack/nvim-spectre", enabled = false },
}
