local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local w = library:CreateWindow("a")
local l = w:CreateFolder("A")

local enabled = false

l:Button("Delete killbricks",function()
for i,v in pairs(game.Workspace.Map:GetDescendants()) do
    if string.find(v.Name, "KillBrick") or string.find(v.Name, "KillFire") or string.find(v.Name, "Lava") then 
    for z,a in pairs(v:GetChildren()) do
        if a:IsA("TouchTransmitter") then 
            a:Destroy()
            print("gone")
        end
    end
    end
end 
end)

l:Button("Reset",function()
game.Players.LocalPlayer.Character.Head:Destroy()
end)

l:Button("Autopickup",function()
-- Wait for the game to be fully loaded
repeat
    task.wait()
until game:IsLoaded()

-- Get the local player
local Player = game:GetService("Players").LocalPlayer

-- Check if Player and Player.Character exist
assert(Player.Character, "Player must be spawned")

-- Function to handle clicking on trinkets
local function clickOnTrinket(trinket)
    pcall(function()
        if trinket:FindFirstChild("ClickPart") then
            task.wait(0.03)
            local clickPart = trinket.ClickPart:FindFirstChild("ClickDetector")
            if clickPart then
                fireclickdetector(clickPart, 25)
            end
        elseif trinket:FindFirstChild("ClickDetector") then
            fireclickdetector(trinket.ClickDetector, 25)
        end
    end)
end

-- Main loop to check for nearby trinkets and click them
pcall(function()
    coroutine.wrap(function()
        while task.wait(0.20) do
            pcall(function()
                local playerPosition = Player.Character:WaitForChild("HumanoidRootPart").Position
                for _, trinket in pairs(workspace.Trinkets:GetChildren()) do
                    local trinketPosition = trinket.Position
                    if (playerPosition - trinketPosition).Magnitude < 25 then
                        clickOnTrinket(trinket)
                    end
                end
            end)
        end
    end)()
end)
end)

l:Toggle("Tp Bypass (toggle while dead)",function(bool)
    enabled = bool
end)


local function getRandomCoordinate(min, max)
    return math.random(min, max)
end

local mapBounds = {
    xMin = -5000,
    xMax = 5000,
    yMin = 0,
    yMax = 500,
    zMin = -5000,
    zMax = 5000
}

game:GetService('RunService').Heartbeat:connect(function()
    if enabled == true then
        if game:GetService("Workspace").Live[game.Players.LocalPlayer.Name].CharacterHandler.Remotes:FindFirstChild("ApplyFallDamage") then
        game.Players.LocalPlayer.Character.CharacterHandler.Remotes.ApplyFallDamage.Name = "gg bro"
        print("done")
        end
        local randomX = getRandomCoordinate(mapBounds.xMin, mapBounds.xMax)
        local randomY = getRandomCoordinate(mapBounds.yMin, mapBounds.yMax)
        local randomZ = getRandomCoordinate(mapBounds.zMin, mapBounds.zMax)
        
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(randomX, randomY, randomZ)
        wait()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2855, 288, -92)

    end
end)
