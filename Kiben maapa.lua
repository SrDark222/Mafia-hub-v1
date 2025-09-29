-- ================== LOAD LIB ==================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Forçar simulação completa
pcall(function() sethiddenproperty(LocalPlayer,"SimulationRadius",math.huge) end)

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/SrDark222/Mafia-hub-v1/refs/heads/main/mafia%20hub.lua"))()
local Window = redzlib:MakeWindow({
    Title = "MAFIA HUB - BloxVille",
    SubTitle = "by menor DK",
    SaveFolder = "tcc_hub.lua"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://100971981026789", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0.4, 1) }
})

local infos = Window:MakeTab({"info", "star"})
local Section = infos:AddSection({"Crreditos"})
local Paragraph = infos:AddParagraph({"DESENVOLVEDOR", "Kiben\nMenor DK\nRREZE"})
local Paragraph = infos:AddParagraph({"BETA", "Este é um hub beta ainda pro mapa do kiben, se tiver sugestão so chamar pelo dk\n[ ? ] menor_dkzin"})
infos:AddDiscordInvite({
    Name = "MAFIA Hub",
    Description = "Entrar no server",
    Logo = "rbxassetid://100971981026789",
    Invite = "Link do discord convite",
})



-- ================== ABA DINHEIRO ==================
local monney = Window:MakeTab({"dinheiro", "cloud"})
local AutoFarm = false
local function money()
    local args = {15,15}
    game:GetService("ReplicatedStorage"):WaitForChild("CorrectAnswer"):FireServer(unpack(args))
end
local Section = monney:AddSection({"DINHEIRO INFINITO"})
monney:AddToggle({
  Name = "Infinite money",
  Description = "pegar dinheiro infinitos",
  Default = false,
  Callback = function(Value)
      AutoFarm = Value
      if AutoFarm then
          task.spawn(function()
              while AutoFarm do
                  money()
                  task.wait(0.001)
              end
          end)
      end
  end
})
local Section = monney:AddSection({"LOJA"})

monney:AddButton({
    "Comprar : cafe",
    function()
        local playerRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local coffee = workspace.Cafeteria["Coffee | $5"].Head
        if playerRoot and coffee:FindFirstChild("TouchInterest") then
            -- dispara toque
            firetouchinterest(playerRoot, coffee, 0) -- começo do toque
            firetouchinterest(playerRoot, coffee, 1) -- fim do toque
        end
    end
})




-- ================== ABA FORCE BRUTAL ==================
local brutalTab = Window:MakeTab({"telecinese", "cloud"})
local Section = brutalTab:AddSection({"SELCAO DE ALVO"})
local selectedTarget = nil
local ForceOn = false

local function getPlayerList()
    local list = {}
    for _,plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            table.insert(list, plr.Name)
        end
    end
    return list
end

local targetDropdown = brutalTab:AddDropdown({
    Name = "Escolher alvo",
    Options = getPlayerList(),
    Default = nil,
    Callback = function(Value)
        selectedTarget = Players:FindFirstChild(Value)
    end
})

brutalTab:AddButton({
    Name = "Atualizar Jogadores",
    Callback = function()
        local opts = getPlayerList()
        pcall(function() targetDropdown:Clear() targetDropdown:Add(opts) end)
        pcall(function() targetDropdown:SetOptions(opts) end)
        pcall(function() targetDropdown:Update(opts) end)
        pcall(function() targetDropdown:Set(opts) end)
        pcall(function() targetDropdown:Refresh(opts) end)
    end
})

local function BrutaForca(v, alvo)
    if v:IsA("BasePart") and not v.Anchored and not v:IsDescendantOf(LocalPlayer.Character) then
        v.CanCollide = false
        if not v:FindFirstChild("BrutalAtt") then
            local att0 = Instance.new("Attachment", v)
            att0.Name = "BrutalAtt"
            local att1 = Instance.new("Attachment", alvo.HumanoidRootPart)
            local ap = Instance.new("AlignPosition", v)
            ap.MaxForce, ap.MaxVelocity, ap.Responsiveness = 1e9, 1e9, 200
            ap.Attachment0, ap.Attachment1 = att0, att1

            local av = Instance.new("AngularVelocity", v)
            av.AngularVelocity = Vector3.new(9999,9999,9999)
            av.MaxTorque = Vector3.new(1e9,1e9,1e9)

            local vf = Instance.new("VectorForce", v)
            vf.Attachment0 = att0
            vf.Force = Vector3.new(1e5,0,0)

            local bv = Instance.new("BodyVelocity", v)
            bv.Velocity = Vector3.new(0,0,0)
            bv.MaxForce = Vector3.new(1e9,1e9,1e9)
        end
    end
