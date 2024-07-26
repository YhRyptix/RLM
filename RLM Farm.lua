local TweenService = game:GetService("TweenService")

-- Function to handle teleportation
local function teleportPlayer(targetPosition, speed)
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    local distance = (humanoidRootPart.Position - targetPosition).Magnitude
    local tweenTime = speed * distance / 15
    local tweenData = TweenInfo.new(tweenTime, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(humanoidRootPart, tweenData, {CFrame = CFrame.new(targetPosition)})

    print(distance)
    humanoidRootPart.Anchored = true
    tween:Play()
    tween.Completed:Wait()
    task.wait()
    humanoidRootPart.Anchored = false
    print("Done")
    wait(0.7)
end
local speed = 0.1
---Tundra 2
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4007, 842, -963)
wait(2)
print("tundra 2")
local targetPosition = Vector3.new(3982, 439, -1015)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(4004.997559, 439.293915, -1014.699158)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(4032, 439, -1014)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(3935, 440, -1211)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(3820, 441, -1183)
teleportPlayer(targetPosition, speed)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3886, 628, -1344)
wait(1)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(3890, 625, -1385)
teleportPlayer(targetPosition, speed)
--game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-630, 119, 40731)---   NORPA BUGGED UNTIL FIX LATER ON
-------CRYPT INNER
print("IDK1")
wait(2)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(197, 70, -1937)
local targetPosition = Vector3.new(163, 56, -1928)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(163, 56, -1955)
teleportPlayer(targetPosition, speed)
wait(5)
print("IDK2")
----SUNKEN
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1134, 215, -3444)


local targetPosition = Vector3.new(1109.342163, 192.368149, -3517.325195)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(1103.433960, 192.368149, -3498.913330)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(1095.666504, 192.368149, -3477.281250)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(1113.384033, 192.368149, -3463.202881)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(1130.509888, 192.368149, -3489.632812)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(1084.352783, 192.368149, -3487.250244)
teleportPlayer(targetPosition, speed)

wait(2)
print("IDK3")
----FIRST LAYER
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1145, -240, -4576)
wait(2)
print("IDK4")
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1000, -456, -4330)
wait(2)
print("IDK5")
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(686, 111, -4596)
wait(2)
print("IDK6")
local targetPosition = Vector3.new(693, 111, -4625)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(666, 111, -4579)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(625, 69, -4539)
teleportPlayer(targetPosition, speed)
---Tundra 7
--wait(2)
-- game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4458, 1111, 1666)
-- local targetPosition = Vector3.new(4897, 1009, 1380)
-- teleportPlayer(targetPosition, speed)
-- local targetPosition = Vector3.new(4708, 689, 1747)
-- teleportPlayer(targetPosition, speed)
-- local targetPosition = Vector3.new(4736, 689, 1733)
-- teleportPlayer(targetPosition, speed)
-- local targetPosition = Vector3.new(4718, 689, 1711)
-- teleportPlayer(targetPosition, speed)
-- local targetPosition = Vector3.new(4654, 689, 1750)
-- teleportPlayer(targetPosition, speed)
-- local targetPosition = Vector3.new(4610, 689, 1715)
-- teleportPlayer(targetPosition, speed)
-- local targetPosition = Vector3.new(4729, 689, 1696)
-- teleportPlayer(targetPosition, speed)
-- local targetPosition = Vector3.new(4799, 689, 1648)
-- teleportPlayer(targetPosition, speed)
-- local targetPosition = Vector3.new(4721, 689, 1611)
-- teleportPlayer(targetPosition, speed)
-- local targetPosition = Vector3.new(4628, 689, 1579)
-- teleportPlayer(targetPosition, speed)
-- local targetPosition = Vector3.new(4635, 689, 1547)
-- teleportPlayer(targetPosition, speed)
-- local targetPosition = Vector3.new(4633, 689, 1611)
-- teleportPlayer(targetPosition, speed)
-- local targetPosition = Vector3.new(4747, 689, 1529)
-- teleportPlayer(targetPosition, speed)
-- local targetPosition = Vector3.new(4711, 689, 1537)
-- teleportPlayer(targetPosition, speed)
-- local targetPosition = Vector3.new(4811, 689, 1412)
-- teleportPlayer(targetPosition, speed)
-- local targetPosition = Vector3.new(4691, 689, 1400)
-- teleportPlayer(targetPosition, speed)
-- local targetPosition = Vector3.new(4626, 691, 1445)
-- teleportPlayer(targetPosition, speed)
-- local targetPosition = Vector3.new(4807, 689, 1409)
-- teleportPlayer(targetPosition, speed)

