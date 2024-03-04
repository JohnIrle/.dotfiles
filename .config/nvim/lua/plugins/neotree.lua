return {
  'nvim-neo-tree/neo-tree.nvim',
  cmd = 'Neotree',
  keys = {
    { '<leader>ft', '<cmd>Neotree toggle<cr>', desc = 'NeoTree' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  config = {
    filesystem = {
      --   follow_current_file.enabled ,
      follow_current_file = {
        enabled = true,
      },
      hijack_netrw_behavior = 'open_current',
    },
  },
}