end

brutalTab:AddToggle({
    Name = "Ativar Force Brutal",
    Description = "Joga todas partes desancoradas no alvo.",
    Default = false,
    Callback = function(Value)
        ForceOn = Value
        if ForceOn then
            task.spawn(function()
                while ForceOn do
                    if selectedTarget and selectedTarget.Character and selectedTarget.Character:FindFirstChild("HumanoidRootPart") then
                        for _,v in ipairs(workspace:GetDescendants()) do
                            BrutaForca(v, selectedTarget.Character)
                        end
                    end
                    RunService.Heartbeat:Wait()
                end
            end)
        end
    end
})

-- ================== ABA PUXAR TUDO PRA CABEÇA ==================
local pullTab = Window:MakeTab({"09x", "cloud"})
local Section = pullTab:AddSection({"TERRO NO CEU"})
local pullToggle = false
local headAnchor = nil

local function ensureHeadAnchor()
    if headAnchor and headAnchor.Parent then return headAnchor end
    local head = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head")
    if not head then return nil end
    headAnchor = Instance.new("Part")
    headAnchor.Name = "DK_HeadAnchor"
    headAnchor.Size = Vector3.new(1,1,1)
    headAnchor.Transparency = 1
    headAnchor.CanCollide = false
    headAnchor.Anchored = true
    headAnchor.CFrame = head.CFrame + Vector3.new(0,70,0)
    headAnchor.Parent = workspace
    return headAnchor
end

pullTab:AddToggle({
    Name = "Ativar Puxar Tudo",
    Description = "Puxa todas partes desancoradas pra cabeça do seu player (+70 studs)",
    Default = false,
    Callback = function(Value)
        pullToggle = Value
        if pullToggle then
            task.spawn(function()
                while pullToggle do
                    local anchor = ensureHeadAnchor()
                    if anchor then
                        for _,v in ipairs(workspace:GetDescendants()) do
                            if v:IsA("BasePart") and not v.Anchored and not v:IsDescendantOf(LocalPlayer.Character) then
                                local att0 = v:FindFirstChild("DK_PullAtt") or Instance.new("Attachment", v)
                                att0.Name = "DK_PullAtt"

                                local ap = v:FindFirstChild("DK_PullAP") or Instance.new("AlignPosition", v)
                                ap.Name = "DK_PullAP"
                                ap.Attachment0 = att0
                                if not anchor:FindFirstChild("DK_AnchorAtt") then
                                    local att1 = Instance.new("Attachment", anchor)
                                    att1.Name = "DK_AnchorAtt"
                                end
                                ap.Attachment1 = anchor:FindFirstChild("DK_AnchorAtt")
                                ap.MaxForce = 1e9
                                ap.MaxVelocity = 1e9
                                ap.Responsiveness = 400

                                local vf = v:FindFirstChild("DK_PullVF") or Instance.new("VectorForce", v)
                                vf.Name = "DK_PullVF"
                                vf.Attachment0 = att0
                                vf.Force = (anchor.Position - v.Position).Unit * 1e5

                                local av = v:FindFirstChild("DK_PullAV") or Instance.new("AngularVelocity", v)
                                av.Name = "DK_PullAV"
                                av.MaxTorque = Vector3.new(1e9,1e9,1e9)
                                av.AngularVelocity = Vector3.new(0,0,0)
                            end
                        end
                    end
                    RunService.Heartbeat:Wait()
                end
            end)
        end
    end
})





-- ================== ABA PATHFIND WALKTO ORGANIZADA ==================
local pathTab = Window:MakeTab({"Pathfind", "cloud"})
local Section = pathTab:AddSection({"-- Pathfind em breve..."})

local FlingTab = Window:MakeTab({"Fling", "cloud"})
local Section = FlingTab:AddSection({"-- fling em breve..."})










brutalTab:AddButton({
    Name = "Atualizar Jogadores",
    Callback = function()
        local opts = getPlayerList()
        pcall(function() targetDropdown:Clear() targetDropdown:Add(opts) end)
        pcall(function() targetDropdown:SetOptions(opts) end)
        pcall(function() targetDropdown:Update(opts) end)
        pcall(function() targetDropdown:Set(opts) end)
        pcall(function() targetDropdown:Refresh(opts) end)
    end
})

