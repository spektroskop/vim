local hi = require'junkbox.util'.hi

local default_colors = {
  accent = '#a39a89',
  black  = '#000000',
  gray1  = '#111111',
  gray2  = '#222222',
  gray3  = '#444444',
  gray4  = '#666666',
}

local scheme_colors = {
  iceberg = {
    accent = '#788098',
    gray1 = '#0c0f0f',
  },
}

local function make_colors()
  local colors = {}
  local scheme = scheme_colors[vim.g.colors_name] or {}
  for k, v in pairs(default_colors) do colors[k] = v end
  for k, v in pairs(scheme) do colors[k] = v end
  return colors
end

return function()
  local c = make_colors()

  hi 'NormalFloat' { guibg=c.black }
  hi 'FloatBorder' { guibg=c.black, guifg=c.gray3 }
  hi 'FoldColumn' { guifg=c.gray3, guibg=c.gray1 }
  hi 'Folded' { guifg=c.gray3, guibg=c.gray1 }
  hi 'NonText' { guifg=c.gray2 }
  hi 'Todo' { guifg='#b16286', guibg='none', gui='bold' }
  hi 'Normal' { guibg='none' }
  hi 'PMenu' { guibg=c.gray2 }
  hi 'PMenuSel' { guifg=c.black, guibg=c.accent, gui='bold' }
  hi 'SpecialKey' { guifg=c.gray2 }
  hi 'VertSplit' { guifg=c.gray1, guibg=c.gray1 }

  hi 'StatusLine' { guifg=c.gray1, guibg=c.gray4 }
  hi 'StatusLineNC' { guifg=c.gray1, guibg=c.gray1 }

  hi 'TabLine' { guifg=c.gray4, guibg=c.gray2, gui='none' }
  hi 'TabLineFill' { guifg=c.gray3, guibg=c.black, gui='none' }
  hi 'TabLineSel' { guifg=c.black, guibg=c.accent, gui='bold' }

  hi 'TelescopeBorder' { guifg=c.gray2 }
  hi 'TelescopePreviewBorder' { guifg=c.gray3 }
  hi 'TelescopePromptBorder' { guifg=c.gray3 }
  hi 'TelescopePromptPrefix' { guifg=c.gray3 }
  hi 'TelescopeResultsBorder' { guifg=c.gray3 }
  hi 'TelescopeSelection' { link='Number' }

  hi 'ActiveStatusLine1' { guifg=c.black, guibg=c.accent, gui='bold' }
  hi 'ActiveStatusLine2' { guifg=c.gray4, guibg=c.gray1 }
  hi 'ActiveStatusLine3' { guifg=c.gray3, guibg=c.gray1 }
  hi 'InactiveStatusLine1' { guifg=c.black, guibg=c.gray1, gui='bold' }
  hi 'InactiveStatusLine2' { guifg=c.gray4, guibg=c.gray1 }
  hi 'InactiveStatusLine3' { guifg=c.gray3, guibg=c.gray1 }
  hi 'StatusLineFill' { guifg=c.gray2, guibg=c.gray1 }
end
