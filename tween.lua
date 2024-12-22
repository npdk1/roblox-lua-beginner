local TweenService = game:GetService("TweenService")

-- Define the waypoints
local waypoints = {
    workspace.NPCs.Bandit,               -- Start position
    workspace.NPCs:GetChildren()[7],     -- Second waypoint
    workspace.NPCs:GetChildren()[5],     -- Third waypoint
    workspace.NPCs:GetChildren()[6],     -- Fourth waypoint
}

-- Get the Bandit reference
local bandit = workspace.NPCs.Bandit

-- TweenInfo settings
local tweenInfo = TweenInfo.new(
    2,                          -- Duration (in seconds)
    Enum.EasingStyle.Linear,    -- Easing Style
    Enum.EasingDirection.Out,   -- Easing Direction
    0,                          -- Repeat count
    false,                      -- Reverse
    0                           -- Delay time
)

-- Function to tween Bandit to waypoints
local function moveToWaypoints()
    for _, waypoint in ipairs(waypoints) do
        if waypoint:IsA("BasePart") then  -- Ensure the waypoint is valid
            local targetProperties = {
                Position = waypoint.Position  -- Move to this waypoint
            }
            local tween = TweenService:Create(bandit, tweenInfo, targetProperties)
            
            tween:Play()
            tween.Completed:Wait()  -- Wait until the tween is completed before moving to the next
        else
            warn("Invalid waypoint:", waypoint.Name)
        end
    end
end

-- Start the tween movement
while true do
    moveToWaypoints()
end
