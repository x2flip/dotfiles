return {
	    "folke/which-key.nvim",
	    { "folke/neoconf.nvim", cmd = "Neoconf" },
	    "folke/neodev.nvim",
	    { 
            "catppuccin/nvim", 
            name = "catppuccin", 
            priority = 1000,
            config = function()
                require("catppuccin").setup()
                vim.cmd.colorscheme "catppuccin"
            end,
        },
	    {
		    "stevearc/conform.nvim",
		    opts = {},
	    },
	    {
		    "nvim-telescope/telescope.nvim",
		    tag = "0.1.6",
		    dependencies = { "nvim-lua/plenary.nvim" },
	    },
	    {
		    "nvim-lualine/lualine.nvim",
		    dependencies = { "nvim-tree/nvim-web-devicons" },
	    },
	    {
		    "numToStr/Comment.nvim",
		    opts = {
			    -- add any options here
		    },
		    lazy = false,
	    },
	    {
		    "windwp/nvim-autopairs",
		    config = function()
			    require("nvim-autopairs").setup({})
		    end,
	    },
	    { "mbbill/undotree" },
	    { "tpope/vim-fugitive" },

}
