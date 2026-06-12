return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true,
        sources = {
          files = {
            hidden = true,
            ignored = true,
          },
        },
      },
      explorer = {
        win = {
          keys = {
            o = "confirm",
          },
        },
      },
    },
  },
}
