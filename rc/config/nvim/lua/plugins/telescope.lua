return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    opts.pickers = opts.pickers or {}
    opts.pickers.find_files = opts.pickers.find_files or {}
    opts.pickers.find_files.hidden = true
    opts.pickers.find_files.no_ignore = true
    return opts
  end,
}
