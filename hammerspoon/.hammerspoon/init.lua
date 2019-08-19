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
