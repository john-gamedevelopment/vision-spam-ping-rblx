-- Define the start and end positions
local startX, startY, startZ = -505, 55, -404
local endX, endY, endZ = -991, 58, 283
local step = 5 -- The gap between each point (5 studs)

local function fireRows()
    while wait(2) do -- Infinite loop to repeat the process
        local direction = 1 -- 1 for left-to-right, -1 for right-to-left
        local currentZ = startZ

        while currentZ <= endZ do
            -- Gather all positions for the current row
            if direction == 1 then
                for x = startX, endX, -step do
                    game:GetService("ReplicatedStorage").Remotes.PassWave:FireServer(Vector3.new(x, startY, currentZ))
                end
            else
                for x = endX, startX, step do
                    game:GetService("ReplicatedStorage").Remotes.PassWave:FireServer(Vector3.new(x, startY, currentZ))
                end
            end

            -- Move to the next row and reverse direction
            direction = -direction
            currentZ = currentZ + step
        end
    end
end

-- Execute the main function
fireRows()
