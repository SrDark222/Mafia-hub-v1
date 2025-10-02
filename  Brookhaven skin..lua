
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/SrDark222/Mafia-hub-v1/refs/heads/main/mafia%20hub.lua"))()

-- janela principal
local Window = redzlib:MakeWindow({
    Title = "MAFIA HUB - Brookhaven : Skin (BETA)",
    SubTitle = "by menor DK",
    SaveFolder = "tcc_hub.lua"
})

-- icone de minimizar
Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://100971981026789", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0.4, 1) }
})

-- Tab principal
local hat = Window:MakeTab({"Chapeu", "infinity"})
local hair = Window:MakeTab({"Cabelo", "infinity"})
local face = Window:MakeTab({"Rosto", "infinity"})
local brinco = Window:MakeTab({"Brincos", "infinity"})
local colete = Window:MakeTab({"Coletes", "infinity"})
local radin = Window:MakeTab({"Radinhos", "infinity"})
local cintura = Window:MakeTab({"Cintura", "infinity"})
local chinelos = Window:MakeTab({"chinelos", "infinity"})

local Section = hair:AddSection({"愛 Acessorios - Cabelo"})
hair:AddButton({"Cabelo : Curly (Platinado)", function()
local args = {
	14908179726
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
hair:AddButton({"Cabelo : Curly (Preto)", function()
local args = {
	14908247332
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
hair:AddButton({"Cabelo : Curly (Marrom Escuro)", function()
local args = {
	14908247332
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
hair:AddButton({"Cabelo : Curly (Gengibre)", function()
local args = {
	14908250649
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
hair:AddButton({"Cabelo : Curly (Nevou)", function()
local args = {
	14908255449
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
hair:AddButton({"Cabelo : Curly (Loiro)", function()
local args = {
	14908238129
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
local Section = hair:AddSection({"愛 Acessorios - Cabelos 2"})
hair:AddButton({"Cabelo : Swept (Loiro)", function()
local args = {
	6413069453
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
hair:AddButton({"Cabelo : Swept (Preto)", function()
local args = {
	6413085241
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
hair:AddButton({"Cabelo : Swept (Nevou)", function()
local args = {
	6413027208
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
local Section = face:AddSection({"愛 Acessorios - Rosto"})
face:AddButton({"Rosto : Mascar De Choro (Emote)", function()
local args = {
	127063550778191
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
face:AddButton({"Rosto : Palhaço (Bozo)", function()
local args = {
	102372675141029
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
face:AddButton({"Rosto : Palhaço (Antigo)", function()
local args = {
	5944759714
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
face:AddButton({"Rosto : Palhaço Joker (Banco)", function()
local args = {
	129178204446964
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
face:AddButton({"Rosto : Efeito Partículas", function()
local args = {
	119738482278505
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
local Section = chinelos:AddSection({"愛 Acessorios - Chinelos"})
chinelos:AddButton({"Chinelo : Nike Boy", function()
local args = {
	16284601411253
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WearBundle"):InvokeServer(unpack(args))
 end})
chinelos:AddButton({"Chinelo : McQueen", function()
 local args = {
	211380797762458
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WearBundle"):InvokeServer(unpack(args))
 end})
chinelos:AddButton({"Chinelo : Havaianas Branca", function()
local args = {
	13759723153
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
chinelos:AddButton({"Chinelo : Tubarão Branco", function()
	local args = {
	13452183180
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
 end})
local Section = cintura:AddSection({"愛 Acessorios - Cintura"})
cintura:AddButton({"Cintura : tatical BDO", function()
local args = {
	16002422244
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args)) end})
cintura:AddButton({"Cintura : Tatical", function()
 local args = {
	10730111839
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args)) end})
local Section = brinco:AddSection({"愛 Acessorios - Brincos"})
brinco:AddButton({"Brinco : Diamante", function()
    local args = {4508445398}
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
local Section = radin:AddSection({"愛 Acessorios - Radinhos"})
radin:AddButton({"Radin : Walkie-talkie", function()
    local args = {12134711097}
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
radin:AddButton({"Radin : 3D (mão)", function()
    local args = {14075830936}
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
local Section = colete:AddSection({"愛 Acessorios - Coletes"})
colete:AddButton({"Colete : Porte Pequeno", function()
    local args = {124899580360334}
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
colete:AddButton({"Colete : Porte Grande", function()
    local args = {12310081567}
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
colete:AddButton({"Colete : Porte Medio", function()
    local args = {17412620212}
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
colete:AddButton({"Colete : Porte Medio", function()
    local args = {129476856582754}
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
local Section = hat:AddSection({"愛 Acessorios - Chapeus "})
hat:AddButton({"Chapeu : influencer", function()
    local args = {6741178550}
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
hat:AddButton({"Chapeu : De pesca", function()
    local args = {18489757497}
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
hat:AddButton({"Chapeu : Maloka (Circo)", function()
    local args = {114535434198145}
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})
hat:AddButton({"Chapeu : Oculos Gartic Levantado (Branco)", function()
    local args = {5693866986}
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end})