----Spy tower
wait(2)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-945, 706, 3011)
local targetPosition = Vector3.new(-1193, 865, 2681)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(-1209, 865, 2667)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(-1210, 865, 2610)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(-1193, 865, 2595)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(-1136, 865, 2594)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(-1121, 865, 2610)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(-1121, 865, 2667)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(-1138, 865, 2680)
teleportPlayer(targetPosition, speed) 
wait(2)
print("IDK100")
----SIGIL
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6648, 1507, 733)

local targetPosition = Vector3.new(6613, 1461, 468)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(6583, 1461, 498)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(6556, 1461, 470)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(6554, 1385, 479)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(6571, 1385, 497)
teleportPlayer(targetPosition, speed)


--tundra 5
wait(2)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6249, 1392, 74)
local targetPosition = Vector3.new(6315.582520, 1392.493652, 173.859833)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(6367.263672, 1411.493652, 127.623734)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(6313.219727, 1478.293823, 52.713943)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(6356.840820, 1478.293823, 52.496460)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(6356.194336, 1478.293701, -251.951767)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(6336.087891, 1402.493652, -244.782333)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(6323.304688, 1402.293823, -198.430206)
teleportPlayer(targetPosition, speed)

local targetPosition = Vector3.new(6367.941406, 1402.293823, -210.579376)
teleportPlayer(targetPosition, speed)

local targetPosition = Vector3.new(6496.909180, 1402.293823, -209.766922)
teleportPlayer(targetPosition, speed)


local targetPosition = Vector3.new(6517.868164, 1405.294067, -247.309448)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(6525.713867, 1378.293457, -255.790070)
teleportPlayer(targetPosition, speed)
--------------------------------


wait(2)
print("IDK133")
--LAB
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4904, 480, 1711)
local targetPosition = Vector3.new(4866.918945, 473.957062, 1660.181519)
teleportPlayer(targetPosition, speed)

local targetPosition = Vector3.new(4878.226074, 475.148499, 1637.887695)
teleportPlayer(targetPosition, speed)

wait(2)
print("IDK134")
---CR
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4872, 468, 1468)
local targetPosition = Vector3.new(4874.949707, 495.450226, 921.373840)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(4824.411133, 525.950195, 833.054321)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(4831.343262, 549.950195, 752.862610)
teleportPlayer(targetPosition, speed)
wait(1)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4921, 581, 721)
local targetPosition = Vector3.new(4885.691406, 548.950256, 777.047302)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(4923.971680, 580.950317, 722.777405)
teleportPlayer(targetPosition, speed)
wait(1)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5330, 422, 640)
local targetPosition = Vector3.new(5811.817383, 415.934387, 640.705322)
teleportPlayer(targetPosition, speed)
wait(2)
local targetPosition = Vector3.new(5789.40137, 410.392822, 640.246948)
teleportPlayer(targetPosition, speed)
wait()
---CR LOOT ROOM
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5802, 327, 620)
wait(2)

