local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local TextChatService = game:GetService("TextChatService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local IZINLI = "n7duck6"
if player.Name ~= IZINLI then
    warn("Sadece " .. IZINLI .. " kullanabilir.")
    return
end

local SITE_URL = "https://senin-siten.com"

if playerGui:FindFirstChild("YaziGui") then
    playerGui.YaziGui:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "YaziGui"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 999
screenGui.Parent = playerGui

local kapsayici = Instance.new("Frame")
kapsayici.Size = UDim2.new(0, 0, 0, 60)
kapsayici.Position = UDim2.new(0.5, 0, 0, -100)
kapsayici.AnchorPoint = Vector2.new(0.5, 0)
kapsayici.BackgroundTransparency = 1
kapsayici.Parent = screenGui

local yatay = Instance.new("UIListLayout")
yatay.FillDirection = Enum.FillDirection.Horizontal
yatay.HorizontalAlignment = Enum.HorizontalAlignment.Center
yatay.VerticalAlignment = Enum.VerticalAlignment.Center
yatay.Padding = UDim.new(0, 8)
yatay.SortOrder = Enum.SortOrder.LayoutOrder
yatay.Parent = kapsayici

local avatar = Instance.new("ImageLabel")
avatar.Size = UDim2.new(0, 40, 0, 40)
avatar.BackgroundTransparency = 1
avatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. player.UserId .. "&w=150&h=150"
avatar.LayoutOrder = 1
avatar.Parent = kapsayici

local avKose = Instance.new("UICorner")
avKose.CornerRadius = UDim.new(1, 0)
avKose.Parent = avatar

local avStroke = Instance.new("UIStroke")
avStroke.Color = Color3.fromRGB(100, 150, 255)
avStroke.Thickness = 2
avStroke.Transparency = 0.2
avStroke.Parent = avatar

local mesaj = Instance.new("TextLabel")
mesaj.Size = UDim2.new(0, 0, 0, 40)
mesaj.AutomaticSize = Enum.AutomaticSize.X
mesaj.BackgroundTransparency = 1
mesaj.Text = ""
mesaj.TextColor3 = Color3.fromRGB(255, 255, 255)
mesaj.TextSize = 24
mesaj.Font = Enum.Font.GothamBlack
mesaj.TextStrokeTransparency = 0.3
mesaj.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
mesaj.TextWrapped = false
mesaj.LayoutOrder = 2
mesaj.Parent = kapsayici

local menu = Instance.new("Frame")
menu.Name = "Menu"
menu.Size = UDim2.new(0, 320, 0, 0)
menu.Position = UDim2.new(0.5, 0, 0.5, 0)
menu.AnchorPoint = Vector2.new(0.5, 0.5)
menu.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
menu.BackgroundTransparency = 0.05
menu.BorderSizePixel = 0
menu.Visible = false
menu.ZIndex = 20
menu.Parent = screenGui

local menuKose = Instance.new("UICorner")
menuKose.CornerRadius = UDim.new(0, 12)
menuKose.Parent = menu

local menuStroke = Instance.new("UIStroke")
menuStroke.Color = Color3.fromRGB(100, 150, 255)
menuStroke.Thickness = 2
menuStroke.Transparency = 0.3
menuStroke.Parent = menu

local menuBaslik = Instance.new("TextLabel")
menuBaslik.Size = UDim2.new(1, -20, 0, 40)
menuBaslik.Position = UDim2.new(0, 10, 0, 8)
menuBaslik.BackgroundTransparency = 1
menuBaslik.Text = "KOMUT MENÜSÜ"
menuBaslik.TextColor3 = Color3.fromRGB(255, 255, 255)
menuBaslik.TextSize = 20
menuBaslik.Font = Enum.Font.GothamBlack
menuBaslik.TextXAlignment = Enum.TextXAlignment.Left
menuBaslik.ZIndex = 21
menuBaslik.Parent = menu

local cizgi = Instance.new("Frame")
cizgi.Size = UDim2.new(1, -20, 0, 1)
cizgi.Position = UDim2.new(0, 10, 0, 52)
cizgi.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
cizgi.BorderSizePixel = 0
cizgi.ZIndex = 21
cizgi.Parent = menu

local liste = Instance.new("Frame")
liste.Size = UDim2.new(1, -20, 0, 0)
liste.Position = UDim2.new(0, 10, 0, 60)
liste.AutomaticSize = Enum.AutomaticSize.Y
liste.BackgroundTransparency = 1
liste.ZIndex = 21
liste.Parent = menu

local listeLayout = Instance.new("UIListLayout")
listeLayout.Padding = UDim.new(0, 6)
listeLayout.SortOrder = Enum.SortOrder.LayoutOrder
listeLayout.Parent = liste

local komutlar = {
    {isim = "/bildirim", aciklama = "Yazı göster", ornek = "/bildirim Merhaba 5sn"},
    {isim = "/aktif", aciklama = "Siteye aktif gönder", ornek = "/aktif"},
    {isim = "/yardım", aciklama = "Bu menüyü aç/kapa", ornek = "/yardım"},
}

for i, k in ipairs(komutlar) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 44)
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
    btn.BorderSizePixel = 0
    btn.Text = ""
    btn.LayoutOrder = i
    btn.ZIndex = 22
    btn.Parent = liste

    local btnKose = Instance.new("UICorner")
    btnKose.CornerRadius = UDim.new(0, 8)
    btnKose.Parent = btn

    local isimLabel = Instance.new("TextLabel")
    isimLabel.Size = UDim2.new(1, -20, 0, 22)
    isimLabel.Position = UDim2.new(0, 10, 0, 2)
    isimLabel.BackgroundTransparency = 1
    isimLabel.Text = k.isim .. "  —  " .. k.aciklama
    isimLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    isimLabel.TextSize = 14
    isimLabel.Font = Enum.Font.GothamBold
    isimLabel.TextXAlignment = Enum.TextXAlignment.Left
    isimLabel.ZIndex = 23
    isimLabel.Parent = btn

    local ornekLabel = Instance.new("TextLabel")
    ornekLabel.Size = UDim2.new(1, -20, 0, 16)
    ornekLabel.Position = UDim2.new(0, 10, 0, 24)
    ornekLabel.BackgroundTransparency = 1
    ornekLabel.Text = k.ornek
    ornekLabel.TextColor3 = Color3.fromRGB(140, 170, 220)
    ornekLabel.TextSize = 11
    ornekLabel.Font = Enum.Font.Code
    ornekLabel.TextXAlignment = Enum.TextXAlignment.Left
    ornekLabel.ZIndex = 23
    ornekLabel.Parent = btn

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(40, 60, 110)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(25, 25, 32)}):Play()
    end)
