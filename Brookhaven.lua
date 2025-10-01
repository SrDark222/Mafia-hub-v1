

-- T.c.c / By Mnor DK
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer
local Game = game

-- ========================
-- CONFIGURAÇÃO DO WEBHOOK
-- ========================
local WEBHOOK_URL = "https://discord.com/api/webhooks/1391100473494470850/eEp6ydXja0MP9iSjkgD3q_DF5PSodCvgNm1yvGnY3iXECrtruy9k44MaODs9fu8j01oE"

-- ========================
-- FUNÇÕES UTILITÁRIAS
-- ========================
local function ensureFolder(folder)
    if not isfolder(folder) then makefolder(folder) end
end

local function saveJSON(path, tbl)
    local enc = HttpService:JSONEncode(tbl, true)
    writefile(path, enc)
end

local function formatForDiscordSection(title, data, wrapDescription)
    local str = "════════════\n**"..title.."**\n"
    for k,v in pairs(data) do
        if type(v) == "table" then
            str = str.."- * ****"..k.." : **** *\n"
            for i,val in ipairs(v) do
                str = str.."    • "..val.."\n"
            end
        else
            local value = tostring(v)
            if wrapDescription and k == "Descrição" then
                value = "```"..value.."```" -- abre e fecha corretamente
            end
            str = str.."- * ****"..k.." : **** * "..value.."\n"
        end
    end
    return str
end

local function sendWebhookSingleEmbed(title, sections)
    if not WEBHOOK_URL or WEBHOOK_URL == "" then return end
    local description = ""
    for _, sec in ipairs(sections) do
        description = description..sec.."\n"
    end
    local payload = HttpService:JSONEncode({
        username = "˖ . ݁𝜗🥋𝜚. ݁₊𝖒𝖊𝖓𝖔𝖗 𝕯𝖐ᯓᡣ𐭩 •｡ꪆৎ ",
        embeds = {{
            title = title,
            description = description,
            color = 16711680, -- vermelho DK
            footer = {
                text = "🎭 Relatório gerado automaticamente | DK Hub"
            },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    })
    local request = request or http_request or (syn and syn.request) or (http and http.request)
    if request then
        request({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = payload
        })
    else
        warn("❌ Executor não suporta request/webhook")
    end
end

-- ========================
-- CRIANDO PASTAS
-- ========================
local base = "DK_HUB"
ensureFolder(base)
local playerFolder = base.."/player info"
ensureFolder(playerFolder)
local gameFolder = base.."/game info"
ensureFolder(gameFolder)
local hubFolder = base.."/hub"
ensureFolder(hubFolder)
local creditsFolder = base.."/creditos"
ensureFolder(creditsFolder)

-- ========================
-- PLAYER INFO
-- ========================
local playerData = {
    ["Nome de Usuário"] = LocalPlayer.Name,
    ["Nome Exibido"] = LocalPlayer.DisplayName,
    ["ID do Usuário"] = LocalPlayer.UserId,
    ["Idade da Conta (dias)"] = LocalPlayer.AccountAge,
    ["Tipo de Conta"] = tostring(LocalPlayer.MembershipType),
    ["Último PlaceId"] = Game.PlaceId
}
saveJSON(playerFolder.."/player.json", playerData)

-- ========================
-- GAME INFO
-- ========================
local gameInfo = MarketplaceService:GetProductInfo(Game.PlaceId)
local gameData = {
    ["Nome do Jogo"] = gameInfo.Name,
    ["Descrição"] = gameInfo.Description,
    ["ID do Place"] = Game.PlaceId,
    ["ID da Sessão (JobId)"] = tostring(Game.JobId),
    ["Total de Jogadores"] = #Players:GetPlayers()
}
saveJSON(gameFolder.."/game.json", gameData)

-- ========================
-- HUB CONFIG
-- ========================
local hubConfig = {
    ["Último Uso"] = os.date("%d/%m/%Y %H:%M:%S"),
    ["Versão"] = "v1.0",
    ["Autor"] = "By Mnor DK"
}
saveJSON(hubFolder.."/config.json", hubConfig)

-- ========================
-- CRÉDITOS
-- ========================
local credits = {
    ["Projeto"] = "T.c.c / By Mnor DK",
    ["Biblioteca"] = "RedzLib v5",
    ["Usuários Permitidos"] = {
        "Elite_deus",
        "Japalindo_26",
        "Ramonlk45"
    }
}
saveJSON(creditsFolder.."/credits.json", credits)

-- ========================
-- ENVIA TUDO EM UM ÚNICO EMBED
-- ========================
local sections = {
    formatForDiscordSection("🇪🇬 Player Info", playerData),
    formatForDiscordSection("🇪🇬 Game Info", gameData, true), -- wrap Description em ``` ```
    formatForDiscordSection("🇪🇬 Hub Config", hubConfig),
    formatForDiscordSection("🇪🇬 Créditos", credits)
}

sendWebhookSingleEmbed("📊 Relatório Completo DK Hub", sections)

print(" Infos salvas em DK_HUB/ eed")


local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local donos = {
    "Espectador_xs9",
    "Elite_deus",
    "Pietraxavier09",
    "PabinhoPla",
    "jzr1v",
    "biel90052",
    "PabinhoPlay",
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
