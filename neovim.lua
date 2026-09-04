return {
  {
    "omacom/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      colors = {
        bg         = "#1d3715",
        dark_bg    = "#162910",
        darker_bg  = "#0f1c0b",
        lighter_bg = "#344b2c",

        fg         = "#c5f0d5",
        dark_fg    = "#94b4a0",
        light_fg   = "#cef2db",
        bright_fg  = "#d4f4e0",
        muted      = "#768870",

        red        = "#dec67d",
        yellow     = "#e5e89c",
        orange     = "#e3cf91",
        green      = "#aee996",
        cyan       = "#98edb3",
        blue       = "#89dea4",
        purple     = "#d9d98d",
        brown      = "#887c57",

        bright_red    = "#fce596",
        bright_yellow = "#faff7a",
        bright_green  = "#2effcd",
        bright_cyan   = "#92ffb0",
        bright_blue   = "#b3f9c2",
        bright_purple = "#f2f3a1",

        accent               = "#89dea4",
        cursor               = "#c5f0d5",
        foreground           = "#c5f0d5",
        background           = "#1d3715",
        selection             = "#344b2c",
        selection_foreground = "#c5f0d5",
        selection_background = "#344b2c",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
