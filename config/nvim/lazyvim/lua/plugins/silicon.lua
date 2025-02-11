return {
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    init = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>ss", ":Silicon<CR>", desc = "Snapshot Screenshot highlighted code.", mode = "v" },
      })
    end,
    config = function()
      require("nvim-silicon").setup({
        font = "Jetbrains Mono Nerd Font=34;Noto Color Emoji=34",
        theme = "Catppuccin",
        background = "#94e2d5",
        to_clipboard = true,
        no_window_controls = false,
        pad_horiz = 70,
        pad_vert = 70,
        shadow_offset_x = 0,
        shadow_offset_y = 0,
        shadow_color = nil,
        shadow_blur_radius = 30,
        gobble = true,
        window_title = function()
          return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
          -- num_separator = "\u{258f}",
          -- background_image = "./painted.png",
        end,
      })
    end,
  },
}
