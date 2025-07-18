-- ~/.config/nvim/lua/plugins/colorschemes.lua
-- Retro color themes + automatic save/load on selection
return {
  -- Gruvbox (warm retro)
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      contrast = "hard",
      dim_inactive = true,
      italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
      },
    },
  },

  -- Solarized8 (dark & light)
  {
    "lifepillar/vim-solarized8",
    name = "solarized8",
    lazy = false,
    config = function()
      vim.g.solarized_visibility = "high"
      vim.g.solarized_contrast = "high"
    end,
  },

  -- Dromad (Caves of Qud inspired)
  {
    "ngscheurich/dromad-vim",
    name = "dromad",
    lazy = false,
  },

  -- Dracula (high-contrast classic)
  { "dracula/vim", name = "dracula", lazy = false },

  -- Rose Pine
  { "rose-pine/neovim", name = "rose-pine", lazy = false },

  -- Nightfox
  { "EdenEast/nightfox.nvim", lazy = false },

  -- Moonlight
  { "shaunsingh/moonlight.nvim", name = "moonlight", lazy = false },

  -- Synthwave ’84
  { "lunarvim/synthwave84.nvim", lazy = false },

  -- Ayu (dark)
  {
    "ayu-theme/ayu-vim",
    name = "ayu",
    lazy = false,
    config = function()
      vim.g.ayucolor = "dark"
    end,
  },

  -- Nord
  { "arcticicestudio/nord-vim", lazy = false },

  -- One Dark
  { "navarasu/onedark.nvim", lazy = false },

  -- Kanagawa
  { "rebelot/kanagawa.nvim", lazy = false },

  -- GitHub theme (no longer supports theme_style)
  {
    "projekt0n/github-nvim-theme",
    name = "github_nvim_theme",
    lazy = false,
    config = function()
      require("github-theme").setup({})
    end,
  },

  -- Save selected theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        local ok, scheme = pcall(vim.fn.readfile, vim.fn.stdpath("data") .. "/last_colorscheme")
        if ok and scheme and scheme[1] then
          vim.cmd.colorscheme(scheme[1])
        else
          vim.cmd.colorscheme("gruvbox")
        end
      end,
    },
  },

  -- Save theme on change
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
    config = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          local name = vim.g.colors_name
          if name then
            local file = vim.fn.stdpath("data") .. "/last_colorscheme"
            local ok, f = pcall(io.open, file, "w")
            if ok and f then
              f:write(name)
              f:close()
            end
          end
        end,
      })
    end,
  },
}
