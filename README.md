****Bunch of random stuff I work on, nothing big****

# SimpleAimlock
 - Doesn't support team check
```lua
-- You can set some of those later on.
getgenv().options = {
    aim = true,-- status
    aimpart = "Head", -- Default part to use
    aimkey = Enum.UserInputType.MouseButton2, -- To aim key
    partswitchkey = Enum.KeyCode.Q, -- To change parts key
    fov = 100, -- You are required to set this even if ur not using FOV circle
    fovcircle = true, -- Circle yes or no
    color = Color3.fromRGB(255,0,0), -- Color
    prediction = {0,0}, -- Left-Right/Up-Down prediction, if you can't set this up you need to retake 5th grade math.
    streamermode = false -- Disable/Enable Notifications
}
-- load 
loadstring(game:HttpGet("https://raw.githubusercontent.com/MEMEZNUT999/lua/main/SimpleAimlock.lua", true))()

```
# myhwid
 - meant to debug whitelist errors, returns the name of the fingerprint and it's value
```lua
local data = loadstring(game:HttpGet("https://raw.githubusercontent.com/MEMEZNUT999/lua/main/myhwid.lua", true))()
-- usage
print(string.format("Your %s is %s", data.type, data.hwid))
```
 # **Universal Anti Afk Script**
```lua
---------------- CONFIG -------------------------------
getgenv().delay = 5 -- [Delay between actions]
getgenv().status = true -- [true = ON | flase = OFF]
getgenv().keycode = 32 -- [DEFAULT IS 32 SPACE) Keycodes: https://create.roblox.com/docs/reference/engine/enums/KeyCode
getgenv().preformance = false -- [true = save preformance | false = vice versa]

loadstring(game:HttpGet("https://raw.githubusercontent.com/MEMEZNUT999/lua/main/universal-anti-afk.lua", true))()
```
