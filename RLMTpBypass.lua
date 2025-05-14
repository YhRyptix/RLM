if not game:IsLoaded() then
    game.Loaded:Wait()
end
wait(1)

pcall(function()
    queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/YhRyptix/RLM/refs/heads/main/RLMTpBypass.lua'))()")
end)

local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3'))()
local mainWindow = library:CreateWindow("RypScripts")
local illuWindow = library:CreateWindow("Illu Checker")
local lagger = library:CreateWindow("Auto contract")
local serverloot = library:CreateWindow("Server Loot")

local laggerfolder = lagger:CreateFolder("Main")
local illuFolder = illuWindow:CreateFolder("Main")
local autopickupFolder = mainWindow:CreateFolder("Autopickup")
local forgeFolder = mainWindow:CreateFolder("Forge")
local exploitsFolder = mainWindow:CreateFolder("Exploits")
local collectorsFolder = mainWindow:CreateFolder("Collectors") 
local miscFolder = mainWindow:CreateFolder("Misc")
local serverlootfolder = serverloot:CreateFolder("Main")

local collector_detection_enabled = false
local tp_bypass_enabled = false
local serverlagger_enabled = false
local boundbooks_enabled = false
local purit_enabled = false
local autopickup_enabled = false
local fullbright_enabled = false
local noclip_enabled = false
local fly_enabled = false
local nofog_enabled = false
local fogHeartbeatConnection = nil



local function serverlootv2()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

local trinketsFolder = workspace:WaitForChild("Trinkets")
local TELEPORT_RANGE = 25

-- Your scan points
local scanPoints = {
       Vector3.new(3993, 439, -1017),
    Vector3.new(4026, 439, -1015),
    Vector3.new(3934, 440, -1215),
    Vector3.new(3814, 441, -1184),
    Vector3.new(3882, 627, -1343),
    Vector3.new(3890, 625, -1386),
    Vector3.new(2256, 61, 893),
    Vector3.new(2256, 61, 856),
    Vector3.new(2431, 292, 922),
    Vector3.new(4864, 474, 1661),
    Vector3.new(4882, 475, 1636),
    Vector3.new(4832, 550, 752),
    Vector3.new(4884, 549, 779),
    Vector3.new(4924, 581, 722),
    Vector3.new(5812, 416, 642),
    Vector3.new(5742, 322, 637),
    Vector3.new(5760, 322, 610),
    Vector3.new(-1136, 865, 2590),
    Vector3.new(-1122, 865, 2610),
    Vector3.new(-1119, 865, 2667),
    Vector3.new(-1135, 869, 2685),
    Vector3.new(-1193, 865, 2681),
    Vector3.new(-1212, 869, 2668),
    Vector3.new(-1209, 865, 2610),
    Vector3.new(-1194, 870, 2594),
    Vector3.new(-2696, 608, 108),
    Vector3.new(-2656, 608, 120),
    Vector3.new(554, 179, -1178),
    Vector3.new(162, 56, -1928),
    Vector3.new(164, 56, -1957),
    Vector3.new(1182, 175, -3695),
    Vector3.new(1223, 168, -3744),
    Vector3.new(1269, 168, -3700),
    Vector3.new(1106, 192, -3503),
    Vector3.new(1127, 192, -3479),
    Vector3.new(1109, 192, -3449),
    Vector3.new(1091, 192, -3476),
    Vector3.new(996, -456, -4327),
    Vector3.new(1323, 422, -4111),
    Vector3.new(911, 665, -4068),
    Vector3.new(942, 665, -4070),
    Vector3.new(692, 111, -4625),
    Vector3.new(623, 70, -4533),
    Vector3.new(1138, -259, -4572),
    Vector3.new(1377, -422, -5293),
    Vector3.new(1111, -358, -5035),
    Vector3.new(1087, -515, -5559),
    Vector3.new(1157, -515, -5560),
    Vector3.new(966, -916, -7929),
    Vector3.new(979, -920, -7892),
    Vector3.new(567, -928, -8113),
    Vector3.new(214, -941, -7475),
    Vector3.new(566, -928, -7611),
    Vector3.new(1203, -691, -7841),
    Vector3.new(-379, 270, 1034),
    Vector3.new(702, 443, 2383),
    Vector3.new(782, 443, 2385),
    Vector3.new(776, 388, 2382),
    Vector3.new(1546, 438, 3022),
    Vector3.new(1500, 439, 3004),
    Vector3.new(6458, 1104, -2654),
    Vector3.new(7128, 962, -2265),
    Vector3.new(6615, 1461, 467),
    Vector3.new(6581, 1464, 501),
    Vector3.new(6553, 1463, 468),
    Vector3.new(6572, 1386, 500),
    Vector3.new(6551, 1388, 478),
    Vector3.new(6359, 1478, 56),
    Vector3.new(6310, 1481, 58),
    Vector3.new(6363, 1414, 127),
    Vector3.new(6314, 1395, 177),
    Vector3.new(6357, 1478, -258),
    Vector3.new(6338, 1402, -246),
    Vector3.new(6320, 1405, -195),
    Vector3.new(6517, 1404, -247),
    Vector3.new(6533, 1378, -253),
    Vector3.new(7096, 1287, -316),
    Vector3.new(7067, 1306, -335),
    Vector3.new(7114, 1286, -333),
    Vector3.new(7077, 1287, -295),
    Vector3.new(9382, 1439, 15),
    Vector3.new( -631, 119, 40730),
    Vector3.new(-1721, 526, -372),
    Vector3.new(-1687, 526, -345),
    Vector3.new(-1705, 526, -332),
    Vector3.new(-1650, 526, -338),
    Vector3.new(-1683, 526, -370),
     Vector3.new(-1045, 84, -299),
     Vector3.new(-1041, 84, -324),
     Vector3.new(-1072, 84, -329),
     Vector3.new(-1109, 84, -343),
     Vector3.new(701, 466, 1126),
     Vector3.new(-66, 3639, 389),
     Vector3.new(1983, 357, -778),
     Vector3.new(1943, 240, -799),
          Vector3.new(371, 1320, -4109),
    Vector3.new(458, 1410, -4595),
    Vector3.new(458, 1410, -4595),
    Vector3.new(456, 1410, -4613),
    Vector3.new(556, 1962, -4485),
    Vector3.new(579, 1669, -4468),
    Vector3.new(-65231, 240, -8574),
}

