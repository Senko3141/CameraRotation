-- CameraRotation.lua, 13/7/2020
-- Scripted by Sylvern.

local CameraModule = {}

local Rotations = {
	LeftRotation = false,
	RightRotation = false,
};

function CameraModule:SetupRotation(plr, camera)
	local Character = plr.Character
	local Humanoid = Character:WaitForChild('Humanoid')

	
	coroutine.wrap(function()
		local BV = Instance.new("BodyVelocity", Character.HumanoidRootPart)
		BV.Name = 'CharCusVelocity'
		BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		BV.Velocity = Vector3.new(0,0,0)
		
		Humanoid.AutoRotate = false
				
		camera.CameraType = Enum.CameraType.Scriptable
		camera.CFrame = CFrame.new((Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -8)).Position, Character.Head.Position)
		
		script:WaitForChild("DepthOfField"):Clone().Parent = camera
	end)()
	
end

function CameraModule:RotateLeft(plr, bool)
	local Character = plr.Character
	local RootPart = Character.PrimaryPart
	
	
	if bool == true then
		
		for i,v in pairs(Rotations) do
			if v == true then return end
		end
		
		Rotations.LeftRotation = true
		
		while Rotations.LeftRotation == true do
			if Rotations.LeftRotation == false then break end
			
			RootPart.CFrame = RootPart.CFrame * CFrame.Angles(0,math.rad(-3), 0)
			
			wait()
		end
	end
	
	if bool == false then
		Rotations.LeftRotation = false
	end
end

function CameraModule:RotateRight(plr, bool)
	local Character = plr.Character
	local RootPart = Character.PrimaryPart

	
	if bool == true then
		
		for i,v in pairs(Rotations) do
			if v == true then return end
		end
		
		Rotations.RightRotation = true
		
		while Rotations.RightRotation == true do
			if Rotations.RightRotation == false then break end
			
			RootPart.CFrame = RootPart.CFrame * CFrame.Angles(0,math.rad(3), 0)
			
			wait()
		end
	end
	
	if bool == false then
		Rotations.RightRotation = false
	end
end


return CameraModule
