-- This code was generated using Luadeck™ | A Project by @shiawaseu

-- originally made in half an hour, expect lots of bugs.


local players = game:GetService("Players")
local player = players.LocalPlayer
local mouse = player:GetMouse()
local camera = game:GetService("Workspace").CurrentCamera
local ispress = false
local rotation = 1

-- Adjust this table to add/remove parts from rotation
-- Just letting you know ur console is getting spammed if you set wrong parts. Default R6 parts
local parts = {
	"Head",
	"Torso",
	"HumanoidRootPart",
	"LeftArm",
	"RightArm"
}


local function settings(option)
	return getgenv().options[option]
end


local function update(option, newvalue)
	getgenv().options[option] = newvalue
end


local function Notify(ti, tx, b1, d)
	if not settings("streamermode") then
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = tostring(ti),
			Text = tostring(tx),
			Button1 = tostring(b1),
			Duration = tonumber(d),
          -- Icon = "rbxassetid://13945316235" didn't work 
		})
	end
end


local function rotate()

	if rotation >= 5 then -- add/rem based on parts set
		rotation = 1
	end

	local part = parts[rotation]
	rotation += 1

	return part
end

local function closesttocursor()
	local closestPlayer, closestDistance
	local mousePosition = Vector2.new(mouse.X, mouse.Y)
	for _, v in ipairs(players:GetPlayers()) do
		if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and ((settings("teamcheck") and v.Team ~= player.Team) or (not settings("teamcheck"))) then
			local screenPosition = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
			local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - mousePosition).magnitude
			if distance <= settings("fov") then
				if not closestDistance or distance < closestDistance then
					closestPlayer = v
					closestDistance = distance
				end
			end
		end
	end
	return {
		player = closestPlayer,
		distance = closestDistance
	}
end

local function fovcircle()
	local fovCircle = Drawing.new("Circle")
	fovCircle.Visible = false
	fovCircle.Radius = settings("fov")
	fovCircle.Thickness = 1
	fovCircle.Transparency = 1
	fovCircle.Color = settings("color")
	while true and task.wait() do
		if mouse.Target and mouse.Target:IsDescendantOf(workspace) then
			fovCircle.Position = Vector2.new(mouse.X, mouse.Y)
			fovCircle.Visible = settings("fovcircle")
		else
			fovCircle.Visible = false
		end
	end
end


task.spawn(fovcircle)

local function LockCameraOnPlayer()
	local targetPlayer = closesttocursor().player
	if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
		local part = settings("aimpart")
		local targetPosition = targetPlayer.Character[part].Position
		local prediction = settings("prediction")
		local cameraLookAt = targetPosition + Vector3.new(prediction[1], prediction[2], 0) -- prediction
		camera.CFrame = CFrame.lookAt(camera.CFrame.Position, cameraLookAt)
	end
end


local function OnKeyDown(inputObject, isProcessed)

	if inputObject.KeyCode == settings("aimkey") then
		ispress = true
	end
	if inputObject.UserInputType == settings("aimkey") then
		ispress = true
	end
end

local function OnKeyUp(inputObject, isProcessed)

	if inputObject.KeyCode == settings("aimkey") then
		ispress = false
	end

	if inputObject.UserInputType == settings("aimkey") then
		ispress = false
	end

	if inputObject.KeyCode == settings("partswitchkey") then
		local newpart = rotate()
		update("aimpart", newpart)
		Notify("Success", "Now locking on:" .. newpart, "k bro", 3)
	end

	if inputObject.UserInputType == settings("partswitchkey") then
		local newpart = rotate()
		update("aimpart", newpart)
		Notify("Success", "Now locking on:" .. newpart, "k bro", 3)
	end

end


game:GetService("UserInputService").InputBegan:Connect(OnKeyDown)
game:GetService("UserInputService").InputEnded:Connect(OnKeyUp)

local function main()
	if ispress and settings("aim") then
		LockCameraOnPlayer()
	end
end

game:GetService("RunService"):BindToRenderStep("main", 1, main)

Notify("Success", "Aimlock loaded.", "k thx :3", 3)
