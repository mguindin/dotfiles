-- ~/.hammerspoon/init.lua

local VimMode = hs.loadSpoon('VimMode')
local vim = VimMode:new()

hs.loadSpoon("ShiftIt")
spoon.ShiftIt:bindHotkeys({})
spoon.ShiftIt:bindHotkeys({
  left = {{ 'alt', 'cmd' }, 'left' },
  right = {{ 'alt', 'cmd' }, 'right' },
  up = {{ 'ctrl', 'alt', 'cmd' }, 'up' },
  down = {{ 'ctrl', 'alt', 'cmd' }, 'down' },
  upleft = {{ 'ctrl', 'alt', 'cmd' }, '1' },
  upright = {{ 'ctrl', 'alt', 'cmd' }, '2' },
  botleft = {{ 'ctrl', 'alt', 'cmd' }, '3' },
  botright = {{ 'ctrl', 'alt', 'cmd' }, '4' },
  maximum = {{ 'alt', 'cmd' }, 'f' },
  toggleFullScreen = {{ 'ctrl', 'alt', 'cmd' }, 'f' },
  toggleZoom = {{ 'ctrl', 'alt', 'cmd' }, 'z' },
  center = {{ 'ctrl', 'alt', 'cmd' }, 'c' },
  nextScreen = {{ 'ctrl', 'alt', 'cmd' }, 'n' },
  previousScreen = {{ 'ctrl', 'alt', 'cmd' }, 'p' },
  resizeOut = {{ 'ctrl', 'alt', 'cmd' }, '=' },
  resizeIn = {{ 'ctrl', 'alt', 'cmd' }, '-' }
});

vim
  :disableForApp('Code')
  :disableForApp('VSCodium')
  :disableForApp('MacVim')
  :disableForApp('zoom.us')
  :disableForApp('iTerm')
  :disableForApp('MacVim')
  :disableForApp('Alacritty')
  :disableForApp('kitty')
  :disableForApp('Terminal')
  :disableForApp('Quiver')
  :disableForApp('PyCharm')
  :disableForApp('Intellij IDEA')
  :shouldDimScreenInNormalMode(true)
  :enterWithSequence('jk')
  :bindHotKeys({ enter = {{'ctrl'}, ';'} })

-- Basic key binding to ctrl+;
-- You can choose any key binding you want here, see:
--   https://www.hammerspoon.org/docs/hs.hotkey.html#bind
