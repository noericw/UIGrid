-- UIGrid - Addon pour afficher une grille d'alignement

-- === SYSTÈME DE TRADUCTION ===
local L = {}
local translations = {
    enUS = {
        -- Interface
        title = "UIGrid Configuration",
        showGrid = "Show Grid",
        spacing = "Spacing",
        opacity = "Opacity",
        help = "Help",
        reset = "Reset",
        close = "Close",
        language = "Language",
        
        -- Messages
        loaded = "loaded! Type /grid to open configuration",
        gridShown = "Grid shown",
        gridHidden = "Grid hidden",
        minimapShown = "Minimap button shown",
        minimapHidden = "Minimap button hidden",
        spacingSet = "Spacing set to",
        pixels = "pixels",
        resetDone = "Settings reset",
        
        -- Help
        helpTitle = "UIGrid - Help:",
        helpLine1 = "• Use /grid to open this window",
        helpLine2 = "• Check the box to show/hide the grid",
        helpLine3 = "• Adjust spacing with the slider",
        helpLine4 = "• Use the minimap button for quick access",
        helpLine5 = "• The window can be moved by dragging it",
        
        -- Tooltip
        tooltipTitle = "UIGrid",
        tooltipLeft = "Left click: Configuration",
        tooltipRight = "Right click: Toggle grid",
        tooltipDrag = "Drag: Move button",
        tooltipDesc = "Display an alignment grid overlay to help position UI elements precisely.",
        
        -- Slash commands
        cmdTitle = "UIGrid - Commands:",
        cmdLine1 = "/grid - Opens the configuration interface",
        cmdLine2 = "/grid toggle - Toggle the grid directly",
        cmdLine3 = "/grid spacing <number> - Change spacing",
        cmdLine4 = "/grid minimap - Toggle minimap button",
        cmdLine5 = "/grid help - Show this help"
    },
    frFR = {
        -- Interface
        title = "Configuration UIGrid",
        showGrid = "Afficher la grille",
        spacing = "Espacement",
        opacity = "Opacité",
        help = "Aide",
        reset = "Réinit.",
        close = "Fermer",
        language = "Langue",
        
        -- Messages
        loaded = "chargé ! Tapez /grid pour ouvrir la configuration",
        gridShown = "Grille affichée",
        gridHidden = "Grille masquée",
        minimapShown = "Bouton minimap affiché",
        minimapHidden = "Bouton minimap masqué",
        spacingSet = "Espacement réglé à",
        pixels = "pixels",
        resetDone = "Paramètres réinitialisés",
        
        -- Help
        helpTitle = "UIGrid - Aide :",
        helpLine1 = "• Utilisez /grid pour ouvrir cette fenêtre",
        helpLine2 = "• Cochez la case pour afficher/masquer la grille",
        helpLine3 = "• Ajustez l'espacement avec le slider",
        helpLine4 = "• Utilisez le bouton minimap pour un accès rapide",
        helpLine5 = "• La fenêtre peut être déplacée en la faisant glisser",
        
        -- Tooltip
        tooltipTitle = "UIGrid",
        tooltipLeft = "Clic gauche : Configuration",
        tooltipRight = "Clic droit : Toggle grille",
        tooltipDrag = "Glisser : Déplacer le bouton",
        tooltipDesc = "Affiche une grille d'alignement pour positionner précisément les éléments d'interface.",
        
        -- Slash commands
        cmdTitle = "UIGrid - Commandes :",
        cmdLine1 = "/grid - Ouvre l'interface de configuration",
        cmdLine2 = "/grid toggle - Toggle la grille directement",
        cmdLine3 = "/grid spacing <nombre> - Change l'espacement",
        cmdLine4 = "/grid minimap - Toggle le bouton minimap",
        cmdLine5 = "/grid help - Affiche cette aide"
    },
    deDE = {
        -- Interface
        title = "UIGrid Konfiguration",
        showGrid = "Gitter anzeigen",
        spacing = "Abstand",
        opacity = "Deckkraft",
        help = "Hilfe",
        reset = "Zurücksetzen",
        close = "Schließen",
        language = "Sprache",
        
        -- Messages
        loaded = "geladen! Geben Sie /grid ein, um die Konfiguration zu öffnen",
        gridShown = "Gitter angezeigt",
        gridHidden = "Gitter ausgeblendet",
        minimapShown = "Minimap-Button angezeigt",
        minimapHidden = "Minimap-Button ausgeblendet",
        spacingSet = "Abstand eingestellt auf",
        pixels = "Pixel",
        resetDone = "Einstellungen zurückgesetzt",
        
        -- Help
        helpTitle = "UIGrid - Hilfe:",
        helpLine1 = "• Verwenden Sie /grid, um dieses Fenster zu öffnen",
        helpLine2 = "• Aktivieren Sie das Kontrollkästchen, um das Gitter ein-/auszublenden",
        helpLine3 = "• Passen Sie den Abstand mit dem Schieberegler an",
        helpLine4 = "• Verwenden Sie die Minimap-Schaltfläche für schnellen Zugriff",
        helpLine5 = "• Das Fenster kann durch Ziehen verschoben werden",
        
        -- Tooltip
        tooltipTitle = "UIGrid",
        tooltipLeft = "Linksklick: Konfiguration",
        tooltipRight = "Rechtsklick: Gitter umschalten",
        tooltipDrag = "Ziehen: Button verschieben",
        tooltipDesc = "Zeigt ein Ausrichtungsraster an, um UI-Elemente präzise zu positionieren.",
        
        -- Slash commands
        cmdTitle = "UIGrid - Befehle:",
        cmdLine1 = "/grid - Öffnet die Konfigurationsoberfläche",
        cmdLine2 = "/grid toggle - Gitter direkt umschalten",
        cmdLine3 = "/grid spacing <Zahl> - Abstand ändern",
        cmdLine4 = "/grid minimap - Minimap-Button umschalten",
        cmdLine5 = "/grid help - Diese Hilfe anzeigen"
    }
}

