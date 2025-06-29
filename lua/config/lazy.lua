local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },

    {
      "snacks.nvim",
      opts = {
        dashboard = {
          preset = {
            header = [[
 ____________/\\\\\_____/\\\__/\\\\\\\\\\\\\\\_______/\\\\\_______/\\\________/\\\__/\\\\\\\\\\\__/\\\\____________/\\\\___________         
  ___________\/\\\\\\___\/\\\_\/\\\///////////______/\\\///\\\____\/\\\_______\/\\\_\/////\\\///__\/\\\\\\________/\\\\\\___________        
   ___________\/\\\/\\\__\/\\\_\/\\\_______________/\\\/__\///\\\__\//\\\______/\\\______\/\\\_____\/\\\//\\\____/\\\//\\\___________       
    ___________\/\\\//\\\_\/\\\_\/\\\\\\\\\\\______/\\\______\//\\\__\//\\\____/\\\_______\/\\\_____\/\\\\///\\\/\\\/_\/\\\___________      
     ___________\/\\\\//\\\\/\\\_\/\\\///////______\/\\\_______\/\\\___\//\\\__/\\\________\/\\\_____\/\\\__\///\\\/___\/\\\___________     
      ___________\/\\\_\//\\\/\\\_\/\\\_____________\//\\\______/\\\_____\//\\\/\\\_________\/\\\_____\/\\\____\///_____\/\\\___________    
       ___________\/\\\__\//\\\\\\_\/\\\______________\///\\\__/\\\________\//\\\\\__________\/\\\_____\/\\\_____________\/\\\___________   
        ___________\/\\\___\//\\\\\_\/\\\\\\\\\\\\\\\____\///\\\\\/__________\//\\\________/\\\\\\\\\\\_\/\\\_____________\/\\\___________  
         ___________\///_____\/////__\///////////////_______\/////_____________\///________\///////////__\///______________\///____________ 
        ]],
          },
        },
      },
    },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
