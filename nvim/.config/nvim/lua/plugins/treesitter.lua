return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            -- Parsers are compiled with the tree-sitter CLI (brew install tree-sitter-cli)
            require("nvim-treesitter").install({
                "python", "go", "gomod", "java", "c_sharp", "javascript", "typescript",
                "tsx", "html", "css", "bash", "json", "yaml", "toml", "http",
            })

            -- Enable built-in treesitter highlight per buffer (silent if parser missing)
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(ev)
                    pcall(vim.treesitter.start, ev.buf)
                end,
            })
        end,
    },
}
