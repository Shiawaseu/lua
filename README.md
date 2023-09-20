****Bunch of random stuff I work on, nothing big****

# Servicebypasser
 - use for autofarms or whatever, undetected btw
```lua
-- load 
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/shiawaseu/lua/main/servicebypasser.lua", true))()

-- usage
local VIM = library.New("VirtualInputManager")
print(VIM)
```
# SimpleAimlock
```lua
-- You can set some of those later on.
getgenv().options = {
    aim = true,-- status
    aimpart = "Head", -- Default part to use
    teamcheck = false, -- teamcheck
    aimkey = Enum.UserInputType.MouseButton2, -- To aim key
    partswitchkey = Enum.KeyCode.Q, -- To change parts key
    fov = 100, -- You are required to set this even if ur not using FOV circle
    fovcircle = true, -- Circle yes or no
    color = Color3.fromRGB(255,0,0), -- Color
    prediction = {0,0}, -- Left-Right/Up-Down prediction, if you can't set this up you need to retake 5th grade math.
    streamermode = false -- Disable/Enable Notifications
}
-- load 
loadstring(game:HttpGet("https://raw.githubusercontent.com/shiawaseu/lua/main/SimpleAimlock.lua", true))()

```
# myhwid
 - meant to debug whitelist errors, returns the name of the fingerprint and it's value
```lua
local data = loadstring(game:HttpGet("https://raw.githubusercontent.com/shiawaseu/lua/main/myhwid.lua", true))()
-- usage
print(string.format("Your %s is %s", data.type, data.hwid))
```