-- Fonction pour obtenir la traduction actuelle
local function GetLocale()
    return UIGridDB.language or "enUS"
end

-- Fonction pour changer la langue
local function SetLocale(locale)
    if translations[locale] then
        UIGridDB.language = locale
        L = translations[locale]
        return true
    end
    return false
end

-- Initialiser la langue
local function InitLocale()
    local locale = GetLocale()
    if not translations[locale] then
        locale = "enUS"
    end
    L = translations[locale]
end

-- Paramètres par défaut
UIGridDB = UIGridDB or {}

-- Initialiser les valeurs par défaut si elles n'existent pas
if UIGridDB.spacing == nil then UIGridDB.spacing = 32 end
if UIGridDB.visible == nil then UIGridDB.visible = false end
if UIGridDB.language == nil then UIGridDB.language = "enUS" end
if UIGridDB.minimapButton == nil then 
    UIGridDB.minimapButton = {
        angle = 0,
        hidden = false
    }
end
if UIGridDB.gridColor == nil then 
    UIGridDB.gridColor = {r = 1, g = 1, b = 1, a = 0.3}
end
if UIGridDB.gridThickness == nil then UIGridDB.gridThickness = 1 end

-- Initialiser la langue
InitLocale()

-- Frame principal qui contiendra toutes les lignes
local gridFrame = CreateFrame("Frame", "UIGridFrame", UIParent)
gridFrame:SetAllPoints(UIParent)
gridFrame:SetFrameStrata("BACKGROUND")
gridFrame:Hide()

-- Table pour stocker toutes les lignes
local lines = {}

-- Fonction pour créer les lignes de la grille
local function CreateGrid()
    -- Nettoyer les anciennes lignes si elles existent
    for _, line in ipairs(lines) do
        line:Hide()
    end
    lines = {}
    
    local screenWidth = GetScreenWidth()
    local screenHeight = GetScreenHeight()
    local spacing = UIGridDB.spacing
    local color = UIGridDB.gridColor or {r = 1, g = 1, b = 1, a = 0.3}
    local thickness = UIGridDB.gridThickness or 1
    
    -- Créer les lignes verticales
    for x = 0, screenWidth, spacing do
        local line = gridFrame:CreateTexture(nil, "BACKGROUND")
        line:SetColorTexture(color.r, color.g, color.b, color.a)
        line:SetWidth(thickness)
        line:SetHeight(screenHeight)
        line:SetPoint("TOPLEFT", gridFrame, "TOPLEFT", x, 0)
        table.insert(lines, line)
    end
    
    -- Créer les lignes horizontales
    for y = 0, screenHeight, spacing do
        local line = gridFrame:CreateTexture(nil, "BACKGROUND")
        line:SetColorTexture(color.r, color.g, color.b, color.a)
        line:SetWidth(screenWidth)
        line:SetHeight(thickness)
        line:SetPoint("TOPLEFT", gridFrame, "TOPLEFT", 0, -y)
        table.insert(lines, line)
    end
