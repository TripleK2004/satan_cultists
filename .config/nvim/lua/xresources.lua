--[[https://github.com/nekonako/xresources-nvim]]--

local function get_xresources_color (c)
   local command = io.popen('xrdb -query | grep ' .. c .. ' -m 1 | cut -f 2')
   local color = command:read("*l")
   return color
end

local function get_lighter_color(c, hex)
   local before_color = get_xresources_color(c)
   local t = tostring(before_color)
   local s = string.sub(t, 2, 7)
   local after_color = tonumber('0x' .. s) + hex
   local final_color = "#" .. string.format("%x", after_color)
   return final_color
end

local function get_darker_color(c, hex)
   local before_color = get_xresources_color(c)
   local t = tostring(before_color)
   local s = string.sub(t, 2, 7)
   local after_color = tonumber('0x' .. s) - hex
   local final_color = "#" .. string.format("%x", after_color)
   return final_color
end

local xresources = {
   fg = get_xresources_color('foreground');
   bg = get_xresources_color('background');
   black = get_xresources_color('color0');
   red = get_xresources_color('color1');
   green = get_xresources_color('color2');
   yellow =get_xresources_color('color3');
   blue = get_xresources_color('color4');
   purple = get_xresources_color('color5'),
   cyan = get_xresources_color('color6');
   white = get_xresources_color('color7');
   light_black = get_xresources_color('color8');
   light_red = get_xresources_color('color9');
   light_green = get_xresources_color('color10');
   light_yellow = get_xresources_color('color11');
   light_blue = get_xresources_color('color12');
   light_purple = get_xresources_color('color13');
   light_cyan = get_xresources_color('color14');
   light_white = get_xresources_color('color15');
   grey = vim.o.background == 'light' and get_darker_color('background', 0xf0f10) or get_lighter_color('background', 0xf0f10);
   grey1 = vim.o.background == 'light' and get_darker_color('background', 0x363940) or get_lighter_color('background', 0x363940);
   none = 'NONE';
}

function xresources.terminal_color()
   vim.g.terminal_color_0 = xresources.bg
   vim.g.terminal_color_1 = xresources.red
   vim.g.terminal_color_2 = xresources.green
   vim.g.terminal_color_3 = xresources.yellow
   vim.g.terminal_color_4 = xresources.blue
   vim.g.terminal_color_5 = xresources.purple
   vim.g.terminal_color_6 = xresources.cyan
   vim.g.terminal_color_7 = xresources.fg
   vim.g.terminal_color_8 = xresources.bg
   vim.g.terminal_color_9 = xresources.red
   vim.g.terminal_color_10 = xresources.green
   vim.g.terminal_color_11 = xresources.yellow
   vim.g.terminal_color_12 = xresources.blue
   vim.g.terminal_color_13 = xresources.purple
   vim.g.terminal_color_14 = xresources.cyan
   vim.g.terminal_color_15 = xresources.fg
end

function xresources.highlight(group, color)
   local style = color.style and 'gui=' .. color.style or 'gui=NONE'
   local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
   local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
   local sp = color.sp and 'guisp=' .. color.sp or ''
   vim.api.nvim_command('highlight ' .. group .. ' ' .. style .. ' ' .. fg ..
      ' ' .. bg..' '..sp)
end

function xresources.load_syntax()
   local syntax = {

      Boolean = {fg=xresources.yellow};
      Comment = {fg=xresources.grey};
      Constant = {fg=xresources.cyan};
      Character = {fg=xresources.green};
      Conditional = {fg=xresources.purple};
      Debug = {};
      Define = {fg=xresources.purple};
      Delimiter = {};
      Error = {fg=xresources.red};
      Exception = {fg=xresources.purple};
      Float = {fg=xresources.yellow};
      Function = {fg=xresources.blue};
      Identifier = {fg=xresources.red};
      Ignore = {};
      Include = {fg=xresources.blue};
      Keyword = {fg=xresources.red};
      Label = {fg=xresources.purple};
      Macro = {fg=xresources.purple};
      Number = {fg=xresources.yellow};
      Operator = {fg=xresources.purple};
      PreProc = {fg=xresources.yellow};
      PreCondit = {fg=xresources.yellow};
      Repeat = {fg=xresources.purple};
      Statement = {fg=xresources.purple};
      StorageClass = {fg=xresources.yellow};
      Special = {fg=xresources.blue};
      SpecialChar = {fg=xresources.yellow};
      Structure = {fg=xresources.yellow};
      String = {fg=xresources.green};
      SpecialComment = {fg=xresources.grey1};
      Tag ={};
      Typedef = {fg=xresources.yellow};
      Type = {fg=xresources.yellow};
      Todo = {fg=xresources.purple};
      Underlined = {fg=xresources.none,style='underline'};

      ColorColumn = {fg=xresources.none,bg=xresources.grey};
      Conceal = {};
      Cursor = {fg=xresources.bg,bg=xresources.blue};
      CursorColumn = {fg=xresources.none,bg=xresources.grey};
      CursorIM = {fg=xresources.none,bg=xresources.none,style='reverse'};
      CursorLine = {fg=xresources.none,bg=xresources.none};
      Directory = {fg=xresources.blue,bg=xresources.none};
      DiffAdd = {fg=xresources.bg,bg=xresources.green};
      DiffChange = {fg=xresources.none,bg=xresources.yellow,style='underline'};
      DiffDelete = {fg=xresources.bg,bg=xresources.red};
      DiffText = {fg=xresources.bg,bg=xresources.yellow};
      EndOfBuffer = {fg=xresources.bg,bg=xresources.none};
      ErrorMsg = {fg=xresources.red,bg=xresources.none,style='bold'};
      VertSplit = {fg=xresources.grey,bg=xresources.grey};
      Folded = {fg=xresources.grey,bg=xresources.grey};
      FoldColumn = {};
      IncSearch = {fg=xresources.grey,bg=xresources.yellow,style=xresources.none};
      LineNr = {fg=xresources.grey1};
      CursorLineNr = {fg=xresources.grey,bg=xresources.grey1};
      MatchParen = {fg=xresources.blue,bg=xresources.none};
      ModeMsg = {};
      MoreMsg = {};
      NonText = {fg=xresources.grey};
      Normal = {fg = xresources.none,bg=xresources.none};
      Pmenu = {fg=xresources.fg,bg=xresources.grey};
      PmenuSel = {fg=xresources.grey,bg=xresources.blue};
      PmenuSelBold = {fg=xresources.grey,g=xresources.blue};
      PmenuSbar = {fg=xresources.none,bg=xresources.grey};
      PmenuThumb = {bg=xresources.green};
      Question = {fg=xresources.purple};
      QuickFixLine = {fg=xresources.black,bg=xresources.yellow,style='bold'};
      Search = {fg=xresources.bg,bg=xresources.yellow};
      SpecialKey = {fg=xresources.grey};
      SpellBad = {fg=xresources.red,bg=xresources.none,style='undercurl'};
      SpellCap = {fg=xresources.yellow,bg=xresources.none,style='undercurl'};
      SpellLocal = {fg=xresources.yellow,bg=xresources.none,style='undercurl'};
      SpellRare = {fg=xresources.yellow,bg=xresources.none,style = 'undercurl'};
      StatusLine = {fg=xresources.fg,bg=xresources.grey};
      StatusLineExtra = {fg=xresources.bg,bg=xresources.fg};
      StatuslineAccent = {fg=xresources.bg,bg=xresources.blue};
      StatuslineInsertAccent = {fg=xresources.bg,bg=xresources.green};
      StatuslineVisualAccent = {fg=xresources.bg,bg=xresources.purple};
      StatuslineSelect = {fg=xresources.bg,bg=xresources.red};
      StatuslineReplaceAccent = {fg=xresources.bg,bg=xresources.red};
      StatuslineCmdLineAccent = {fg=xresources.bg,bg=xresources.yellow};
      StatuslineTerminalAccent = {fg=xresources.bg,bg=xresources.cyan};
      StatusLineNC = {fg=xresources.grey,bg=xresources.grey};
      StatusLineTerm = {fg=xresources.light_red,bg=xresources.grey};
      StatusLineTermNC = {fg=xresources.light_red};
      TabLine = {fg=xresources.grey};
      TabLineFill = {};
      TabLineSel = {bg=xresources.bg};
      Terminal = {fg = xresources.fg,bg=xresources.bg};
      Title = {fg=xresources.green};
      Visual = {fg=xresources.none,bg=xresources.grey1};
      VisualNOS = {fg=xresources.grey,bg=xresources.fg};
      WarningMsg = {fg=xresources.yellow};
      WildMenu = {fg=xresources.bg,bg=xresources.blue};

      netrwDir = {fg=xresources.fg};
      netrwPlain = {fg=xresources.blue};
      netrwSlash = {fg=xresources.purple};

    }
   return syntax
end

function xresources.load_plugin_syntax()
   local plugin_syntax = {

    markdownBlockquote = {fg=xresources.grey};
    markdownBold = {fg=xresources.yellow,style='bold'};
    markdownBoldItalic = {fg=xresources.green,style='bold,italic'};
    markdownCode = {fg=xresources.green};
    markdownCodeBlock = {fg=xresources.green};
    markdownCodeDelimiter = {fg=xresources.green};
    markdownH1 = {fg=xresources.red};
    markdownH2 = {fg=xresources.red};
    markdownH3 = {fg=xresources.red};
    markdownH4 = {fg=xresources.red};
    markdownH5 = {fg=xresources.red};
    markdownH6 = {fg=xresources.red};
    markdownHeadingDelimiter = {fg=xresources.red};
    markdownHeadingRule = {fg=xresources.grey};
    markdownId = {fg=xresources.purple};
    markdownIdDeclaration = {fg=xresources.red};
    markdownIdDelimiter = {fg=xresources.purple};
    markdownItalic = {fg=xresources.purple};
    markdownLinkDelimiter = {fg=xresources.purple};
    markdownLinkText = {fg=xresources.blue};
    markdownListMarker = {fg=xresources.red};
    markdownOrderedListMarker = {fg=xresources.red};
    markdownRule = {fg=xresources.grey};
    markdownUrl = {fg=xresources.cyan};

    }
   return plugin_syntax
end
local async_load_plugin

async_load_plugin = vim.loop.new_async(vim.schedule_wrap(function ()
   xresources.terminal_color()
   local syntax = xresources.load_plugin_syntax()
   for group,colors in pairs(syntax) do
      xresources.highlight(group,colors)
   end
   async_load_plugin:close()
end))

function xresources.colorscheme()
   vim.api.nvim_command('hi clear')
   if vim.fn.exists('syntax_on') then
      vim.api.nvim_command('syntax reset')
   end
   vim.o.termguicolors = true
   --vim.g.colors_name = 'xresources'
   local syntax = xresources.load_syntax()
   for group,colors in pairs(syntax) do
      xresources.highlight(group,colors)
   end
   async_load_plugin:send()
end

xresources.colorscheme()

return xresources
