return {
    {
        'akinsho/toggleterm.nvim', 
        version = "*", 
        config = function()
            require("toggleterm").setup();
        end,
        autochdir = true;
    },
}