end

-- Fonction pour afficher/masquer la grille
local function ToggleGrid()
    if gridFrame:IsShown() then
        gridFrame:Hide()
        UIGridDB.visible = false
        print("|cff00ff00UIGrid:|r " .. L.gridHidden)
    else
        CreateGrid()
        gridFrame:Show()
        UIGridDB.visible = true
        print("|cff00ff00UIGrid:|r " .. L.gridShown)
    end
end

-- Fonction pour changer l'espacement
local function SetSpacing(newSpacing)
    local spacing = tonumber(newSpacing)
    if spacing and spacing > 0 and spacing <= 200 then
        UIGridDB.spacing = spacing
        if gridFrame:IsShown() then
            CreateGrid()
        end
    end
end

-- === BOUTON MINIMAP ===
local minimapButton = CreateFrame("Button", "UIGridMinimapButton", Minimap)
minimapButton:SetSize(32, 32)
minimapButton:SetFrameStrata("MEDIUM")
minimapButton:SetFrameLevel(8)
minimapButton:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")

-- Ajouter des attributs pour LibDBIcon avec le tooltip correct
minimapButton.dataObject = {
    type = "launcher",
    icon = "Interface\\Icons\\INV_Misc_Net_01",
    OnClick = function(clickedframe, button)
        if button == "LeftButton" then
            ToggleConfigFrame()
        elseif button == "RightButton" then
            ToggleGrid()
            UpdateUI()
        end
    end,
    OnTooltipShow = function(tooltip)
        tooltip:AddLine("|cff00ff00UIGrid|r")
        tooltip:AddLine("Display an alignment grid overlay to help position UI elements precisely.", 1, 1, 1, true)
        tooltip:AddLine(" ")
        tooltip:AddLine("Left click: Configuration", 0.8, 0.8, 0.8)
        tooltip:AddLine("Right click: Toggle grid", 0.8, 0.8, 0.8)
        tooltip:AddLine("Drag: Move button", 0.6, 0.6, 0.6)
    end,
}

-- Fonction pour mettre à jour le tooltip avec la langue actuelle
local function UpdateMinimapTooltip()
    minimapButton.dataObject.OnTooltipShow = function(tooltip)
        tooltip:AddLine("|cff00ff00UIGrid|r")
        tooltip:AddLine(L.tooltipDesc, 1, 1, 1, true)
        tooltip:AddLine(" ")
        tooltip:AddLine(L.tooltipLeft, 0.8, 0.8, 0.8)
        tooltip:AddLine(L.tooltipRight, 0.8, 0.8, 0.8)
        tooltip:AddLine(L.tooltipDrag, 0.6, 0.6, 0.6)
    end
end

-- Icône du bouton
local icon = minimapButton:CreateTexture(nil, "BACKGROUND")
icon:SetSize(20, 20)
icon:SetPoint("CENTER", 0, 1)
icon:SetTexture("Interface\\Icons\\INV_Misc_Net_01")
minimapButton.icon = icon

-- Bordure du bouton
local overlay = minimapButton:CreateTexture(nil, "OVERLAY")
overlay:SetSize(52, 52)
overlay:SetPoint("CENTER", 0, 0)
overlay:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
minimapButton.overlay = overlay

-- Fonction pour positionner le bouton sur la minimap
local function UpdateMinimapButtonPosition()
    if not UIGridDB.minimapButton then
        UIGridDB.minimapButton = {angle = 0, hidden = false}
    end
    local angle = math.rad(UIGridDB.minimapButton.angle)
    local x = math.cos(angle) * 80
    local y = math.sin(angle) * 80
    minimapButton:SetPoint("CENTER", Minimap, "CENTER", x, y)
end

-- Rendre le bouton draggable
minimapButton:SetMovable(true)
minimapButton:EnableMouse(true)
minimapButton:RegisterForDrag("LeftButton")
minimapButton:SetScript("OnDragStart", function(self)
    self:LockHighlight()
    self.isMoving = true
end)

minimapButton:SetScript("OnDragStop", function(self)
    self:UnlockHighlight()
    self.isMoving = false
end)