local handledTrinkets = {}
local totalTrinketsCollected = 0

local function isValidTrinket(trinket)
    return trinket:IsA("BasePart") and trinket.Parent == trinketsFolder and not handledTrinkets[trinket]
end

local function highlightTrinket(trinket)
    if not trinket:FindFirstChildOfClass("Highlight") then
        local h = Instance.new("Highlight")
        h.FillColor = Color3.fromRGB(255, 255, 0)
        h.OutlineColor = Color3.fromRGB(255, 255, 255)
        h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        h.Parent = trinket
    end
end

local function getActiveTrinkets()
    local active = {}
    for _, t in ipairs(trinketsFolder:GetChildren()) do
        if isValidTrinket(t) then
            table.insert(active, t)
        end
    end
    return active
end

local function findBestTeleportPoint()
    local bestPoint = nil
    local bestTrinkets = {}

    for _, point in ipairs(scanPoints) do
        local nearby = {}
        for _, trinket in ipairs(getActiveTrinkets()) do
            if (trinket.Position - point).Magnitude <= TELEPORT_RANGE then
                table.insert(nearby, trinket)
            end
        end

        if #nearby > #bestTrinkets then
            bestPoint = point
            bestTrinkets = nearby
        end
    end

    return bestPoint, bestTrinkets
end

