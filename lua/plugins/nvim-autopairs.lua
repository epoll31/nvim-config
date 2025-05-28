return {
	{
		"windwp/nvim-autopairs",
		dependencies = {
			{
				"windwp/nvim-ts-autotag",
				config = true,
			},
		},
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
}
