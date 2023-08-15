local function grep_in(node)
  if not node then
    return
  end
  local path = node.absolute_path or uv.cwd()
  if node.type ~= 'directory' and node.parent then
    path = node.parent.absolute_path
  end
  require('telescope.builtin').live_grep({
    search_dirs = { path },
    prompt_title = string.format('Grep in [%s]', vim. fs.basename(path)),
  })
end

return{
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        keys = {
                {"<leader>e", "<cmd>Neotree toggle<CR>", desc = "Open the neo-tree", mode = { "n", "v" }},
                {'<leader>C-f', action = '', action_cb = grep_in, mode = 'n' },
            },
        config = true,
    },
}