local function BrutaForca(v, alvo)
    if v:IsA("BasePart") and not v.Anchored and not v:IsDescendantOf(LocalPlayer.Character) then
        v.CanCollide = false
        if not v:FindFirstChild("BrutalAtt") then
            local att0 = Instance.new("Attachment", v)
            att0.Name = "BrutalAtt"
            local att1 = Instance.new("Attachment", alvo.HumanoidRootPart)
            local ap = Instance.new("AlignPosition", v)
            ap.MaxForce, ap.MaxVelocity, ap.Responsiveness = 1e9, 1e9, 200
            ap.Attachment0, ap.Attachment1 = att0, att1

            local av = Instance.new("AngularVelocity", v)
            av.AngularVelocity = Vector3.new(9999,9999,9999)
            av.MaxTorque = Vector3.new(1e9,1e9,1e9)

            local vf = Instance.new("VectorForce", v)
            vf.Attachment0 = att0
            vf.Force = Vector3.new(1e5,0,0)

            local bv = Instance.new("BodyVelocity", v)
            bv.Velocity = Vector3.new(0,0,0)
            bv.MaxForce = Vector3.new(1e9,1e9,1e9)
        end
    end
end

brutalTab:AddToggle({
    Name = "Ativar Force Brutal",
    Description = "Joga todas partes desancoradas no alvo.",
    Default = false,
    Callback = function(Value)
        ForceOn = Value
        if ForceOn then
            task.spawn(function()
                while ForceOn do
                    if selectedTarget and selectedTarget.Character and selectedTarget.Character:FindFirstChild("HumanoidRootPart") then
                        for _,v in ipairs(workspace:GetDescendants()) do
                            BrutaForca(v, selectedTarget.Character)
                        end
                    end
                    RunService.Heartbeat:Wait()
                end
            end)
        end
    end
})

-- ================== ABA PUXAR TUDO PRA CABEÇA ==================
local pullTab = Window:MakeTab({"09x", "moon"})
local Section = pullTab:AddSection({"TERRO NO CEU"})
local pullToggle = false
local headAnchor = nil

local function ensureHeadAnchor()
    if headAnchor and headAnchor.Parent then return headAnchor end
    local head = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head")
    if not head then return nil end
    headAnchor = Instance.new("Part")
    headAnchor.Name = "DK_HeadAnchor"
    headAnchor.Size = Vector3.new(1,1,1)
    headAnchor.Transparency = 1
    headAnchor.CanCollide = false
    headAnchor.Anchored = true
    headAnchor.CFrame = head.CFrame + Vector3.new(0,70,0)
    headAnchor.Parent = workspace
    return headAnchor
end

pullTab:AddToggle({
    Name = "Ativar Puxar Tudo",
    Description = "Puxa todas partes desancoradas pra cabeça do seu player (+70 studs)",
    Default = false,
    Callback = function(Value)
        pullToggle = Value
        if pullToggle then
            task.spawn(function()
                while pullToggle do
                    local anchor = ensureHeadAnchor()
                    if anchor then
                        for _,v in ipairs(workspace:GetDescendants()) do
                            if v:IsA("BasePart") and not v.Anchored and not v:IsDescendantOf(LocalPlayer.Character) then
                                local att0 = v:FindFirstChild("DK_PullAtt") or Instance.new("Attachment", v)
                                att0.Name = "DK_PullAtt"

                                local ap = v:FindFirstChild("DK_PullAP") or Instance.new("AlignPosition", v)
                                ap.Name = "DK_PullAP"
                                ap.Attachment0 = att0
                                if not anchor:FindFirstChild("DK_AnchorAtt") then
                                    local att1 = Instance.new("Attachment", anchor)
                                    att1.Name = "DK_AnchorAtt"
                                end
                                ap.Attachment1 = anchor:FindFirstChild("DK_AnchorAtt")
                                ap.MaxForce = 1e9
                                ap.MaxVelocity = 1e9
                                ap.Responsiveness = 400

                                local vf = v:FindFirstChild("DK_PullVF") or Instance.new("VectorForce", v)
                                vf.Name = "DK_PullVF"
                                vf.Attachment0 = att0
                                vf.Force = (anchor.Position - v.Position).Unit * 1e5

                                local av = v:FindFirstChild("DK_PullAV") or Instance.new("AngularVelocity", v)
                                av.Name = "DK_PullAV"
                                av.MaxTorque = Vector3.new(1e9,1e9,1e9)
                                av.AngularVelocity = Vector3.new(0,0,0)
                            end
                        end
                    end
                    RunService.Heartbeat:Wait()
                end
            end)
        end
    end
})

-- ================== ABA PATHFIND WALKTO OTIMIZADA ==================
local pathTab = Window:MakeTab({"Pathfind", "cloudmoonrain"})

