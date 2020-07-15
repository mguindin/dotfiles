hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.repos.ShiftIt = {
  url = "https://github.com/peterklijn/hammerspoon-shiftit",
  desc = "ShiftIt spoon repository",
  branch = "master",
}

spoon.SpoonInstall:andUse("ShiftIt", { repo = "ShiftIt" })

spoon.ShiftIt:bindHotkeys({})
spoon.ShiftIt:bindHotkeys({
    left = {{ 'alt', 'cmd' }, 'left' },
    right = {{ 'alt', 'cmd' }, 'right' },
    maximum = {{ 'alt', 'cmd' }, 'f' },
    toggleFullScreen = {{ 'alt', 'cmd' }, 'm' },
    toggleZoom = {{ 'alt', 'cmd' }, 'z' },
    center = {{ 'alt', 'cmd' }, 'c' },
    nextScreen = {{ 'alt', 'cmd' }, 'n' },
    previousScreen = {{ 'alt', 'cmd' }, 'p' },
    resizeOut = {{ 'alt', 'cmd' }, '=' },
    resizeIn = {{ 'alt', 'cmd' }, '-' }
  });

local VimMode = hs.loadSpoon('VimMode')
local vim = VimMode:new()

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
:disableForApp('Joplin')
:disableForApp('PyCharm')
:disableForApp('Intellij IDEA')
:disableForApp('Alfred')
:shouldDimScreenInNormalMode(true)
:enterWithSequence('jk')
:bindHotKeys({ enter = {{'ctrl'}, ';'} })

-- Basic key binding to ctrl+;
-- You can choose any key binding you want here, see:
--   https://www.hammerspoon.org/docs/hs.hotkey.html#bind
