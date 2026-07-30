local M = {}

function M.setup()
  require('base16-colorscheme').setup {
    base00 = '#000000',
    base01 = '#110d1a',
    base02 = '#1a1428',
    base03 = '#644c94',
    base04 = '#b58fff',
    base05 = '#e8d8ff',
    base06 = '#e8d8ff',
    base07 = '#e8d8ff',
    base08 = '#ff6f9b',
    base09 = '#d8b4ff',
    base0A = '#c79aff',
    base0B = '#b58fff',
    base0C = '#bd80ff',
    base0D = '#ab80ff',
    base0E = '#b880ff',
    base0F = '#bc0039',
  }
end

local signal = vim.uv.new_signal()
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
