require'lualine'.setup {
  options = {icons_enabled = true, theme = 'gruvbox', component_separators = '', section_separators = '', disabled_filetypes = {}},
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {lualine_a = {}, lualine_b = {}, lualine_c = {'filename'}, lualine_x = {'location'}, lualine_y = {}, lualine_z = {}},
  extensions = {}
}

require'bufferline'.setup {
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      if context.buffer:current() then return '' end

      return ''
    end,
    show_buffer_close_icons = false

  }
}
