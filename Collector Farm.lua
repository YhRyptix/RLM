-- Wait for game to load
if not game:IsLoaded() then
    game.Loaded:Wait()
end
wait(1)

-- Load UI library
local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3'))()
local collectorsWindow = library:CreateWindow("Collector Detector")

-- Create UI folder
local collectorsFolder = collectorsWindow:CreateFolder("Collector Detection")

-- Sound setup
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://8853003751"  -- Same sound as illu detector
sound.Volume = 1
sound.Parent = game:GetService("SoundService")

-- Collector detection variables
local collector_doors = {
    workspace.Map.beachCollectorDoor,
    workspace.Map.desertCollectorDoor,
    workspace.Map.plainsCollectorDoor,
    workspace.Map.tundraCollectorDoor
}

local current_collector_door = nil
local soundPlayed = false
local collector_label = collectorsFolder:Label("No collector open", {
    TextSize = 15,
    TextColor = Color3.fromRGB(255, 255, 255),
    BgColor = Color3.fromRGB(207, 85, 255) 
})

-- Function to update collector detection
local function update_collector_detection()
    for _, door in ipairs(collector_doors) do
        if door.Transparency == 1 and current_collector_door ~= door then
            current_collector_door = door
            collector_label:Refresh("Collector Opened at " .. door.Name:gsub("CollectorDoor", ""))
            collector_label.BgColor = Color3.fromRGB(0, 255, 0) 
            
            -- Play sound when collector opens
            sound:Play()
            soundPlayed = true
            break
        elseif door.Transparency == 0 and current_collector_door == door then
            current_collector_door = nil
            collector_label:Refresh("No collector open")
            collector_label.BgColor = Color3.fromRGB(255, 85, 85) 
            soundPlayed = false
        end
    end
end


-- Start the collector detection loop (always on)
task.spawn(function()
    while task.wait(0.1) do
        update_collector_detection()
    end
end)
