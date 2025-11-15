return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,        -- enable hidden files toggle
        hide_dotfiles = false, -- show dotfiles
        hide_gitignored = false,
      },
    },
  },
}