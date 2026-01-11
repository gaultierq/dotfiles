return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- enable hidden files toggle
        hide_dotfiles = false, -- show dotfiles
        hide_gitignored = false,
      },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
    vim.api.nvim_create_autocmd({ "VimEnter", "SessionLoadPost" }, {
      callback = function()
        if vim.fn.argc() == 0 then
          require("neo-tree").show()
        end
      end,
    })
  end,
}
