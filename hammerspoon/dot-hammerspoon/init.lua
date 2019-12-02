-- ~/.hammerspoon/init.lua
hs.loadSpoon("Lunette")
spoon.Lunette:bindHotkeys()

-- Check WIFI connection.
-- Return current WIFI COnnection
function openCloseCisco()
  print(hs.wifi.currentNetwork())
  if hs.wifi.currentNetwork() == "wpa2" then
    if hs.application.find("Cisco AnyConnect") == nil then
      print "cisco not running"
    else
        hs.application.find("Cisco AnyConnect"):kill()
    end
  end
end

function watchEvents()
  local pow = hs.caffeinate.watcher
  local function on_pow(event)
  local name = "?"
  for key,val in pairs(pow) do
    if event == val then name = key end
  end
  if event == pow.systemDidWake
  then
    print("awake!")
    openCloseCisco()
    return
   end
  end
  pow.new(on_pow):start()
end

-- Start It
watchEvents()

vim = hs.loadSpoon('VimMode')

-- Basic key binding to ctrl+;
-- You can choose any key binding you want here, see:
--   https://www.hammerspoon.org/docs/hs.hotkey.html#bind

hs.hotkey.bind({'ctrl'}, ';', function()
  vim:enter()
end)

vim:enterWithSequence('jk')
vim:enterWithSequence('jj')
vim:shouldDimScreenInNormalMode(true)
-- sometimes you need to check Activity Monitor to get the app's
-- real name
vim:disableForApp('Code')
vim:disableForApp('iTerm')
vim:disableForApp('MacVim')
vim:disableForApp('Alacritty')
vim:disableForApp('Kitty')
vim:disableForApp('Terminal')
vim:disableForApp('PyCharm')
vim:disableForApp('Intellij IDEA')
