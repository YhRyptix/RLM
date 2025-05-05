
-- Humanoid display modification
task.spawn(function()
    while task.wait(1) do
        for _, v in pairs(Workspace.Live:GetDescendants()) do
            if v:IsA("Humanoid") then
                pcall(function()
                    v.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Subject
                    v.HealthDisplayDistance = math.huge
                    v.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOn
                end)
            end
        end
        print("Health displays refreshed")
    end
end)