minimapButton:SetScript("OnUpdate", function(self)
    if self.isMoving then
        if not UIGridDB.minimapButton then
            UIGridDB.minimapButton = {angle = 0, hidden = false}
        end
        local mx, my = Minimap:GetCenter()
        local px, py = GetCursorPosition()
        local scale = Minimap:GetEffectiveScale()
        px, py = px / scale, py / scale
        
        local angle = math.deg(math.atan2(py - my, px - mx))
        UIGridDB.minimapButton.angle = angle
        UpdateMinimapButtonPosition()
    end
end)

-- Click sur le bouton minimap
minimapButton:SetScript("OnClick", function(self, button)
    if button == "LeftButton" then
        ToggleConfigFrame()
    elseif button == "RightButton" then
        ToggleGrid()
        UpdateUI()
    end
end)

-- Tooltip - utilise aussi le dataObject pour la compatibilité
minimapButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    if self.dataObject and self.dataObject.OnTooltipShow then
        self.dataObject.OnTooltipShow(GameTooltip)
    else
        GameTooltip:AddLine("|cff00ff00UIGrid|r")
        GameTooltip:AddLine(L.tooltipDesc, 1, 1, 1, true)
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine(L.tooltipLeft, 0.8, 0.8, 0.8)
        GameTooltip:AddLine(L.tooltipRight, 0.8, 0.8, 0.8)
        GameTooltip:AddLine(L.tooltipDrag, 0.6, 0.6, 0.6)
    end
    GameTooltip:Show()
end)

minimapButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)

-- === INTERFACE GRAPHIQUE ===

-- Créer la fenêtre principale
local configFrame = CreateFrame("Frame", "UIGridConfigFrame", UIParent, "BackdropTemplate")
configFrame:SetSize(300, 350)
configFrame:SetPoint("CENTER")
configFrame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, tileSize = 32, edgeSize = 32,
    insets = { left = 11, right = 12, top = 12, bottom = 11 }
})
configFrame:SetMovable(true)
configFrame:EnableMouse(true)
configFrame:RegisterForDrag("LeftButton")
configFrame:SetScript("OnDragStart", configFrame.StartMoving)
configFrame:SetScript("OnDragStop", configFrame.StopMovingOrSizing)
configFrame:Hide()

-- Titre
local title = configFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
title:SetPoint("TOP", 0, -20)
title:SetText(L.title)

-- Bouton de fermeture (X)
local closeButton = CreateFrame("Button", nil, configFrame, "UIPanelCloseButton")
closeButton:SetPoint("TOPRIGHT", -5, -5)

-- === CHECKBOX POUR TOGGLE LA GRILLE ===
local checkbox = CreateFrame("CheckButton", "UIGridCheckbox", configFrame, "UICheckButtonTemplate")
checkbox:SetPoint("TOPLEFT", 20, -50)
_G[checkbox:GetName() .. "Text"]:SetText(L.showGrid)

checkbox:SetScript("OnClick", function(self)
    ToggleGrid()
    self:SetChecked(gridFrame:IsShown())
end)

-- === SLIDER POUR L'ESPACEMENT ===
local slider = CreateFrame("Slider", "UIGridSlider", configFrame, "OptionsSliderTemplate")
slider:SetPoint("TOP", 0, -100)
slider:SetMinMaxValues(8, 128)
slider:SetValue(UIGridDB.spacing)
slider:SetValueStep(8)
slider:SetObeyStepOnDrag(true)
slider:SetWidth(250)

-- Labels du slider
_G[slider:GetName() .. "Low"]:SetText("8")
_G[slider:GetName() .. "High"]:SetText("128")
_G[slider:GetName() .. "Text"]:SetText(L.spacing .. ": " .. UIGridDB.spacing .. " px")

slider:SetScript("OnValueChanged", function(self, value)
    value = math.floor(value)
    SetSpacing(value)
    _G[self:GetName() .. "Text"]:SetText(L.spacing .. ": " .. value .. " px")
end)

-- === SLIDER POUR L'OPACITÉ ===
local opacitySlider = CreateFrame("Slider", "UIGridOpacitySlider", configFrame, "OptionsSliderTemplate")
opacitySlider:SetPoint("TOP", 0, -160)
opacitySlider:SetMinMaxValues(0.1, 1.0)
opacitySlider:SetValue(UIGridDB.gridColor and UIGridDB.gridColor.a or 0.3)
opacitySlider:SetValueStep(0.1)
opacitySlider:SetObeyStepOnDrag(true)
opacitySlider:SetWidth(250)

