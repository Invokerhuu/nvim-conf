local ts_select_dir_for_grep = function(prompt_bufnr)
  local action_state = require("telescope.actions.state")
  local fb = require("telescope").extensions.file_browser
  local live_grep = require("telescope.builtin").live_grep
  local current_line = action_state.get_current_line()

  fb.file_browser({
    files = false,
    depth = false,
    attach_mappings = function(prompt_bufnr)
      require("telescope.actions").select_default:replace(function()
        local entry_path = action_state.get_selected_entry().Path
        local dir = entry_path:is_dir() and entry_path or entry_path:parent()
        local relative = dir:make_relative(vim.fn.getcwd())
        local absolute = dir:absolute()

        live_grep({
          results_title = relative .. "/",
          cwd = absolute,
          default_text = current_line,
        })
      end)

      return true
    end,
  })
end

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
        "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
        { '<leader>?',       "<cmd>lua require('telescope.builtin').oldfiles()<cr>" },
        { "<leader><space>", "<cmd>lua require('telescope.builtin').buffers({ sort_mru = true })<cr>" },
        { "<leader>/",
            function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end
        },
        { '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>" },
        { '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
        { '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>" },
        { '<leader>fp', "<cmd>lua require('telescope.builtin').builtin()<cr>" },
        { '<leader>fm', "<cmd>lua require('telescope.builtin').marks()<cr>" },
        { '<leader>qf', "<cmd>lua require('telescope.builtin').quickfix()<cr>" },
        { '<leader>km', "<cmd>lua require('telescope.builtin').keymaps()<cr>" },
        { '<c-p>',      "<cmd>lua require('telescope.builtin').commands()<cr>" },
    },
    config = function()
        require('telescope').setup {
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                }
            },

            pickers = {
                live_grep = {
                    mappings = {
                        i = {
                            ["<C-f>"] = ts_select_dir_for_grep,
                        },
                        n = {
                            ["<C-f>"] = ts_select_dir_for_grep,
                        },
                    },
                },
            },
        }
        require('telescope').load_extension('fzf')
    end
}


