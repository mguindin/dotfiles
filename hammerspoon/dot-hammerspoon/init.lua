-- ~/.hammerspoon/init.lua
hs.loadSpoon("Lunette")
spoon.Lunette:bindHotkeys()

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
  :disableForApp('Kitty')
  :disableForApp('Terminal')
  :disableForApp('PyCharm')
  :disableForApp('Intellij IDEA')
  :shouldDimScreenInNormalMode(true)
  :enterWithSequence('jk')
  :bindHotKeys({ enter = {{'ctrl'}, ';'} })

-- Basic key binding to ctrl+;
-- You can choose any key binding you want here, see:
--   https://www.hammerspoon.org/docs/hs.hotkey.html#bind
