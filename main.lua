-- Débogueur Visual Studio Code tomblind.local-lua-debugger-vscode
if pcall(require, "lldebugger") then
    require("lldebugger").start()
end
mesEtoiles = {}

-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf("no")

function love.load()
    largeur = love.graphics.getWidth()
    hauteur = love.graphics.getHeight()

    imgEtoile = love.graphics.newImage("img/star.png")

    for n = 1, 50 do
        etoile = {}
        etoile.x = love.math.random(1, largeur - imgEtoile:getWidth())
        etoile.y = love.math.random(1, hauteur - imgEtoile:getHeight())
        -- ajoute etoile dans mes etoiles
        table.insert(mesEtoiles, etoile)
        etoile.vx = 3
    end
end

function love.update(dt)
    for k, etoile in ipairs(mesEtoiles) do
        etoile.x = etoile.x + etoile.vx
        if etoile.x > largeur - imgEtoile:getWidth() then
            etoile.x = 0
        end
    end
end

function love.draw()
    for k, etoile in ipairs(mesEtoiles) do
        love.graphics.draw(imgEtoile, etoile.x, etoile.y)
    end
end

function love.keypressed(key)
end