task.spawn(function()
    while true do
        local point, trinkets = findBestTeleportPoint()

        if point and #trinkets > 0 then
            print(string.format("[TP] To: %s | Trinkets nearby: %d", tostring(point), #trinkets))
            for _, t in ipairs(trinkets) do highlightTrinket(t) end

            hrp.CFrame = CFrame.new(point)

            -- Give 0.5s grace period to let autopickup do its job
            task.wait(0.5)

            -- Re-check which ones still exist
            local remaining = {}
            for _, t in ipairs(trinkets) do
                if isValidTrinket(t) then
                    table.insert(remaining, t)
                else
                    handledTrinkets[t] = true
                    totalTrinketsCollected += 1
                end
            end

            -- Teleport directly to remaining ones
            for _, t in ipairs(remaining) do
                if isValidTrinket(t) then
                    print("[TP → Trinket] Directly teleporting to missed trinket at:", t.Position)
                    hrp.CFrame = t.CFrame + Vector3.new(0, 3, 0) -- offset above it a little
                    highlightTrinket(t)

                    -- Wait for it to be picked up
                    local timeout = 3
                    while isValidTrinket(t) and timeout > 0 do
                        task.wait(0.2)
                        timeout -= 0.2
                    end

                    if not isValidTrinket(t) then
                        handledTrinkets[t] = true
                        totalTrinketsCollected += 1
                    end
                end
            end

        else
            print("[DONE] No more trinkets to collect.")
            break
        end

        task.wait(0.1)
    end

    print(string.format("[SUMMARY] Total trinkets collected: %d", totalTrinketsCollected))
end)

end


local function serverlootv1()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

local trinketsFolder = workspace:WaitForChild("Trinkets")
local TELEPORT_RANGE = 25

local locations = {
    Vector3.new(3993, 439, -1017),
    Vector3.new(4026, 439, -1015),
    Vector3.new(3934, 440, -1215),
    Vector3.new(3814, 441, -1184),
    Vector3.new(3882, 627, -1343),
    Vector3.new(3890, 625, -1386),
    Vector3.new(2256, 61, 893),
    Vector3.new(2256, 61, 856),
    Vector3.new(2431, 292, 922),
    Vector3.new(4864, 474, 1661),
    Vector3.new(4882, 475, 1636),
    Vector3.new(4832, 550, 752),
    Vector3.new(4884, 549, 779),
    Vector3.new(4924, 581, 722),
    Vector3.new(5812, 416, 642),
    Vector3.new(5742, 322, 637),
    Vector3.new(5760, 322, 610),
    Vector3.new(-1136, 865, 2590),
    Vector3.new(-1122, 865, 2610),
    Vector3.new(-1119, 865, 2667),
    Vector3.new(-1135, 869, 2685),
    Vector3.new(-1193, 865, 2681),
    Vector3.new(-1212, 869, 2668),
    Vector3.new(-1209, 865, 2610),
    Vector3.new(-1194, 870, 2594),
    Vector3.new(-2696, 608, 108),
    Vector3.new(-2656, 608, 120),
    Vector3.new(554, 179, -1178),
    Vector3.new(162, 56, -1928),
    Vector3.new(164, 56, -1957),
    Vector3.new(1182, 175, -3695),
    Vector3.new(1223, 168, -3744),
    Vector3.new(1269, 168, -3700),
    Vector3.new(1106, 192, -3503),
    Vector3.new(1127, 192, -3479),
    Vector3.new(1109, 192, -3449),
    Vector3.new(1091, 192, -3476),
    Vector3.new(996, -456, -4327),
    Vector3.new(1323, 422, -4111),
    Vector3.new(911, 665, -4068),
    Vector3.new(942, 665, -4070),
    Vector3.new(692, 111, -4625),
    Vector3.new(623, 70, -4533),
    Vector3.new(1138, -259, -4572),
    Vector3.new(1377, -422, -5293),
    Vector3.new(1111, -358, -5035),
    Vector3.new(1087, -515, -5559),
    Vector3.new(1157, -515, -5560),
    Vector3.new(966, -916, -7929),
    Vector3.new(979, -920, -7892),
    Vector3.new(567, -928, -8113),
    Vector3.new(214, -941, -7475),
    Vector3.new(566, -928, -7611),
    Vector3.new(1203, -691, -7841),
    Vector3.new(-379, 270, 1034),
    Vector3.new(702, 443, 2383),
    Vector3.new(782, 443, 2385),
    Vector3.new(776, 388, 2382),
    Vector3.new(1546, 438, 3022),
    Vector3.new(1500, 439, 3004),
    Vector3.new(6458, 1104, -2654),
    Vector3.new(7128, 962, -2265),
    Vector3.new(6615, 1461, 467),
    Vector3.new(6581, 1464, 501),
    Vector3.new(6553, 1463, 468),
    Vector3.new(6572, 1386, 500),
    Vector3.new(6551, 1388, 478),
    Vector3.new(6359, 1478, 56),
    Vector3.new(6310, 1481, 58),
    Vector3.new(6363, 1414, 127),
    Vector3.new(6314, 1395, 177),
    Vector3.new(6357, 1478, -258),
    Vector3.new(6338, 1402, -246),
    Vector3.new(6320, 1405, -195),
    Vector3.new(6517, 1404, -247),
    Vector3.new(6533, 1378, -253),
    Vector3.new(7096, 1287, -316),
    Vector3.new(7067, 1306, -335),
    Vector3.new(7114, 1286, -333),
    Vector3.new(7077, 1287, -295),
    Vector3.new(9382, 1439, 15),
    Vector3.new( -631, 119, 40730),
    Vector3.new(-1721, 526, -372),
    Vector3.new(-1687, 526, -345),
    Vector3.new(-1705, 526, -332),
    Vector3.new(-1650, 526, -338),
    Vector3.new(-1683, 526, -370),
     Vector3.new(-1045, 84, -299),
     Vector3.new(-1041, 84, -324),
     Vector3.new(-1072, 84, -329),
     Vector3.new(-1109, 84, -343),
     Vector3.new(701, 466, 1126),
     Vector3.new(-66, 3639, 389),
     Vector3.new(1983, 357, -778),
     Vector3.new(1943, 240, -799),
          Vector3.new(371, 1320, -4109),
    Vector3.new(458, 1410, -4595),
    Vector3.new(458, 1410, -4595),
    Vector3.new(456, 1410, -4613),
    Vector3.new(556, 1962, -4485),
    Vector3.new(579, 1669, -4468),
    Vector3.new(-65231, 240, -8574),

}

local function highlightTrinket(trinket)
    if not trinket:FindFirstChildOfClass("Highlight") then
        local highlight = Instance.new("Highlight")
        highlight.FillColor = Color3.fromRGB(255, 255, 0) -- Yellow
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.Parent = trinket
    end
end

local function countAndHighlightTrinketsNear(position)
    local count = 0
    for _, trinket in ipairs(trinketsFolder:GetChildren()) do
        if (trinket.Position - position).Magnitude <= TELEPORT_RANGE then
            count += 1
            highlightTrinket(trinket)
        end
    end
    return count
end

task.spawn(function()
    for _, loc in ipairs(locations) do
        local count = countAndHighlightTrinketsNear(loc)
        if count > 0 then
            hrp.CFrame = CFrame.new(loc)
            print("[TP] Teleported to:", loc, "| Trinkets nearby:", count)

            -- Wait until all trinkets are gone
            repeat
                task.wait(0.2)
            until countAndHighlightTrinketsNear(loc) == 0

            print("[CLEAR] All trinkets collected at:", loc)
        else
            print("[SKIP] No trinkets near:", loc)
        end
        task.wait(0.1)
    end
end)


end


local function teleport_to_cframe(cframe)
    local root = workspace.Live[game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = cframe + Vector3.new(0, 5, 0)
    end
end

local function getRandomCoordinate(min, max)
    return math.random(min, max)
end

local function getFullPath(instance)
    local path = instance.Name
    while instance.Parent do
        instance = instance.Parent
        path = instance.Name .. "." .. path
    end
    return path
end

local function fullBright(toggle)
    fullbright_enabled = toggle

    if toggle then
        local Lighting = game:GetService("Lighting")
        local oldAmbient = Lighting.Ambient
        local oldBrightness = Lighting.Brightness

        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.Brightness = 1

        Lighting:GetPropertyChangedSignal("Ambient"):Connect(function()
            if not fullbright_enabled then return end
            Lighting.Ambient = Color3.fromRGB(255, 255, 255)
            Lighting.Brightness = 1
        end)
    else
        Lighting.Ambient = oldAmbient
        Lighting.Brightness = oldBrightness
    end
end

local function noClip(toggle)
    noclip_enabled = toggle

    if toggle then
        game:GetService("RunService").Stepped:Connect(function()
            if not noclip_enabled then return end

            local character = game.Players.LocalPlayer.Character
            if not character then return end

            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
    end
end

local flySpeed = 100 
local flyBV

local function fly(toggle)
    fly_enabled = toggle

    if not toggle then
        if flyBV and flyBV.Parent then
            flyBV:Destroy()
        end
        return
    end

    flyBV = Instance.new("BodyVelocity")
    flyBV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

    game:GetService("RunService").Heartbeat:Connect(function()
        if not fly_enabled then return end

        local rootPart = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end

        local camera = workspace.CurrentCamera
        if not camera then return end

        if not flyBV.Parent then
            flyBV.Parent = rootPart
        end

        local UserInputService = game:GetService("UserInputService")
        local moveVector = Vector3.new(
            UserInputService:IsKeyDown(Enum.KeyCode.D) and 1 or UserInputService:IsKeyDown(Enum.KeyCode.A) and -1 or 0,
            UserInputService:IsKeyDown(Enum.KeyCode.Space) and 1 or UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and -1 or 0,
            UserInputService:IsKeyDown(Enum.KeyCode.W) and -1 or UserInputService:IsKeyDown(Enum.KeyCode.S) and 1 or 0
        )

        flyBV.Velocity = camera.CFrame:VectorToWorldSpace(moveVector) * flySpeed
    end)
end

local function serverhop()
    local httprequest = httprequest or request or syn and syn.request or http and http.request or fluxus and fluxus.request or krnl_request
    if not httprequest then
        return print("[Serverhop] Error - Your exploit does not support httprequest.")
    end

    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")

    local PlaceId = game.PlaceId
    local JobId = game.JobId

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
        return print("[Serverhop] Error - Failed to get server list.")
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
        print("[Serverhop] No available servers found.")
    end
end

local collector_doors = {
    workspace.Map.beachCollectorDoor,
    workspace.Map.desertCollectorDoor,
    workspace.Map.plainsCollectorDoor,
    workspace.Map.tundraCollectorDoor
}

local current_collector_door = nil
local collector_label = collectorsFolder:Label("No collector open", {
    TextSize = 15,
    TextColor = Color3.fromRGB(255, 255, 255),
    BgColor = Color3.fromRGB(207, 85, 255) 
})


local function serverlag()
local args = {
    {
        choice = "I want a challenge."
    }
}
game:GetService("ReplicatedStorage"):WaitForChild("Requests"):WaitForChild("Dialogue"):FireServer(unpack(args))
end

local function update_collector_detection()
    for _, door in ipairs(collector_doors) do
        if door.Transparency == 1 and current_collector_door ~= door then
            current_collector_door = door
            collector_label:Refresh("Collector Opened at " .. door.Name:gsub("CollectorDoor", ""))
            collector_label.BgColor = Color3.fromRGB(0, 255, 0) 
            break
        elseif door.Transparency == 0 and current_collector_door == door then
            current_collector_door = nil
            collector_label:Refresh("No collector open")
            collector_label.BgColor = Color3.fromRGB(255, 85, 85) 
        end
    end
end

collectorsFolder:Button("Teleport to Open Collector", function()
    if current_collector_door and current_collector_door:IsDescendantOf(workspace) then
        teleport_to_cframe(current_collector_door.CFrame)
    else
        collector_label:Refresh("No collector open")
    end
end)


serverlootfolder:Button("Whole server loot v1", function()
serverlootv1()
end)

serverlootfolder:Button("Whole server loot v2", function()
serverlootv2()
end)




collectorsFolder:Toggle("Enable Collector Detection", function(state)
    collector_detection_enabled = state
    if not state then
        collector_label:Refresh("No collector open")
        collector_label.BgColor = Color3.fromRGB(85, 144, 255) 
    end
end)

laggerfolder:Button("Teleport to npc", function()
teleport_to_cframe(CFrame.new(-3648, 560, 2094))
end)

laggerfolder:Toggle("Toggle auto contract", function(state)
   serverlagger_enabled = state
end)



local contractlabel = laggerfolder:Label("Every time you get a Valkyrie as a contract, it auto kills it", {
    TextSize = 15,
    TextColor = Color3.fromRGB(255, 255, 255),
    BgColor = Color3.fromRGB(255, 85, 85) 
})
local contractlabeltwo = laggerfolder:Label("Basically just talk to the npc, toggle it on and go afk.", {
    TextSize = 15,
    TextColor = Color3.fromRGB(255, 255, 255),
    BgColor = Color3.fromRGB(255, 85, 85) 
})


laggerfolder:Toggle("Auto turn in bound books", function(state)
   boundbooks_enabled = state
end)

laggerfolder:Toggle("Auto turn in purity", function(state)
   purit_enabled = state
end)

task.spawn(function()
    while task.wait(1.25) do
        if serverlagger_enabled then 
            serverlag()
        end
    end
end)


task.spawn(function()
    while task.wait(0.1) do
        if boundbooks_enabled then 
            local args = {
	{
		choice = "Bound Books."
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("Requests"):WaitForChild("Dialogue"):FireServer(unpack(args))

        end
    end
end)


task.spawn(function()
    while task.wait(0.1) do
        if purit_enabled then 
local args = {
	{
		choice = "I don't need a reward."
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("Requests"):WaitForChild("Dialogue"):FireServer(unpack(args))

        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if collector_detection_enabled then 
            update_collector_detection()
        end
    end
end)

local function clickOnTrinket(trinket)
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
        task.wait(0.05)
        fireclickdetector(clickDetector)
    end
end

local function autopickup_loop()
    local Player = game:GetService("Players").LocalPlayer
    repeat task.wait() until Player.Character

    while task.wait(0.02) do
        if autopickup_enabled then
            local playerPosition = Player.Character:WaitForChild("HumanoidRootPart").Position
            for _, trinket in pairs(workspace.Trinkets:GetChildren()) do
                local distance = (playerPosition - trinket.Position).Magnitude
                if distance < 25 then
                    clickOnTrinket(trinket)
                end
            end
        end
    end
end

autopickupFolder:Button("Autopickup", function()
    task.spawn(autopickup_loop)
end)

autopickupFolder:Toggle("Enable Autopickup", function(state)
    autopickup_enabled = state
end)

local forge_label = forgeFolder:Label("Unknown amount of trinkets at forge", {
    TextSize = 25, 
    TextColor = Color3.fromRGB(255,255,255),
    BgColor = Color3.new(0.011765, 0.678431, 0.211765)
})

local function find_forge_trinkets()
    local targetPosition = Vector3.new(5681, 1100, -4469)
    local renameRadius = 1000 
    local count = 0

    for _, trinket in pairs(workspace.Trinkets:GetChildren()) do 
        local distance = (targetPosition - trinket.Position).Magnitude
        if distance < renameRadius then
            trinket.Name = "ForgeTrinket"
            count = count + 1
        end
    end

    forge_label:Refresh("Trinkets at forge ".. count)
end

local function collect_forge_trinkets()
    local Player = game.Players.LocalPlayer
    local function teleportPlayer(targetPosition)
        Player.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition)) 
    end

    while true do
        local found = false
        for _, trinket in pairs(workspace.Trinkets:GetChildren()) do
            if trinket.Name == "ForgeTrinket" then
                found = true
                teleportPlayer(trinket.Position + Vector3.new(0, 5, 0)) 
                task.wait()
                break
            end
        end
        if not found then break end
    end
end

forgeFolder:Button("Find trinkets @ forge", find_forge_trinkets)
forgeFolder:Button("Collect all trinkets @ forge", collect_forge_trinkets)

local function delete_killbricks()
    for _, v in pairs(workspace.Map:GetDescendants()) do
        if string.find(v.Name, "KillBrick") or string.find(v.Name, "KillFire") or string.find(v.Name, "Lava") then 
            for _, a in pairs(v:GetChildren()) do
                if a:IsA("TouchTransmitter") then 
                    a:Destroy()
                end
            end
        end
    end 
end

local function reset_character()
    game.Players.LocalPlayer.Character.Head:Destroy()
end

local function noFog(toggle)
    nofog_enabled = toggle
    local Lighting = game:GetService("Lighting")

    if toggle then

        if fogHeartbeatConnection then
            fogHeartbeatConnection:Disconnect()
            fogHeartbeatConnection = nil
        end

        Lighting.AreaFogBounds.MaxValue = 99999
        Lighting.AreaFogBounds.MinValue = 99999
        Lighting.AreaFogBounds.Value = 99999

        fogHeartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if not nofog_enabled then return end
            Lighting.AreaFogBounds.MaxValue = 99999
            Lighting.AreaFogBounds.MinValue = 99999
            Lighting.AreaFogBounds.Value = 99999
        end)
    else

        if fogHeartbeatConnection then
            fogHeartbeatConnection:Disconnect()
            fogHeartbeatConnection = nil
        end
    end
end

exploitsFolder:Button("Delete killbricks", delete_killbricks)
exploitsFolder:Button("Reset", reset_character)
exploitsFolder:Toggle("Tp Bypass (toggle while dead)", function(state)
    tp_bypass_enabled = state
end)

exploitsFolder:Toggle("Fullbright", function(state)
    fullbright_enabled = state
    fullBright(state)
end)

exploitsFolder:Bind("Noclip Toggle", Enum.KeyCode.F1, function()
    noclip_enabled = not noclip_enabled
    noClip(noclip_enabled)
end)

exploitsFolder:Bind("Fly Toggle", Enum.KeyCode.F1, function()
    fly_enabled = not fly_enabled
    fly(fly_enabled)
end)

exploitsFolder:Slider("Fly Speed",{
    min = 10,
    max = 200,
    precise = true,
    default = 50 
},function(value)
    flySpeed = value
end)

exploitsFolder:Toggle("No Fog", function(state)
    nofog_enabled = state
    noFog(state)
end)

local function setup_artifact_detection()
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
            [rgbToColor3(128, 187, 219)] = {Name = "artifactgameFF", Message = "found FF"},
            [rgbToColor3(143, 219, 122)] = {Name = "artifactgameNature", Message = "found Nature"},
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
                Name = "artifactgame", 
                ParentName = "artifactgame",
                Message = "found pd/ma" 
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
                        matched = true
                        break
                    end
                end
                if not matched then
                    trinket.Name = "artifactgameUnknown"
                end

            elseif descendant:IsA("MeshPart") or descendant:IsA("Part") then
                local brickColor = descendant.Parent.BrickColor
                local config = TrinketConfig.BrickColors[brickColor.Name]
                if config then
                    descendant.Parent.Name = config.Name
                    print(config.Message)
                end

            elseif descendant:IsA("ParticleEmitter") then
                local config = TrinketConfig.ParticleEmitters[descendant.Texture]
                if config then
                    local nameToUse = config.Name
                    local messageToPrint = config.Message

                    if descendant.Texture == "rbxassetid://1536547385" then
                        if descendant.LightEmission == 0.800000011920929 then
                            nameToUse = "artifactgameMA"
                            messageToPrint = "found MA"
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
                end
            end
        end

        if trinket:FindFirstChildOfClass("ManualWeld") then
            trinket.Name = TrinketConfig.ManualWeldName
        end
    end

    for _, trinket in pairs(workspace.Trinkets:GetChildren()) do
        trinket.Name = TrinketConfig.DefaultName
        handleTrinket(trinket)
    end
end

local function teleport_to_artifacts()
    local Player = game.Players.LocalPlayer
    while true do
        local found = false
        for _, trinket in pairs(workspace.Trinkets:GetChildren()) do
            if string.find(trinket.Name, "artifactgame") then
                found = true
                Player.Character:SetPrimaryPartCFrame(CFrame.new(trinket.Position + Vector3.new(0, 5, 0)))
                task.wait()
                break
            end
        end
        if not found then break end
    end
end

exploitsFolder:Button("Arti Detector", setup_artifact_detection)
exploitsFolder:Button("Tp to said artis", teleport_to_artifacts)

local mapBounds = {
    xMin = -5000,
    xMax = 5000,
    yMin = 0,
    yMax = 500,
    zMin = -5000,
    zMax = 5000
}

game:GetService('RunService').Heartbeat:Connect(function()
    if tp_bypass_enabled then

        local remotes = workspace.Live[game.Players.LocalPlayer.Name].CharacterHandler.Remotes
        if remotes:FindFirstChild("ApplyFallDamage") then
            remotes.ApplyFallDamage.Name = "gg bro"
        end

        local randomPos = Vector3.new(
            getRandomCoordinate(mapBounds.xMin, mapBounds.xMax),
            getRandomCoordinate(mapBounds.yMin, mapBounds.yMax),
            getRandomCoordinate(mapBounds.zMin, mapBounds.zMax)
        )

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(randomPos)
        wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2855, 288, -92)
    end
end)

local illu_label = illuFolder:Label("No illu", {
    TextSize = 25, 
    TextColor = Color3.fromRGB(255,255,255),
    BgColor = Color3.new(0.011765, 0.678431, 0.211765)
})

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://8853003751" 
sound.Volume = 1
sound.Parent = game:GetService("SoundService")

local soundPlayed = false
local currentIllu = nil

local function checkForIllu()
    local found = false
    for _, player in pairs(game.Players:GetPlayers()) do
        local char = player.Character
        local backpack = player:FindFirstChild("Backpack")

        local hasObserve = (char and char:FindFirstChild("Observe")) or 
                          (backpack and backpack:FindFirstChild("Observe"))

        if hasObserve then
            found = true
            if currentIllu ~= player then
                currentIllu = player
                illu_label:Refresh("ILLU")
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
        illu_label:Refresh("No illu")
        soundPlayed = false
    end
end

game:GetService("RunService").Heartbeat:Connect(checkForIllu)

miscFolder:Button("Server Hop", serverhop)

wait()

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local function findPlayer(playerName)
    for _, v in next, Players:GetPlayers() do
        if v.Name:lower():sub(1, #playerName) == playerName:lower() then
            return v
        end
    end
    return nil
end

local spectating = nil
local originalColors = {}
local currentHighlight = nil

local function resetPreviousHighlight()
    if currentHighlight and originalColors[currentHighlight] then
        currentHighlight.TextColor3 = originalColors[currentHighlight]
        currentHighlight = nil
    end
end

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType ~= Enum.UserInputType.MouseButton2 then return end

    local playerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
    if not playerGui then return end

    local leaderboardGui = playerGui:FindFirstChild("LeaderboardGui")
    if not leaderboardGui then return end

    local scrollingFrame = leaderboardGui:FindFirstChild("MainFrame"):FindFirstChild("ScrollingFrame")
    if not scrollingFrame then return end

    local hoveredLabel
    for _, child in ipairs(scrollingFrame:GetChildren()) do
        if child:IsA("TextLabel") and child.TextTransparency ~= 0 then
            hoveredLabel = child
            break
        end
    end

    if not hoveredLabel then return end

    local playerName = hoveredLabel.Text:gsub("\226\128\142", "")
    local player = findPlayer(playerName)
    if not player or not player.Character then return end

    resetPreviousHighlight()

    if spectating ~= player then

        spectating = player
        Workspace.CurrentCamera.CameraSubject = player.Character:FindFirstChildOfClass("Humanoid")

        originalColors[hoveredLabel] = hoveredLabel.TextColor3
        hoveredLabel.TextColor3 = Color3.fromRGB(57, 72, 211) 
        currentHighlight = hoveredLabel
    else

        spectating = nil
        Workspace.CurrentCamera.CameraSubject = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        resetPreviousHighlight()
    end
end)

local function spectatePlayer(playerName)
    playerName = tostring(playerName)
    local player = findPlayer(playerName)
    if not player then return end

    local character = player.Character
    if not character then return end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    resetPreviousHighlight()

    local playerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
    if playerGui then
        local leaderboardGui = playerGui:FindFirstChild("LeaderboardGui")
        if leaderboardGui then
            local scrollingFrame = leaderboardGui:FindFirstChild("MainFrame"):FindFirstChild("ScrollingFrame")
            if scrollingFrame then
                for _, label in ipairs(scrollingFrame:GetChildren()) do
                    if label:IsA("TextLabel") and label.Text:gsub("\226\128\142", "") == player.Name then

                        originalColors[label] = label.TextColor3
                        label.TextColor3 = Color3.fromRGB(57, 72, 211)
                        currentHighlight = label
                        break
                    end
                end
            end
        end
    end

    spectating = player
    Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    Workspace.CurrentCamera.CameraSubject = humanoid
end

local function stopSpectating()
    if not spectating then return end

    resetPreviousHighlight()

    local localPlayer = Players.LocalPlayer
    if localPlayer.Character then
        local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            Workspace.CurrentCamera.CameraSubject = humanoid
        end
    end

    spectating = nil
end

return {
    spectatePlayer = spectatePlayer,
    stopSpectating = stopSpectating,
    isSpectating = function() return spectating ~= nil end,
    getSpectatingPlayer = function() return spectating end
}
