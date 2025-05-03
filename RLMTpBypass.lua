local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local w = library:CreateWindow("RypScripts")
local llu = library:CreateWindow("Illu Checker")
local lluX = llu:CreateFolder("Main")
local autopickup= w:CreateFolder("Autopickup")
local forge = w:CreateFolder("Forge")
local exploits = w:CreateFolder("Exploits")
local tab_collectors = w:CreateFolder("Collectors") -- New folder for collector stuff
local misc = w:CreateFolder("Misc")

queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/YhRyptix/RLM/refs/heads/main/RLMTpBypass.lua'))()")









local yourvariable = forge:Label("Unknown amount of trinkets at forge",{
    TextSize = 25; 
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.new(0.011765, 0.678431, 0.211765);
})






local label_collector = tab_collectors:Label("No collector open", {
    TextSize = 15,
    TextColor = Color3.fromRGB(255, 255, 255),
    BgColor = Color3.fromRGB(207, 85, 255) -- Initial red
})

--// 📦 Collector Door Detection
local collector_doors = {
    workspace.Map.beachCollectorDoor,
    workspace.Map.desertCollectorDoor,
    workspace.Map.plainsCollectorDoor,
    workspace.Map.tundraCollectorDoor
}

local current_collector_door = nil


--// 🟦 Button: TP to Collector Door

local function teleport_to_cframe(cframe)
    local root = workspace.Live[game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = cframe + Vector3.new(0, 5, 0)
    end
end

--// Compatibility for request
local httprequest = httprequest or request or syn and syn.request or http and http.request or fluxus and fluxus.request or krnl_request

--// Services
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

--// Vars
local PlaceId = game.PlaceId
local JobId = game.JobId

--// Functions
local function notify(title, msg)
    print(`[Serverhop] {title} - {msg}`) -- Change this to use your own UI if you want
end

local function serverhop()
    if not httprequest then
        return notify("Error", "Your exploit does not support httprequest.")
    end

    local servers = {}
    local success, response = pcall(function()
        return httprequest({
            Url = string.format(
                "https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true",
                PlaceId
            )
        })
    end)

    if not success then
        return notify("Error", "Failed to get server list.")
    end

    local body = HttpService:JSONDecode(response.Body)

    if body and body.data then
        for _, v in ipairs(body.data) do
            if typeof(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers)
                and v.playing < v.maxPlayers and v.id ~= JobId then
                table.insert(servers, v.id)
            end
        end
    end

    if #servers > 0 then
        TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], Players.LocalPlayer)
    else
        notify("Serverhop", "No available servers found.")
    end
end


tab_collectors:Button("Teleport to Open Collector", function()
    if current_collector_door and current_collector_door:IsDescendantOf(workspace) then
        teleport_to_cframe(current_collector_door.CFrame)
    else
        label_collector:Refresh("No collector open")
    end
end)

--// 🔁 Toggle: Enable Collector Detection
tab_collectors:Toggle("Enable Collector Detection", function(state)
    collector_detection_enabled = state
    if not state then
        label_collector:Refresh("No collector open")
        label_collector.BgColor = Color3.fromRGB(85, 144, 255) -- Reset color when disabled
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if collector_detection_enabled then -- Only run if toggle is enabled
            for _, door in ipairs(collector_doors) do
                if door.Transparency == 1 and current_collector_door ~= door then
                    current_collector_door = door
                    label_collector:Refresh("Collector Opened at " .. door.Name:gsub("CollectorDoor", ""))
                    label_collector.TextColor = Color3.fromRGB(255, 255, 255)
                    label_collector.BgColor = Color3.fromRGB(0, 255, 0) -- Change to green when open
                    break
                elseif door.Transparency == 0 and current_collector_door == door then
                    current_collector_door = nil
                    label_collector:Refresh("No collector open")
                    label_collector.TextColor = Color3.fromRGB(255, 255, 255)
                    label_collector.BgColor = Color3.fromRGB(255, 85, 85) -- Back to red when closed
                end
            end
        end
    end
end)



misc:Button("Server Hop",function()
serverhop()

    
    end)


autopickup:Button("Autopickup",function()

repeat
    print("Waiting for the game to load...")
    task.wait()
until game:IsLoaded()
print("Game has fully loaded!")

local Player = game:GetService("Players").LocalPlayer
print("Local player acquired:", Player)

assert(Player.Character, "Player must be spawned")
print("Player character found:", Player.Character)

local function getFullPath(instance)
    local path = instance.Name
    while instance.Parent do
        instance = instance.Parent
        path = instance.Name .. "." .. path
    end
    return path
end

local function clickOnTrinket(trinket)
    print("Attempting to click on trinket:", trinket.Name)

    local clickDetector = trinket:FindFirstChildOfClass("ClickDetector")

    if not clickDetector then
        for _, descendant in pairs(trinket:GetDescendants()) do
            if descendant:IsA("ClickDetector") then
                clickDetector = descendant
                break
            end
        end
    end

    if clickDetector then
        local fullPath = getFullPath(clickDetector)
        task.wait(0.05)
        fireclickdetector(clickDetector)

    end
end

pcall(function()
    coroutine.resume(coroutine.create(function()
        while task.wait(0.020) do  
            local playerPosition = Player.Character:WaitForChild("HumanoidRootPart").Position

            for _, trinket in pairs(workspace.Trinkets:GetChildren()) do
                local trinketPosition = trinket.Position
                local distance = (playerPosition - trinketPosition).Magnitude

                if distance < 25 and shared.toggle ~= false then
                    clickOnTrinket(trinket)
                end
            end
        end
    end))
end)

end)

