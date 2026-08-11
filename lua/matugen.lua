 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1e1e2e',
    base01 = '#313244',
    base02 = '#3a3b50',
    base03 = '#6c7086',
    base04 = '#a6adc8',
    base05 = '#cdd6f4',
    base06 = '#cdd6f4',
    base07 = '#cdd6f4',
    base08 = '#f38ba8',
    base09 = '#cba6f7',
    base0A = '#b4befe',
    base0B = '#89b4fa',
    base0C = '#bb8af4',
    base0D = '#85b1fa',
    base0E = '#8192fd',
    base0F = '#c8043a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#cdd6f4',          bg = '#1e1e2e' })
  hi('TelescopeBorder',         { fg = '#6c7086',             bg = '#1e1e2e' })
  hi('TelescopePromptNormal',   { fg = '#cdd6f4',          bg = '#1e1e2e' })
  hi('TelescopePromptBorder',   { fg = '#6c7086',             bg = '#1e1e2e' })
  hi('TelescopePromptPrefix',   { fg = '#89b4fa',             bg = '#1e1e2e' })
  hi('TelescopePromptCounter',  { fg = '#a6adc8',  bg = '#1e1e2e' })
  hi('TelescopePromptTitle',    { fg = '#1e1e2e',             bg = '#89b4fa' })
  hi('TelescopePreviewTitle',   { fg = '#1e1e2e',             bg = '#b4befe' })
  hi('TelescopeResultsTitle',   { fg = '#1e1e2e',             bg = '#cba6f7' })
  hi('TelescopeSelection',      { fg = '#cdd6f4',          bg = '#3a3b50' })
  hi('TelescopeSelectionCaret', { fg = '#89b4fa',             bg = '#3a3b50' })
  hi('TelescopeMatching',       { fg = '#89b4fa',             bold = true })
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
