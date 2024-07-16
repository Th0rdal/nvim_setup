local fn = vim.fn

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		local rtp_addition = vim.fn.stdpath('data') .. '/site/pack/*/start/*'
		if not string.find(vim.o.runtimepath, rtp_addition) then
		vim.o.runtimepath = rtp_addition .. ',' .. vim.o.runtimepath
		end
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
  end
  
local packer_bootstrap = ensure_packer()
vim.cmd 'packadd packer.nvim'

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
	
  --use ({
	--  'rose-pine/neovim',
	  --as = 'rose-pine',
	  --config = function()
	--	  vim.cmd('colorscheme rose-pine')
	 -- end
  --})
    use("Abstract-IDE/Abstract-cs")
    use("NvChad/nvim-colorizer.lua")
    use("kyazdani42/nvim-web-devicons")
  
    use("lewis6991/impatient.nvim")
    use("kylechui/nvim-surround")
    use("voldikss/vim-floaterm")
    use("lewis6991/gitsigns.nvim")

    use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true})
		  ts_update()
	  end,}
  use('nvim-treesitter/playground')
  use("nvim-treesitter/nvim-treesitter-context")
  use("theprimeagen/harpoon")
  use("theprimeagen/refactoring.nvim")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
  use({
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup {
            icons = false,
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    end
  })
	use("folke/zen-mode.nvim")
	use("eandrju/cellular-automaton.nvim")
	use("laytan/cloak.nvim")
	use("github/copilot.vim")
	use {
		'goolord/alpha-nvim',
		requires = { 'nvim-tree/nvim-web-devicons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
		end}
	use("folke/which-key.nvim")
	use {
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}
	use("nvim-telescope/telescope-project.nvim")

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
		  'nvim-tree/nvim-web-devicons',
		},
	  }
	use("pluffie/neoproj")
    use("yorickpeterse/nvim-window")
    use("feline-nvim/feline.nvim")
	use { 'CRAG666/betterTerm.nvim' }
    use("tpope/vim-commentary")
    use{"stevearc/overseer.nvim",
        config = function() require("overseer").setup() end
    }
    use{ "dasupradyumna/launch.nvim",
        requires = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-notify",
        }
    }

	if packer_bootstrap then
		require("packer").sync()
	end

end)

