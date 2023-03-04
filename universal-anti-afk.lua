
-- Anti-AFK by Shiawase#0001 (Works on 98% of games!)

---------------- SCRIPTS ------------------------------

local t = type or typeof -- idk doesnt matter
local s = string -- useless 
local SG = game:GetService("StarterGui") -- No need for cloning refrences, its primary
function Notify(ti,tx,b1,d)
    SG:SetCore("SendNotification", {
           Title = tostring(ti),
           Text = tostring(tx),
           Button1 = tostring(b1),
           Duration = tonumber(d)
       })
   end

   --Check if getgenv/variables r set correctly or exist at all
if s.lower(t(getgenv().delay)) ~= "number" or s.lower(t(getgenv().status)) ~= "boolean" or s.lower(t(getgenv().preformance)) ~= "boolean"then
    Notify("ERROR","Variables weren't set correctly! Please fix & re-run!","Okay",math.huge)
    return
end

if getgenv().onlyonerun ~= true then
   print("1st Run")
 else
   getgenv().onlyonerun = false -- no need to fill up mem
   print("Udjustment")
end -- no need for explanation
if not cloneref then
    Notify("WARNING","Exploit doesn't support cloneref, attempting to create a duplicate of it!","Okay",3)
    -- dooplicate!!
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/CloneRef.lua", true))() -- returned is getgenv().cloneref
end
-- Above was async code, so if not found AGAIN.
if not getgenv().cloneref then
    Notify("ERROR","Couldn't duplicate cloneref, please get a better exploit LOL.","100% Will do",math.huge)
    return
end


-- The real code here.

-- SET VARIABLES/GLOBALS
local VIM = cloneref(game:GetService("VirtualInputManager"))
game:GetService("RunService"):Set3dRenderingEnabled(not getgenv().preformance) -- Me on opposite day XD!

-- LOOPING SCRIPT (THE ENTIRE THING)
if getgenv().onlyonerun ~= true then
    getgenv().onlyonerun = true -- hi
    Notify("Success","Anti-AFK by Shiawase#0001 ran | Status: "..tostring(getgenv().status).." | Delay: "..tostring(getgenv().delay).." | Preformance Mode: "..tostring(getgenv().preformance),"Got It!",math.huge) -- creds
    while true and wait(tonumber(getgenv().delay)) and getgenv().status == true do
        VIM:SendKeyEvent(true,getgenv().keycode,false,game)
        wait(math.random(.15,.25))
        VIM:SendKeyEvent(false,getgenv().keycode,false,game)
    end
elseif getgenv().onlyonerun == true then
    Notify("Success","Anti-AFK by Shiawase#0001 updated | Status: "..tostring(getgenv().status).." | Delay: "..tostring(getgenv().delay).." | Preformance Mode: "..tostring(getgenv().preformance),"Got It!",math.huge) -- upd
end