_G[opacitySlider:GetName() .. "Low"]:SetText("10%")
_G[opacitySlider:GetName() .. "High"]:SetText("100%")
_G[opacitySlider:GetName() .. "Text"]:SetText(L.opacity .. ": " .. math.floor((UIGridDB.gridColor and UIGridDB.gridColor.a or 0.3) * 100) .. "%")

opacitySlider:SetScript("OnValueChanged", function(self, value)
    value = tonumber(string.format("%.1f", value))
    if not UIGridDB.gridColor then
        UIGridDB.gridColor = {r = 1, g = 1, b = 1, a = 0.3}
    end
    UIGridDB.gridColor.a = value
    _G[self:GetName() .. "Text"]:SetText(L.opacity .. ": " .. math.floor(value * 100) .. "%")
    if gridFrame:IsShown() then
        CreateGrid()
    end
end)

-- === DROPDOWN POUR LA LANGUE ===
local languageLabel = configFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
languageLabel:SetPoint("TOP", 0, -220)
languageLabel:SetText(L.language .. ":")

local languageDropdown = CreateFrame("Frame", "UIGridLanguageDropdown", configFrame, "UIDropDownMenuTemplate")
languageDropdown:SetPoint("TOP", 0, -240)

local languages = {
    {text = "English", value = "enUS"},
    {text = "Français", value = "frFR"},
    {text = "Deutsch", value = "deDE"}
}

-- Fonction pour obtenir le texte de la langue actuelle
local function GetCurrentLanguageText()
    for _, lang in ipairs(languages) do
        if lang.value == GetLocale() then
            return lang.text
        end
    end
    return "English"
end

local function LanguageDropdown_OnClick(self)
    SetLocale(self.value)
    -- Rafraîchir l'interface
    UpdateUI()
    print("|cff00ff00UIGrid:|r " .. L.language .. ": " .. self:GetText())
end

local function LanguageDropdown_Initialize(self, level)
    local currentLocale = GetLocale()
    for _, lang in ipairs(languages) do
        local info = UIDropDownMenu_CreateInfo()
        info.text = lang.text
        info.value = lang.value
        info.func = LanguageDropdown_OnClick
        info.checked = (lang.value == currentLocale)
        UIDropDownMenu_AddButton(info, level)
    end
end

UIDropDownMenu_Initialize(languageDropdown, LanguageDropdown_Initialize)
UIDropDownMenu_SetWidth(languageDropdown, 100)
UIDropDownMenu_SetButtonWidth(languageDropdown, 80)
UIDropDownMenu_JustifyText(languageDropdown, "LEFT")

-- Initialiser le texte du dropdown
UIDropDownMenu_SetText(languageDropdown, GetCurrentLanguageText())

-- === BOUTONS ===

-- Bouton Help
local helpButton = CreateFrame("Button", nil, configFrame, "GameMenuButtonTemplate")
helpButton:SetPoint("BOTTOMLEFT", 20, 20)
helpButton:SetSize(80, 30)
helpButton:SetText(L.help)
helpButton:SetNormalFontObject("GameFontNormal")
helpButton:SetHighlightFontObject("GameFontHighlight")

helpButton:SetScript("OnClick", function()
    print(L.helpTitle)
    print(L.helpLine1)
    print(L.helpLine2)
    print(L.helpLine3)
    print(L.helpLine4)
    print(L.helpLine5)
end)

-- Bouton Reset
local resetButton = CreateFrame("Button", nil, configFrame, "GameMenuButtonTemplate")
resetButton:SetPoint("BOTTOM", 0, 20)
resetButton:SetSize(80, 30)
resetButton:SetText(L.reset)
resetButton:SetNormalFontObject("GameFontNormal")
resetButton:SetHighlightFontObject("GameFontHighlight")

resetButton:SetScript("OnClick", function()
    UIGridDB.spacing = 32
    UIGridDB.gridColor = {r = 1, g = 1, b = 1, a = 0.3}
    UIGridDB.gridThickness = 1
    UpdateUI()
    if gridFrame:IsShown() then
        CreateGrid()
    end
    print("|cff00ff00UIGrid:|r " .. L.resetDone)
end)

-- Bouton Fermer
local closeButtonBottom = CreateFrame("Button", nil, configFrame, "GameMenuButtonTemplate")
closeButtonBottom:SetPoint("BOTTOMRIGHT", -20, 20)
closeButtonBottom:SetSize(80, 30)
closeButtonBottom:SetText(L.close)
closeButtonBottom:SetNormalFontObject("GameFontNormal")
closeButtonBottom:SetHighlightFontObject("GameFontHighlight")

