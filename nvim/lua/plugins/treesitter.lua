return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "markdown", "lua", "javascript", "html", "vim", "vimdoc", "rust", "sql", "json", "go", "typescript", "yaml", "tsx" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
