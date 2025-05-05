local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

-- Helper function to find player by name
local function findPlayer(playerName)
    for _, v in next, Players:GetPlayers() do
        if v.Name:lower():sub(1, #playerName) == playerName:lower() then
            return v
        end
    end
    return nil
end

-- Spectating state management
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

    -- Find hovered player label
    local hoveredLabel
    for _, child in ipairs(scrollingFrame:GetChildren()) do
        if child:IsA("TextLabel") and child.TextTransparency ~= 0 then
            hoveredLabel = child
            break
        end
    end
    
    if not hoveredLabel then return end
    
    -- Clean player name
    local playerName = hoveredLabel.Text:gsub("\226\128\142", "")
    local player = findPlayer(playerName)
    if not player or not player.Character then return end

    -- Reset previous highlight
    resetPreviousHighlight()

    -- Toggle spectating
    if spectating ~= player then
        -- Start spectating new player
        spectating = player
        Workspace.CurrentCamera.CameraSubject = player.Character:FindFirstChildOfClass("Humanoid")
        
        -- Store original color and apply highlight
        originalColors[hoveredLabel] = hoveredLabel.TextColor3
        hoveredLabel.TextColor3 = Color3.fromRGB(57, 72, 211) -- Green
        currentHighlight = hoveredLabel
    else
        -- Stop spectating
        spectating = nil
        Workspace.CurrentCamera.CameraSubject = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        resetPreviousHighlight()
    end
end)

-- Updated spectatePlayer function
local function spectatePlayer(playerName)
    playerName = tostring(playerName)
    local player = findPlayer(playerName)
    if not player then return end
    
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    
    -- Reset previous highlight
    resetPreviousHighlight()
    
    -- Find the player's label in leaderboard
    local playerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
    if playerGui then
        local leaderboardGui = playerGui:FindFirstChild("LeaderboardGui")
        if leaderboardGui then
            local scrollingFrame = leaderboardGui:FindFirstChild("MainFrame"):FindFirstChild("ScrollingFrame")
            if scrollingFrame then
                for _, label in ipairs(scrollingFrame:GetChildren()) do
                    if label:IsA("TextLabel") and label.Text:gsub("\226\128\142", "") == player.Name then
                        -- Store original color and apply highlight
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

-- Updated stopSpectating function
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
