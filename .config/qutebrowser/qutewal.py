# https://gitlab.com/jjzmajic/qutewal

import json
import os

qutewal_dynamic_loading = False

home = os.getenv('HOME')
colors_relative = '.config/qutebrowser/colors.json'
colors_absolute = os.path.join(home, colors_relative)

if os.path.isfile(colors_absolute):
    with open(colors_absolute) as colorfile:
        colors = json.load(colorfile)
        cursor = colors['special']['cursor']
        background = colors['special']['background']
        foreground = colors['special']['foreground']
        black = colors['colors']['color0']
        white = colors['colors']['color7']
        gray = colors['colors']['color8']
        red = colors['colors']['color1']
        green = colors['colors']['color2']
        yellow = colors['colors']['color3']
        blue = colors['colors']['color4']
        magenta = colors['colors']['color5']
        cyan = colors['colors']['color6']

    c.colors.completion.category.bg = gray
    c.colors.completion.category.fg = background
    c.colors.completion.category.border.top = gray
    c.colors.completion.category.border.bottom = gray
    c.colors.completion.odd.bg = background
    c.colors.completion.even.bg = background
    c.colors.completion.match.fg = red
    c.colors.completion.fg = foreground
    c.colors.completion.item.selected.bg = blue
    c.colors.completion.item.selected.fg = background
    c.colors.completion.item.selected.border.top = background
    c.colors.completion.item.selected.border.bottom = background
    c.colors.completion.item.selected.match.fg = background
    c.colors.completion.scrollbar.bg = gray
    c.colors.completion.scrollbar.fg = green

    c.colors.downloads.stop.bg = blue
    c.colors.downloads.stop.fg = background
    c.colors.downloads.error.bg = red
    c.colors.downloads.error.fg = background
    c.colors.downloads.start.bg = green
    c.colors.downloads.start.fg = background
    c.colors.downloads.system.bg = 'none'
    c.colors.downloads.bar.bg = background

    c.colors.hints.bg = yellow
    c.colors.hints.fg = background
    c.colors.hints.match.fg = blue

    c.colors.keyhint.bg = background
    c.colors.keyhint.fg = foreground
    c.colors.keyhint.suffix.fg = yellow

    c.colors.messages.error.bg = red
    c.colors.messages.error.border = red
    c.colors.messages.error.fg = background
    c.colors.messages.info.bg = blue
    c.colors.messages.info.border = blue
    c.colors.messages.info.fg = background
    c.colors.messages.warning.bg = red
    c.colors.messages.warning.border = red
    c.colors.messages.warning.fg = background

    c.colors.prompts.bg = background
    c.colors.prompts.fg = foreground
    c.colors.prompts.selected.bg = magenta
    c.colors.prompts.border = '1px solid ' + gray

    c.colors.statusbar.caret.bg = cyan
    c.colors.statusbar.caret.fg = background
    c.colors.statusbar.caret.selection.bg = cyan
    c.colors.statusbar.command.bg = background
    c.colors.statusbar.command.fg = foreground
    c.colors.statusbar.command.private.bg = background
    c.colors.statusbar.command.private.fg = foreground
    c.colors.statusbar.insert.fg = background
    c.colors.statusbar.insert.bg = green
    c.colors.statusbar.normal.bg = background
    c.colors.statusbar.normal.fg = foreground
    c.colors.statusbar.passthrough.bg = blue
    c.colors.statusbar.passthrough.fg = background
    c.colors.statusbar.private.bg = background
    c.colors.statusbar.private.fg = foreground
    c.colors.statusbar.progress.bg = foreground
    c.colors.statusbar.url.warn.fg = red
    c.colors.statusbar.url.error.fg = red
    c.colors.statusbar.url.fg = foreground
    c.colors.statusbar.url.hover.fg = blue
    c.colors.statusbar.url.success.http.fg = foreground
    c.colors.statusbar.url.success.https.fg = gray

    c.colors.tabs.bar.bg = background
    c.colors.tabs.odd.bg = background
    c.colors.tabs.odd.fg = foreground
    c.colors.tabs.even.bg = background
    c.colors.tabs.even.fg = foreground
    c.colors.tabs.indicator.error = red
    c.colors.tabs.indicator.system = 'none'
    c.colors.tabs.selected.odd.bg = foreground
    c.colors.tabs.selected.odd.fg = background
    c.colors.tabs.selected.even.bg = foreground
    c.colors.tabs.selected.even.fg = background

    c.colors.webpage.bg = white
