 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#000000',
    base01 = '#121628',
    base02 = '#191e32',
    base03 = '#767d98',
    base04 = '#a5adce',
    base05 = '#c6d0f5',
    base06 = '#c6d0f5',
    base07 = '#c6d0f5',
    base08 = '#e78284',
    base09 = '#ca9ee6',
    base0A = '#babbf1',
    base0B = '#8caaee',
    base0C = '#c896e9',
    base0D = '#90adef',
    base0E = '#9597e9',
    base0F = '#a71013',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#c6d0f5',          bg = '#000000' })
  hi('TelescopeBorder',         { fg = '#767d98',             bg = '#000000' })
  hi('TelescopePromptNormal',   { fg = '#c6d0f5',          bg = '#000000' })
  hi('TelescopePromptBorder',   { fg = '#767d98',             bg = '#000000' })
  hi('TelescopePromptPrefix',   { fg = '#8caaee',             bg = '#000000' })
  hi('TelescopePromptCounter',  { fg = '#a5adce',  bg = '#000000' })
  hi('TelescopePromptTitle',    { fg = '#000000',             bg = '#8caaee' })
  hi('TelescopePreviewTitle',   { fg = '#000000',             bg = '#babbf1' })
  hi('TelescopeResultsTitle',   { fg = '#000000',             bg = '#ca9ee6' })
  hi('TelescopeSelection',      { fg = '#c6d0f5',          bg = '#191e32' })
  hi('TelescopeSelectionCaret', { fg = '#8caaee',             bg = '#191e32' })
  hi('TelescopeMatching',       { fg = '#8caaee',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
