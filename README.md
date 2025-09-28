# Mafia-hub-v1


## carregar lib
```lua
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/SrDark222/Mafia-hub-v1/refs/heads/main/mafia%20hub.lua"))()
```
## janela principal
```lua
local Window = redzlib:MakeWindow({
    Title = "MAFIA HUB - Brookhaven",
    SubTitle = "by menor DK",
    SaveFolder = "tcc_hub.lua"
})
```
## icone de minizar
```lua
Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://100971981026789", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0.4, 1) }
})
```

## convite
```lua
Tab1:AddDiscordInvite({
    Name = "MAFIA Hub",
    Description = "Entrar no server",
    Logo = "rbxassetid://100971981026789",
    Invite = "Link do discord convite",
})
```


## Tab
```lua
local Tab1 = Window:MakeTab({"Um", "cherry"})
```

## Start tab
```lua
Window:SelectTab(Tab1)
```
## Section
```lua
local Section = Tab1:AddSection({"secção"})
```

## Paragraph
```lua
local Paragraph = Tab1:AddParagraph({"Paragraph", "Este é um parágrafo\nSegunda linha "})
```
## Dialog
```lua
  local Dialog = Window:Dialog({
    Title = "T.C.C ALERTA",
    Text = "BOAS vindas ao hub tcc",
    Options = {
      {"confirmar", function()
        
      end},
      {"Talvez", function()
        
      end},
      {"cancelar", function()
        
      end}
    }
  })
```
## Botão
```lua
Tab1:AddButton({"Print", function(Value)
print("TCC DOMINA")
end})
```
## Toggle 1
```lua
local Toggle1 = Tab1:AddToggle({
  Name = "Toggle",
  Description = "Isto é um  <font color='rgb(88, 101, 242)'>toggle</font> EXEMPLO",
  Default = false 
})
Toggle1:Callback(function(Value)
 
end)
```



## Toggle 2
```lua
Tab1:AddToggle({
    Name = "Toggle",
    Default = false,
    Callback = function(v)

    end
})
```



## Sliders
```lua
Tab1:AddSlider({
  Name = "Speed",
  Min = 1,
  Max = 100,
  Increase = 1,
  Default = 16,
  Callback = function(Value)
  
  end
})
```

## Dropdown
```lua
local Dropdown = Tab1:AddDropdown({
  Name = "Players List",
  Description = "Select the <font color='rgb(88, 101, 242)'>Number</font>",
  Options = {"one", "two", "three"},
  Default = "two",
  Flag = "dropdown teste",
  Callback = function(Value)
    
  end
})
```

## caixa de texto
```lua
Tab1:AddTextBox({
  Name = "Name item",
  Description = "1 Item on 1 Server", 
  PlaceholderText = "item only",
  Callback = function(Value)
    
  end
})
```