local targetPosition = Vector3.new(5740.885742, 321.553864, 645.985168)
teleportPlayer(targetPosition, speed)
wait(0.5)
local targetPosition = Vector3.new(5740.620605, 321.553894, 629.594238)
teleportPlayer(targetPosition, speed)
wait(0.5)
local targetPosition = Vector3.new(5753.525391, 321.553833, 610.179199)
teleportPlayer(targetPosition, speed)
wait(0.5)
local targetPosition = Vector3.new(5766.655762, 321.553894, 610.180359)
teleportPlayer(targetPosition, speed)
wait(0.5)
---- DONE CR LOOT ROOM
wait(2)



game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5798.93799, 328.580139, 633.944214)
wait(1)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2641, 604, 30)
local targetPosition = Vector3.new(-2690.820068, 608.055054, 105.046471)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(-2653.057129, 608.055054, 116.929634)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(-2731.829346, 638.508118, 279.334106)
teleportPlayer(targetPosition, speed)

game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(553, 179, -1171)
wait(2)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1217, 152, -3647)
local targetPosition = Vector3.new(1269.569458, 168.368149, -3702.002441)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(1230.655762, 171.368118, -3743.376953)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(1184.230957, 175.368149, -3706.595215)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(1347.762329, 185.368149, -3347.282227)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(901.502380, 664.568665, -4064.517578)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(949.851685, 664.568115, -4066.795654)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(927.343201, 664.568115, -4068.984131)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(1323.786621, 426.136780, -4117.752441)
teleportPlayer(targetPosition, speed)
wait(2)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-67, 3639, 365)
local targetPosition = Vector3.new(-54.510181, 3638.889648, 387.565491)
teleportPlayer(targetPosition, speed)
local targetPosition = Vector3.new(-78.630043, 3638.889893, 390.364990)
teleportPlayer(targetPosition, speed)
wait(1)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4903, 1009, 1375)
wait(1)
-- Set CanCollide to true for all children of Workspace.Trinkets
for _, trinket in pairs(game.Workspace.Trinkets:GetChildren()) do
    trinket.CanCollide = true
end

wait() -- Wait for a short period

-- Create a new anchored part in Workspace
local part = Instance.new("Part")
part.Parent = game.Workspace
part.Anchored = true
part.Name = "REALONE"
part.CFrame = CFrame.new(4602, 686.889893, 1656, 0.999986768, -1.30806648e-05, -0.00514548831, 1.39371441e-05, 1, 0.000166416779, 0.00514548598, -0.000166486279, 0.999986768)
part.Size = Vector3.new(450, 3, 450)

wait() -- Wait for a short period

-- Retrieve touching parts and rename them if they are trinkets
local touchingParts = part:GetTouchingParts()
for _, touchingPart in pairs(touchingParts) do
    if touchingPart:IsDescendantOf(game.Workspace.Trinkets) then
        touchingPart.Name = "TrinketTouched"
    end
end

wait() -- Wait for a short period

-- Destroy the created part
part:Destroy()

wait(1)

local player = game.Players.LocalPlayer -- Assuming this script runs on the client-side

-- Function to teleport the player to a target position
function teleportPlayer(targetPosition)
    player.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
end

-- Function to find all "TrinketTouched" parts and teleport to each one
function teleportToTrinkets()
    while true do
        -- Find all "TrinketTouched" parts
        local trinkets = game.Workspace.Trinkets:GetChildren()
        local foundTrinkets = false
        
        for _, trinket in pairs(trinkets) do
            if trinket.Name == "TrinketTouched" then
                foundTrinkets = true
                local targetPosition = trinket.Position + Vector3.new(0, 5, 0) -- Offset to avoid collisions
                teleportPlayer(targetPosition)
                wait(1) -- Adjust this wait time as needed to allow the player to pick up the trinket
                break
            end
        end
        
        if not foundTrinkets then
            break -- Exit the loop if no "TrinketTouched" parts are found
        end
        
        wait(0.1) -- Small delay to avoid potential infinite loops
    end
end

teleportToTrinkets()
print("Done")
wait(1)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2855, 288, -92)
