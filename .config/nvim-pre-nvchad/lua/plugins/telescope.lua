local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = '> ',
    selection_caret = "  ",
    entry_prefix = "  ",
    color_devicons = true,
    winblend = 0,
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {prompt_position = "top", preview_width = 0.55, results_width = 0.8},
      vertical = {mirror = false},
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120
    },
    border = {},
    use_less = true,
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    mappings = {i = {["<C-x>"] = false, ["<C-q>"] = actions.send_to_qflist}}
  },
  extensions = {fzy_native = {override_generic_sorter = false, override_file_sorter = true}}
}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('file_browser')

local M = {}
M.search_dotfiles = function()
  require("telescope.builtin").find_files({
    prompt_title = "< VimRC >",
    cwd = "$HOME/.config/nvim",
    file_ignore_patterns = {"lua%-language%-server/.*", "autoload/.*"}
  })
end

local function set_background(content)
  vim.fn.system("osascript -e 'tell application \"Finder\" to set desktop picture to POSIX file \"" .. content .. "\"\'")
end

local function select_background(prompt_bufnr, map)
  local function set_the_background(close)
    local content = require('telescope.actions.state').get_selected_entry(prompt_bufnr)
    set_background(content.cwd .. "/" .. content.value)
    if close then require('telescope.actions').close(prompt_bufnr) end
  end

  map('i', '<C-b>', function()
    set_the_background()
  end)

  map('i', '<CR>', function()
    set_the_background(true)
  end)
end

local function image_selector(prompt, cwd)
  return function()
    require("telescope.builtin").find_files({
      prompt_title = prompt,
      cwd = cwd,
      previewer = false,
      attach_mappings = function(prompt_bufnr, map)
        select_background(prompt_bufnr, map)

        -- Please continue mapping (attaching additional key maps):
        -- Ctrl+n/p to move up and down the list.
        return true
      end
    })
  end
end

M.anime_selector = image_selector("< Background Selector > ", "~/Pictures/gruvbox")

return M
