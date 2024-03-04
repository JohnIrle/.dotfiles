return {
  'goolord/alpha-nvim',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
  },
  config = function()
    local startify = require 'alpha.themes.startify'

    startify.section.header.val = {
      '     █████████   █████                         █████     ',
      '    ███░░░░░███ ░░███                         ░░███      ',
      '   ░███    ░░░  ███████    ██████   ████████  ███████    ',
      '   ░░█████████ ░░░███░    ░░░░░███ ░░███░░███░░░███░     ',
      '    ░░░░░░░░███  ░███      ███████  ░███ ░░░   ░███      ',
      '    ███    ░███  ░███ ███ ███░░███  ░███       ░███ ███  ',
      '   ░░█████████   ░░█████ ░░████████ █████      ░░█████   ',
      '   ░░░░░░░░░     ░░░░░   ░░░░░░░░ ░░░░░        ░░░░░     ',
    }
    require('alpha').setup(startify.opts)
  end,
}