closeButtonBottom:SetScript("OnClick", function()
    configFrame:Hide()
end)

-- === FONCTION POUR METTRE À JOUR L'INTERFACE ===
function UpdateUI()
    -- Rafraîchir la langue
    InitLocale()
    
    -- Mettre à jour le tooltip du bouton minimap
    UpdateMinimapTooltip()
    
    -- Mettre à jour les textes
    title:SetText(L.title)
    _G[checkbox:GetName() .. "Text"]:SetText(L.showGrid)
    _G[slider:GetName() .. "Text"]:SetText(L.spacing .. ": " .. UIGridDB.spacing .. " px")
    languageLabel:SetText(L.language .. ":")
    helpButton:SetText(L.help)
    resetButton:SetText(L.reset)
    closeButtonBottom:SetText(L.close)
    
    -- Mettre à jour les valeurs
    checkbox:SetChecked(gridFrame:IsShown())
    slider:SetValue(UIGridDB.spacing)
    
    -- S'assurer que gridColor existe
    if UIGridDB.gridColor then
        opacitySlider:SetValue(UIGridDB.gridColor.a)
        _G[opacitySlider:GetName() .. "Text"]:SetText(L.opacity .. ": " .. math.floor(UIGridDB.gridColor.a * 100) .. "%")
    end
    
    -- Mettre à jour le dropdown de langue
    UIDropDownMenu_SetText(languageDropdown, GetCurrentLanguageText())
    UIDropDownMenu_Initialize(languageDropdown, LanguageDropdown_Initialize)
end

-- === FONCTION POUR TOGGLE L'INTERFACE ===
function ToggleConfigFrame()
    if configFrame:IsShown() then
        configFrame:Hide()
    else
        UpdateUI()
        configFrame:Show()
    end
end

-- Commandes slash
SLASH_UIGRID1 = "/grid"
SLASH_UIGRID2 = "/uigrid"

SlashCmdList["UIGRID"] = function(msg)
    msg = string.lower(msg)
    
    if msg == "" then
        ToggleConfigFrame()
    elseif msg == "toggle" then
        ToggleGrid()
        if configFrame:IsShown() then
            UpdateUI()
        end
    elseif msg == "minimap" then
        if not UIGridDB.minimapButton then
            UIGridDB.minimapButton = {angle = 0, hidden = false}
        end
        UIGridDB.minimapButton.hidden = not UIGridDB.minimapButton.hidden
        if UIGridDB.minimapButton.hidden then
            minimapButton:Hide()
            print("|cff00ff00UIGrid:|r " .. L.minimapHidden)
        else
            minimapButton:Show()
            print("|cff00ff00UIGrid:|r " .. L.minimapShown)
        end
    elseif string.match(msg, "^spacing%s+(%d+)") then
        local spacing = string.match(msg, "^spacing%s+(%d+)")
        SetSpacing(spacing)
        if configFrame:IsShown() then
            UpdateUI()
        end
        print("|cff00ff00UIGrid:|r " .. L.spacingSet .. " " .. spacing .. " " .. L.pixels)
    elseif msg == "help" then
        print(L.cmdTitle)
        print(L.cmdLine1)
        print(L.cmdLine2)
        print(L.cmdLine3)
        print(L.cmdLine4)
        print(L.cmdLine5)
    else
        ToggleConfigFrame()
    end
end

-- Au chargement du jeu
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function()
    -- Initialiser la langue
    InitLocale()
    
    -- Initialiser le tooltip du bouton minimap
    UpdateMinimapTooltip()
    
    print("|cff00ff00UIGrid|r " .. L.loaded)
    
    -- S'assurer que minimapButton existe
    if not UIGridDB.minimapButton then
        UIGridDB.minimapButton = {angle = 0, hidden = false}
    end
    
    -- Positionner le bouton minimap
    UpdateMinimapButtonPosition()
    
    -- Afficher/masquer le bouton minimap selon les paramètres
    if UIGridDB.minimapButton.hidden then
        minimapButton:Hide()
    else
        minimapButton:Show()
    end
    
    -- Si la grille était visible à la déconnexion, la réafficher
    if UIGridDB.visible then
        CreateGrid()
        gridFrame:Show()
    end
end)