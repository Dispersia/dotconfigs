local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local lspclient = require('galaxyline.provider_lsp')

require('nvim-web-devicons').setup {default = true}

local gls = gl.section
gl.short_line_list = {'defx', 'packager', 'vista'}

local colors = {
  bg = '#282a36',
  fg = '#f8f8f2',
  section_bg = '#38393f',
  yellow = '#f1fa8c',
  cyan = '#8be9fd',
  green = '#50fa7b',
  orange = '#ffb86c',
  magenta = '#ff79c6',
  blue = '#8be9fd',
  red = '#ff5555'
}

local mode_color = function()
  local mode_colors = {
    n = colors.cyan,
    i = colors.green,
    c = colors.orange,
    V = colors.magenta,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red
  }

  local color = mode_colors[vim.fn.mode()]

  if color == nill then color = colors.red end

  return color
end

gls.left[1] = {
  ViMode = {
    provider = function()
      local alias = {
        n = 'NORMAL',
        i = 'INSERT',
        c = 'COMMAND',
        V = 'VISUAL',
        [''] = 'VISUAL',
        v = 'VISUAL',
        R = 'REPLACE'
      }

      vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_color())
      local alias_mode = alias[vim.fn.mode()]
      if alias_mode == nil then alias_mode = vim.fn.mode() end
      return "  " .. alias_mode .. " "
    end,
    highlight = {colors.bg, colors.bg},
    separator = " ",
    separator_highlight = {colors.section_bg, colors.section_bg}
  }
}
gls.left[2] = {
  FileIcon = {
    provider = 'FileIcon',
    highlight = {
      require('galaxyline.provider_fileinfo').get_file_icon_color,
      colors.section_bg
    }
  }
}
gls.left[3] = {
  FileName = {
    provider = 'FileName',
    highlight = {colors.fg, colors.section_bg},
    separator = " ",
    separator_highlight = {colors.section_bg, colors.bg}
  }
}
gls.left[4] = {
  GitBranch = {
    provider = function()
      local vcs = require('galaxyline.provider_vcs')
      local branch_name = vcs.get_git_branch()
      if (string.len(branch_name) > 28) then
        return string.sub(branch_name, 1, 25) .. "..."
      end
      return branch_name .. " "
    end,
    condition = condition.check_git_workspace,
    highlight = {colors.fg, colors.bg}
  }
}
gls.left[5] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.check_git_workspace,
    icon = ' ',
    highlight = {colors.green, colors.bg}
  }
}
gls.left[6] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.check_git_workspace,
    icon = ' ',
    highlight = {colors.orange, colors.bg}
  }
}
gls.left[7] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.check_git_workspace,
    icon = ' ',
    highlight = {colors.red, colors.bg}
  }
}
gls.left[8] = {
  LeftEnd = {
    provider = function() return ' ' end,
    highlight = {colors.fg, colors.bg}
  }
}
gls.left[9] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red, colors.bg}
  }
}
gls.left[10] = {
  Space = {
    provider = function() return ' ' end,
    highlight = {colors.fg, colors.bg}
  }
}
gls.left[11] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.orange, colors.bg}
  }
}
gls.left[12] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',

    highlight = {colors.fg, colors.bg}
  }
}
gls.left[13] = {
  Space = {
    provider = function() return ' ' end,
    highlight = {colors.fg, colors.bg}
  }
}
gls.left[14] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue, colors.bg},
    separator = ' ',
    separator_highlight = {colors.section_bg, colors.bg}
  }
}
gls.left[15] = {
  ShowLspClient = {
    provider = function()
      return lspclient.get_lsp_client('')
    end,
    highlight = {colors.fg, colors.bg},
    separator = ' ',
    separator_highlight = {colors.fg, colors.bg}
  }
}
gls.left[16] = {
  ShowLspStatus = {
    provider = function()
      return require('lsp-status').status()
    end,
    highlight = { colors.fg, colors.bg},
    seperator = ' ',
    seperator_highlight = {colors.fg, colors.bg}
  }
}

-- Right side
gls.right[1] = {
  FileFormat = {
    provider = function() return vim.bo.filetype end,
    highlight = {colors.fg, colors.bg},
    separator = ' ',
    separator_highlight = {colors.fg, colors.bg}

  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    highlight = {colors.fg, colors.bg},
    separator = ' ',
    separator_highlight = {colors.fg, colors.bg}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider = 'BufferIcon',
    highlight = {colors.yellow, colors.bg},
    separator = ' ',
    separator_highlight = {colors.bg, colors.bg}
  }
}

gl.load_galaxyline()