end

local function sureCevir(metin)
    if not metin then return nil end
    metin = metin:lower():gsub("%s", "")
    local sayi, birim = metin:match("^(%d+)(%a+)$")
    if not sayi then return nil end
    local carpan = ({ sn = 1, s = 1, m = 60, h = 3600, d = 86400, y = 31536000 })[birim]
    if not carpan then return nil end
    return tonumber(sayi) * carpan
end

local aktifTweenler = {}

local function temizle()
    for _, t in ipairs(aktifTweenler) do t:Cancel() end
    aktifTweenler = {}
end

local function yaziGoster(yaziMetni, sure)
    temizle()
    mesaj.Text = yaziMetni
    local acik = UDim2.new(0.5, 0, 0, 20)
    local kapali = UDim2.new(0.5, 0, 0, -100)
    kapsayici.Position = kapali
    kapsayici.Visible = true
    avatar.ImageTransparency = 1
    mesaj.TextTransparency = 1
    mesaj.TextStrokeTransparency = 1
    local t1 = TweenService:Create(kapsayici,
        TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Position = acik})
    table.insert(aktifTweenler, t1)
    t1:Play()
    local t2 = TweenService:Create(avatar, TweenInfo.new(0.3), {ImageTransparency = 0})
    table.insert(aktifTweenler, t2)
    t2:Play()
    local t3 = TweenService:Create(mesaj, TweenInfo.new(0.3), {
        TextTransparency = 0, TextStrokeTransparency = 0.3
    })
    table.insert(aktifTweenler, t3)
    t3:Play()
    task.wait(sure)
    temizle()
    TweenService:Create(kapsayici,
        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
        {Position = kapali}):Play()
    TweenService:Create(mesaj, TweenInfo.new(0.3), {
        TextTransparency = 1, TextStrokeTransparency = 1
    }):Play()
    TweenService:Create(avatar, TweenInfo.new(0.3), {ImageTransparency = 1}):Play()
end

local function siteyeGonder()
    local veri = HttpService:JSONEncode({
        userId = player.UserId,
        isim = player.Name
    })
    local basarili, hata = pcall(function()
        return HttpService:PostAsync(SITE_URL .. "/aktif", veri, Enum.HttpContentType.ApplicationJson)
    end)
    if basarili then
        return true
    else
        warn("Siteye gönderilemedi: " .. tostring(hata))
        return false
    end
end

local function siteAktifSayisi()
    local basarili, sonuc = pcall(function()
        return HttpService:GetAsync(SITE_URL .. "/aktifler")
    end)
    if basarili and sonuc then
        local ok, veri = pcall(function()
            return HttpService:JSONDecode(sonuc)
        end)
        if ok and veri then
            return veri.sayi or 0
        end
    end
    return nil
end

local menuAcik = false
local isleniyor = false

local function menuAcKapa()
    menuAcik = not menuAcik
    if menuAcik then
        menu.Visible = true
        menu.Size = UDim2.new(0, 320, 0, 0)
        TweenService:Create(menu,
            TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 320, 0, 250)}):Play()
    else
        local t = TweenService:Create(menu,
            TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {Size = UDim2.new(0, 320, 0, 0)})
        t:Play()
        t.Completed:Connect(function()
            menu.Visible = false
        end)
    end
end

local function komutIsle(text)
    if isleniyor then return end
    isleniyor = true
    task.spawn(function()
        task.wait(0.1)
        isleniyor = false
    end)

    local args = {}
    for k in text:gmatch("%S+") do table.insert(args, k) end
    local komut = (args[1] or ""):lower()

    if komut == "/yardım" or komut == "/yardim" then
        menuAcKapa()
        return
    end

    if komut == "/aktif" then
        local gitti = siteyeGonder()
        if gitti then
            task.wait(0.5)
            local sayi = siteAktifSayisi()
            if sayi then
                yaziGoster("Siteye gönderildi. Aktif: " .. sayi .. " kişi", 5)
            else
                yaziGoster("Siteye gönderildi", 3)
            end
        else
            yaziGoster("Siteye gönderilemedi", 3)
        end
        return
    end

    if komut ~= "/bildirim" then return end

    local parcalar = {}
    local sure = 5

    for i = 2, #args do
        local s = sureCevir(args[i])
        if s and i == #args then
            sure = s
        else
            table.insert(parcalar, args[i])
        end
    end

    local yaziMetni = table.concat(parcalar, " ")
    if yaziMetni ~= "" then
        yaziGoster(yaziMetni, sure)
    end
end

player.Chatted:Connect(komutIsle)

task.spawn(function()
    siteyeGonder()
    while true do
        task.wait(30)
        siteyeGonder()
    end
end)

print("[Bildirim] Aktif! /yardım yaz.")
