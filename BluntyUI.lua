local BluntyUI = {}
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local guiService = player:WaitForChild("PlayerGui")

function BluntyUI:CreateWindow(title)
    local screenGui = Instance.new("ScreenGui", guiService)
    screenGui.Name = "BluntyUI"
    screenGui.ResetOnSpawn = false

    local main = Instance.new("Frame", screenGui)
    main.Size = UDim2.new(0, 500, 0, 300)
    main.Position = UDim2.new(0.5, -250, 0.5, -150)
    main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    main.BorderSizePixel = 0
    main.Name = "Main"

    local sideBar = Instance.new("Frame", main)
    sideBar.Size = UDim2.new(0, 120, 1, 0)
    sideBar.Position = UDim2.new(0, 0, 0, 0)
    sideBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

    local titleLabel = Instance.new("TextLabel", sideBar)
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.Text = title or "Blunty UI"
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 18

    local pageFolder = Instance.new("Folder", main)
    pageFolder.Name = "Pages"

    return {
        Main = main,
        Sidebar = sideBar,
        Pages = pageFolder
    }
end

function BluntyUI:CreatePage(ui, name)
    local button = Instance.new("TextButton", ui.Sidebar)
    button.Size = UDim2.new(1, 0, 0, 40)
    button.Position = UDim2.new(0, 0, 0, #ui.Sidebar:GetChildren() * 40)
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.Gotham
    button.TextSize = 14

    local page = Instance.new("Frame", ui.Pages)
    page.Size = UDim2.new(1, -120, 1, 0)
    page.Position = UDim2.new(0, 120, 0, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.Name = name

    button.MouseButton1Click:Connect(function()
        for _, v in pairs(ui.Pages:GetChildren()) do
            v.Visible = false
        end
        page.Visible = true
    end)

    return page
end

function BluntyUI:CreateButton(page, text, callback)
    local button = Instance.new("TextButton", page)
    button.Size = UDim2.new(0, 200, 0, 40)
    button.Position = UDim2.new(0, 10, 0, #page:GetChildren() * 45)
    button.Text = text
    button.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.Gotham
    button.TextSize = 14
    button.MouseButton1Click:Connect(function()
        pcall(callback)
    end)
end

return BluntyUI