autopickup:Toggle("Enable Autopickup",function(bool)
    shared.toggle = bool
    print(shared.toggle)
end)

forge:Button("Find trinkets @ forge",function()

local targetPosition = Vector3.new(5681, 1100, -4469)
local renameRadius = 1000 
local Count;

local function renameNearbyTrinkets()
    local renamedCount = 0 

    for _, trinket in pairs(workspace.Trinkets:GetChildren()) do 
        local trinketPosition = trinket.Position
        local distance = (targetPosition - trinketPosition).Magnitude

        if distance < renameRadius then
            trinket.Name = "ForgeTrinket"
            renamedCount = renamedCount + 1 
            Count = renamedCount
        end
    end

end

renameNearbyTrinkets()

yourvariable:Refresh("Trinkets at forge ".. Count)

end)

forge:Button("Collect all trinkets @ forge",function()

local Player = game.Players.LocalPlayer

    local function teleportPlayer(targetPosition)
        Player.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
    end

    local function teleportToForgeTrinkets()
        while true do

            local trinkets = game.Workspace.Trinkets:GetChildren()
            local foundTrinkets = false

            for _, trinket in pairs(trinkets) do
                if trinket.Name == "ForgeTrinket" then
                    foundTrinkets = true
                    local targetPosition = trinket.Position + Vector3.new(0, 5, 0) 
                    teleportPlayer(targetPosition)
                     task.wait() 
                    break
                end
            end

            if not foundTrinkets then
                break 
            end

            task.wait() 
        end
    end

    teleportToForgeTrinkets()

end)

