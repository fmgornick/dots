return {
  "ThePrimeagen/harpoon",
  keys = {
    { 
      "H", 
      ":lua require('harpoon.ui').nav_prev()<cr>", 
      desc = "harpoon previous buffer", 
      mode = "n",
    },
    {
      "L",
      ":lua require('harpoon.ui').nav_next()<cr>",
      desc = "harpoon next buffer",
      mode = "n",
    },
    {
      "`h",
      ":lua require('harpoon.ui').nav_file(1)<cr>",
      desc = "first file in buffer list",
      mode = "n",
    },
    {
      "`j",
      ":lua require('harpoon.ui').nav_file(2)<cr>",
      desc = "second file in buffer list",
      mode = "n",
    },
    {
      "`k",
      ":lua require('harpoon.ui').nav_file(3)<cr>",
      desc = "third file in buffer list",
      mode = "n",
    },
    {
      "`l",
      ":lua require('harpoon.ui').nav_file(4)<cr>",
      desc = "fourth file in buffer list",
      mode = "n",
    },
    {
      "<leader>b",
      ":lua require('harpoon.ui').toggle_quick_menu()<cr>",
      desc = "list marked buffers",
      mode = "n",
    },
    {
      "<leader>m",
      ":lua require('harpoon.ui').add_file()<cr>",
      desc = "mark buffer",
      mode = "n",
    },
  },
}
