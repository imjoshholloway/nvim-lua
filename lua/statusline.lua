-- auto change color according to neovims mode
local function mode_format(str)
  local icons = {
    n     = ' ',
    i     = ' ',
    c     = 'ﲵ ',
    [''] = ' ',
    v     = ' ',
    r     = '﯒ ',
    t     = ' ',
  };
  local l = str:sub(1, 1)
  return (icons[string.lower(l)] ~= nil and icons[string.lower(l)] or icons['c']) .. (l and l or '')
end

require("lualine").setup({
  sections = {
    lualine_a = { { 'mode', icons_enabled = true, fmt = mode_format } },
  },
  options = { section_separators = '' }
})
