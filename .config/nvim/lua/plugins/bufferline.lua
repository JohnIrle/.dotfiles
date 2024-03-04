return {
  'akinsho/bufferline.nvim',
  config = function()
    require('bufferline').setup {
      options = {
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          if context.buffer:current() then
            return ''
          end

          return ''
        end,
        show_buffer_close_icons = false,
      },
    }
  end,
}
