return {
    {
        "dnlhc/glance.nvim",
        config = function()
            local glance = require('glance')
            local actions = glance.actions
            require('glance').setup({
                border = {
                    enable = true,
                },
                theme = {
                    mode = 'darken',
                },
                mappings = {
                    list = {
                        ['e'] = actions.jump,
                    },
                },
            })
        end,
    },
}