-- Variáveis
local walkToToggle = false
local usePathfinding = true
local showPath = true
local autoRecalc = true
local walkTarget = nil
local pathDistance = 4
local visualMode = "Highlight Inicio/Fim"

-- Função lista de players
local function getPlayerList()
    local list = {}
    for _,plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            table.insert(list, plr.Name)
        end
    end
    return list
end

-- ================== DROPDOWN ALVO ==================
local targetDropdown = pathTab:AddDropdown({
    Name = "Escolher Alvo",
    Options = getPlayerList(),
    Default = nil,
    Callback = function(Value)
        walkTarget = Players:FindFirstChild(Value)
    end
})

pathTab:AddButton({
    Name = "Atualizar Jogadores",
    Callback = function()
        local opts = getPlayerList()
        pcall(function() targetDropdown:Clear() targetDropdown:Add(opts) end)
        pcall(function() targetDropdown:SetOptions(opts) end)
        pcall(function() targetDropdown:Update(opts) end)
        pcall(function() targetDropdown:Set(opts) end)
        pcall(function() targetDropdown:Refresh(opts) end)
    end
})

-- ================== DROPDOWN VISUAL ==================
local visualDropdown = pathTab:AddDropdown({
    Name = "Modo de visualização",
    Options = {"Nenhum", "Highlight Inicio/Fim", "Linha Completa"},
    Default = "Highlight Inicio/Fim",
    Callback = function(Value)
        visualMode = Value
    end
})

-- ================== TOGGLES ==================
local walkToggle = pathTab:AddToggle({
    Name = "Ativar WalkTo",
    Description = "Segue o HumanoidRootPart do alvo continuamente",
    Default = false,
    Callback = function(Value)
        walkToToggle = Value
        if walkToToggle then
            task.spawn(function()
                while walkToToggle do
                    if walkTarget and walkTarget.Character and walkTarget.Character:FindFirstChild("HumanoidRootPart") then
                        local char = LocalPlayer.Character
                        local humanoid = char and char:FindFirstChild("Humanoid")
                        local root = char and char:FindFirstChild("HumanoidRootPart")
                        local targetHRP = walkTarget.Character.HumanoidRootPart
                        if humanoid and root then
                            if usePathfinding then
                                local path = game:GetService("PathfindingService"):CreatePath({AgentRadius = 2, AgentHeight = 5, AgentCanJump = true})
                                path:ComputeAsync(root.Position, targetHRP.Position)
                                if path.Status == Enum.PathStatus.Complete then
                                    local waypoints = path:GetWaypoints()
                                    if showPath then
                                        for i,wp in ipairs(waypoints) do
                                            if visualMode == "Highlight Inicio/Fim" and (i==1 or i==#waypoints) then
                                                local p = Instance.new("Part")
                                                p.Size = Vector3.new(1,1,1)
                                                p.Anchored = true
                                                p.CanCollide = false
                                                p.Position = wp.Position
                                                p.BrickColor = BrickColor.new("Really red")
                                                p.Parent = workspace
                                                game:GetService("Debris"):AddItem(p, 1)
                                            elseif visualMode == "Linha Completa" and i>1 then
                                                local line = Instance.new("Part")
                                                line.Anchored = true
                                                line.CanCollide = false
                                                line.Size = Vector3.new(0.2,0.2,(waypoints[i].Position - waypoints[i-1].Position).Magnitude)
                                                line.CFrame = CFrame.new(waypoints[i].Position, waypoints[i-1].Position) * CFrame.new(0,0,-line.Size.Z/2)
                                                line.BrickColor = BrickColor.new("Bright blue")
                                                line.Parent = workspace
                                                game:GetService("Debris"):AddItem(line,1)
                                            end
                                        end
                                    end
                                    for _,wp in ipairs(waypoints) do
                                        humanoid:MoveTo(wp.Position)
                                        humanoid.MoveToFinished:Wait()
                                    end
                                end
                            else
                                humanoid:MoveTo(targetHRP.Position)
                                humanoid.MoveToFinished:Wait()
                            end
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

pathTab:AddToggle({
    Name = "Usar PathfindingService",
    Default = true,
    Callback = function(Value)
        usePathfinding = Value
    end
})

pathTab:AddToggle({
    Name = "Mostrar rota",
    Default = true,
    Callback = function(Value)
        showPath = Value
    end
})

pathTab:AddToggle({
    Name = "Auto Recalcular",
    Default = true,
    Callback = function(Value)
        autoRecalc = Value
    end
})
