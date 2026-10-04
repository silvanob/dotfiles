return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>a", function() require("harpoon"):list():add() end,                                           desc = "Harpoon Add" },
            { "<C-e>",     function() local h = require("harpoon"); h.ui:toggle_quick_menu(h:list()) end,            desc = "Harpoon Menu" },
            { "<C-1>",     function() require("harpoon"):list():select(1) end,                                       desc = "Harpoon 1" },
            { "<C-2>",     function() require("harpoon"):list():select(2) end,                                       desc = "Harpoon 2" },
            { "<C-3>",     function() require("harpoon"):list():select(3) end,                                       desc = "Harpoon 3" },
            { "<C-4>",     function() require("harpoon"):list():select(4) end,                                       desc = "Harpoon 4" },
        },
        config = function()
            require("harpoon"):setup()
        end,
    },

    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp",
            "TmuxNavigateRight", "TmuxNavigatePrevious",
        },
        keys = {
            { "<C-h>",  "<cmd>TmuxNavigateLeft<cr>",     desc = "Navigate Left" },
            { "<C-j>",  "<cmd>TmuxNavigateDown<cr>",     desc = "Navigate Down" },
            { "<C-k>",  "<cmd>TmuxNavigateUp<cr>",       desc = "Navigate Up" },
            { "<C-l>",  "<cmd>TmuxNavigateRight<cr>",    desc = "Navigate Right" },
            { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Navigate Previous" },
        },
    },
}
