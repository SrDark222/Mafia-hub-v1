


local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local donos = {
    "Espectador_xs9",
    "Elite_deus",
    "Pietraxavier09",
    "PabinhoPla",
    "jzr1v",
    "biel90052",
    "PabinhoPlay"
    "silvax119"
}

local isDono = false
for _,nick in pairs(donos) do
    if LocalPlayer.Name == nick then
        isDono = true
        break
    end
end

if isDono then
    game.ReplicatedStorage.RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", Color3.new(0,0.6,1))
    game.ReplicatedStorage.RE["1RPNam1eTex1t"]:FireServer("RolePlayBio","Scripter")
    game.ReplicatedStorage.RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", Color3.new(0,0,0))
    game.ReplicatedStorage.RE["1RPNam1eTex1t"]:FireServer("RolePlayName","MÁFIA HUB : OWNER 👑")
else
    game.ReplicatedStorage.RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", Color3.new(1,1,1))
    game.ReplicatedStorage.RE["1RPNam1eTex1t"]:FireServer("RolePlayBio","Scripter")
    game.ReplicatedStorage.RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", Color3.new(0,0,0))
    game.ReplicatedStorage.RE["1RPNam1eTex1t"]:FireServer("RolePlayName","MÁFIA HUB : USER")
end
wait(0.1)










local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/SrDark222/Mafia-hub-v1/refs/heads/main/mafia%20hub.lua"))()

local Window = redzlib:MakeWindow({
    Title = "MAFIA HUB - Brookhaven",
    SubTitle = "by menor DK",
    SaveFolder = "mafia_hub"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://100971981026789", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0.4, 1) }
})

-- INFO
local infos = Window:MakeTab({"Info","info"})
infos:AddSection({"DONOS"})
infos:AddParagraph({"Créditos","Dono : rreze\nDev : Menor DK"})
infos:AddSection({"AVISOS"})
infos:AddParagraph({"Aviso","Hub beta, pode ter bugs.\nQualquer dúvida chama no Discord\nby dkzinnn"})

-- PLAYER
local player = Window:MakeTab({"Player","ghost"})
local UserInputService = game:GetService("UserInputService")
local infJump,noclip,fly=false,false,false

player:AddSection({"Movimentação"})
player:AddSlider({
    Name="WalkSpeed",Min=16,Max=200,Default=16,Increment=1,
    Callback=function(v)pcall(function()game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=v end)end
})
player:AddSlider({
    Name="JumpPower",Min=50,Max=300,Default=50,Increment=5,
    Callback=function(v)pcall(function()game.Players.LocalPlayer.Character.Humanoid.JumpPower=v end)end
})
player:AddToggle({
    Name="Infinite Jump",Default=false,
    Callback=function(s)infJump=s end
})
UserInputService.JumpRequest:Connect(function()
    if infJump then pcall(function()game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")end)end
end)

player:AddToggle({
    Name="Noclip",Default=false,
    Callback=function(s)noclip=s end
})
task.spawn(function()
    while task.wait() do
        if noclip then
            pcall(function()
                for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants())do
                    if v:IsA("BasePart") then v.CanCollide=false end
                end
            end)
        end
    end
end)

player:AddSection({"Fly"})

player:AddButton({"Fly mobile", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end})

player:AddSection({"Outros"})
player:AddButton({
    Name="Anti AFK",
    Callback=function()
        local vu=game:GetService("VirtualUser")
        game.Players.LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end
})
player:AddButton({
    Name="Reset",
    Callback=function()pcall(function()game.Players.LocalPlayer.Character:BreakJoints()end)end
})

-- TROLL
local troll = Window:MakeTab({"Troll","snowflake"})
troll:AddSection({"Brincadeiras"})
troll:AddParagraph({"Aviso","Funções troll vão ser adicionadas em breve."})

-- SUPER TROLL
local superTroll = Window:MakeTab({"Super Troll","smile"})
superTroll:AddSection({"Brincadeiras Avançadas"})
superTroll:AddParagraph({"Aviso","Ainda em desenvolvimento..."})player:AddToggle({
    Name="Noclip",Default=false,
    Callback=function(s)noclip=s end
})
task.spawn(function()
    while task.wait() do
        if noclip then
            pcall(function()
                for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants())do
                    if v:IsA("BasePart") then v.CanCollide=false end
                end
            end)
        end
    end
end)

player:AddSection({"Fly"})

player:AddButton({"Fly mobile", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end})

player:AddSection({"Outros"})
player:AddButton({
    Name="Anti AFK",
    Callback=function()
        local vu=game:GetService("VirtualUser")
        game.Players.LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end
})
player:AddButton({
    Name="Reset",
    Callback=function()pcall(function()game.Players.LocalPlayer.Character:BreakJoints()end)end
})

-- TROLL
local troll = Window:MakeTab({"Troll","snowflake"})
troll:AddSection({"Brincadeiras"})
troll:AddParagraph({"Aviso","Funções troll vão ser adicionadas em breve."})

-- SUPER TROLL
local superTroll = Window:MakeTab({"Super Troll","smile"})
superTroll:AddSection({"Brincadeiras Avançadas"})
superTroll:AddParagraph({"Aviso","Ainda em desenvolvimento..."})