exploits:Button("Delete killbricks",function()
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

exploits:Button("Reset",function()
game.Players.LocalPlayer.Character.Head:Destroy()
end)

exploits:Toggle("Tp Bypass (toggle while dead)",function(bool)
    enabled = bool
end)

exploits:Button("Arti Detector",function()
  


    local function rgbToColor3(r, g, b)
        return Color3.new(r / 255, g / 255, b / 255)
    end
    
    local TrinketConfig = {
        DefaultName = "trinketlol",
        PositionToRemove = Vector3.new(18050.765625, 395.95458984375, 37243.8828125),
    
        PointLights = {
            [rgbToColor3(255, 255, 255)] = {Name = "artifactgameWKA", Message = "found WKA"},
            [rgbToColor3(132, 255, 0)] = {Name = "ice essence", Message = "found ice essence"},
            [rgbToColor3(255, 0, 0)] = {Name = "artifactgameHF", Message = "found howler friend"},
            [rgbToColor3(123, 174, 255)] = {Name = "artifactgameDS", Message = "found day stone"},
            [rgbToColor3(201, 169, 255)] = {Name = "artifactgameLannisConcoction", Message = "found Lannis Concoction"},
            [rgbToColor3(255, 89, 89)] = {Name = "artifactgamePhilo", Message = "found Philo stone"},
        },
    
        BrickColors = {
            ["Olivine"] = {Name = "artifactgamenature", Message = "found nature"},
            ["New Yeller"] = {Name = "artifactgamesc", Message = "found sc"},
            ["Pastel Blue"] = {Name = "artifactgameff", Message = "found ff"},
            ["Black metallic"] = {Name = "artifactgamesolans", Message = "found solanskey"},
            ["Neon orange"] = {Name = "artifactgamePF", Message = "found PF"},
            ["Linen"] = {Name = "artifactgameharpy", Message = "found Harpy Friend"},
            ["Hot pink"] = {Name = "artifactgamerift", Message = "found rift"},
            ["Black"] = {Name = "artifactgameNS", Message = "found NightStone"},
            ["Daisy orange"] = {Name = "artifactgamescroomkey", Message = "found scroom key"},
        },
    
        ParticleEmitters = {
            ["rbxassetid://1536547385"] = {
                Name = "artifactgame", -- placeholder, changes dynamically
                ParentName = "artifactgame",
                Message = "found pd/ma" -- will be overridden dynamically
            },
            ["rbxassetid://16897662240"] = {
                Name = "artifactgameWind",
                ParentName = "artifactgameWind",
                Message = "found wind essence"
            },
            ["rbxassetid://46884626"] = {
                Name = "artifactgameAH",
                ParentName = "artifactgameAH",
                Message = "found ah"
            },
        },
    
        ManualWeldName = "Ornament",
        ColorTolerance = 0.1,
    }
    
    local function colorsAreClose(color1, color2, tolerance)
        return math.abs(color1.R - color2.R) < tolerance and
               math.abs(color1.G - color2.G) < tolerance and
               math.abs(color1.B - color2.B) < tolerance
    end
    
    local function handleTrinket(trinket)
        local shouldRenameToOrnament = false
        local foundSomething = false
    
        if trinket.Position == TrinketConfig.PositionToRemove then
            trinket:Destroy()
            return
        end
    
        for _, descendant in pairs(trinket:GetDescendants()) do
            if descendant:IsA("PointLight") then
                local matched = false
                for targetColor, config in pairs(TrinketConfig.PointLights) do
                    if colorsAreClose(descendant.Color, targetColor, TrinketConfig.ColorTolerance) then
                        trinket.Name = config.Name
                        print(config.Message)
                        foundSomething = true
                        matched = true
                        break
                    end
                end
                if not matched then
                    print("PointLight color does not match any target color.")
                    trinket.Name = "artifactgameUnknown"
                end
    
            elseif descendant:IsA("MeshPart") or descendant:IsA("Part") then
                local brickColor = descendant.Parent.BrickColor
                local brickColorName = brickColor.Name
    
                local config = TrinketConfig.BrickColors[brickColorName]
                if config then
                    descendant.Parent.Name = config.Name
                    print(config.Message)
                    foundSomething = true
                end
    
            elseif descendant:IsA("ParticleEmitter") then
                local config = TrinketConfig.ParticleEmitters[descendant.Texture]
                if config then
                    local nameToUse = config.Name
                    local messageToPrint = config.Message
    
                    -- Special case for PD vs MA (based on LightEmission)
                    if descendant.Texture == "rbxassetid://1536547385" then
                        if descendant.LightEmission == 0.800000011920929 then

                            nameToUse = "artifactgameMA"
                            messageToPrint = "found MA"
                                                        descendant.Name = "artifactgameMA"
                        else
                            nameToUse = "artifactgamePD/PF"
                            messageToPrint = "found PD/PF"
                        end
                    end
    
                    descendant.Name = nameToUse
                    if descendant.Parent and descendant.Parent.Parent then
                        descendant.Parent.Parent.Name = config.ParentName or nameToUse
                    end
                    print(messageToPrint)
                    foundSomething = true
                end
            end
        end
    
        local manualWeld = trinket:FindFirstChildOfClass("ManualWeld")
        if manualWeld then
            shouldRenameToOrnament = true
            foundSomething = true
        end
    
        if shouldRenameToOrnament then
            trinket.Name = TrinketConfig.ManualWeldName
        end
    end
    
    for _, trinket in pairs(game.Workspace.Trinkets:GetChildren()) do
        trinket.Name = TrinketConfig.DefaultName
        handleTrinket(trinket)
    end
    

    

end)

exploits:Button("Tp to said artis",function()

local Player = game.Players.LocalPlayer

local function teleportPlayer(targetPosition)
    Player.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
end

local function teleportToArtifactTrinkets()
    while true do

        local trinkets = game.Workspace.Trinkets:GetChildren()
        local foundArtifactTrinkets = false

        for _, trinket in pairs(trinkets) do
            if string.find(trinket.Name, "artifactgame") then
                foundArtifactTrinkets = true
                local targetPosition = trinket.Position + Vector3.new(0, 5, 0) 
                teleportPlayer(targetPosition)
                task.wait() 
                break
            end
        end

        if not foundArtifactTrinkets then
            break
        end

        task.wait()
    end
end

teleportToArtifactTrinkets()

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







-- Label to show the status
local yourvariable = lluX:Label("No illu", {
    TextSize = 25, 
    TextColor = Color3.fromRGB(255,255,255),
    BgColor = Color3.new(0.011765, 0.678431, 0.211765)
})

-- Sound setup
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://8853003751" -- Replace if needed
sound.Volume = 1
sound.Parent = game:GetService("SoundService")

-- State tracking
local soundPlayed = false
local currentIllu = nil

-- Function to check for "Observe" in character or backpack
local function checkForIllu()
    local found = false
    for _, player in pairs(game.Players:GetPlayers()) do
        local char = player.Character
        local backpack = player:FindFirstChild("Backpack")

        local hasObserve = false
        if char and char:FindFirstChild("Observe") then
            hasObserve = true
        elseif backpack and backpack:FindFirstChild("Observe") then
            hasObserve = true
        end

        if hasObserve then
            found = true
            if currentIllu ~= player then
                currentIllu = player
                yourvariable:Refresh("ILLU")
                if not soundPlayed then
                    sound:Play()
                    soundPlayed = true
                end
            end
            break
        end
    end

    if not found and currentIllu ~= nil then
        currentIllu = nil
        yourvariable:Refresh("No illu")
        soundPlayed = false
    end
end

-- Always run
game:GetService("RunService").Heartbeat:Connect(function()
    checkForIllu()
end)
