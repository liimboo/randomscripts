--[[
if you're not using a loadstring then take these out of the commented space.
getgenv().showPing = true
getgenv().updatePing = true
getgenv().size = 18 --// ur desire
getgenv().font = 'Monospace' --// 2 lazy to add check if not right input will break if it isnt set to Plex, System, UI, or Monospace
]]
local display = Drawing.new('Text')
display.Font = Drawing.Fonts[font]
display.Size = size
display.Position = Vector2.new(960,0)
display.Outline = true
display.Center = true

while updatePing == true do
    if showPing == true then
        display.Visible = true
        local ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() + 0.5)
        if ping <= 150 then
            spike = false
            display.Color = Color3.fromRGB(94, 194, 33) --// Green/Good
            display.Text = ping..' ms'
            display.Size = size
            display.Font = Drawing.Fonts[font]
        elseif ping <= 300 then
            spike = false
            display.Color = Color3.fromRGB(207, 115, 29) --// Orange/High 
            display.Text = ping..' ms'
            display.Size = size
            display.Font = Drawing.Fonts[font]
        else
            display.Font = Drawing.Fonts[font]
            display.Text = ping..' ms {PING SPIKE}'
            display.Size = 27
            display.Color = Color3.fromRGB(255, 0, 0) --// Really Red
            wait(0.2)                                 --// Blinks red and black when spiking high
            display.Color = Color3.fromRGB(20, 20, 20) --// Black
            wait(0.2)
        end
    else
        display.Visible = false
    end
    wait()
end
