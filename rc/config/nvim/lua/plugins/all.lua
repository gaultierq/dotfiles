return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = "hyper", -- theme is 'hyper', change this if needed
        preview = {
          command = "", -- specify the preview command
          file_path = "", -- specify the preview file path
          file_height = 20, -- adjust preview file height
          file_width = 80, -- adjust preview file width
        },
      })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
