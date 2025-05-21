return {
    "RaafatTurki/hex.nvim",
    lazy = false,
    keys = {
        {
            "<leader>b",
            ":HexToggle<cr>",
            desc = "toggle binary reader",
            mode = "n",
        },
    },
    opts = {
        dump_cmd = "xxd -b -g 1 -u",
        assemble_cmd = "xxd -r",
    },
}
