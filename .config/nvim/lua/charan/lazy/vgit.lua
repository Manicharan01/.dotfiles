return {
    "tanvirtin/vgit.nvim",
    branch = 'v1.0.x',
    event = 'VimEnter',

    config = function()
        require("vgit").setup({})
    end,
}
