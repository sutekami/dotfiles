return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        enabled = false,
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
            exclude = { "**/.git", "**/.DS_Store" },
          },
        },
      },
    },
  },
}
