-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")


local hero = {}
hero.x = 30
hero.y = 500
hero.w = 0
hero.h = 0
hero.frame = 1
hero.images = {}
hero.vx = 0
hero.vy = 0

local ennemies = {}
ennemies.x = 800
ennemies.y = 500
ennemies.w = 0
ennemies.h = 0
ennemies.images = {}
ennemies.frame = 1




function love.load()
  
  largeur_ecran= love.graphics.getWidth()
  hauteur_ecran = love.graphics.getHeight()

    background = love.graphics.newImage("Images/CityRuins.png")
    hero.images[1] = love.graphics.newImage("Images/Batman0.png")
    hero.images[2] = love.graphics.newImage("Images/Batman1.png")
    ennemies.images[1] = love.graphics.newImage("Images/zombie1.png")
    ennemies.images[2] = love.graphics.newImage("Images/zombie2.png")

        
    largeur_background = background:getWidth()
    hauteur_background = background:getHeight()
end

function love.update(dt)
 
    hero.frame = hero.frame + (dt*2)
    ennemies.frame = ennemies.frame + (dt*2)

    if hero.frame >= #hero.images + 1 then
        hero.frame = 1
    end

    if ennemies.frame >= #ennemies.images + 1 then
        ennemies.frame = 1
    end
    
    -- déplacement ennemie
    ennemies.x = ennemies.x - 1

    if ennemies.x == 0 then
        ennemies.x = 800
    end

    -- déplacement Hero
    -- Vers la droite
    if love.keyboard.isDown("right") then
        hero.x = hero.x + 1
    end

    -- vers la gauche
    if love.keyboard.isDown("left") then
        hero.x = hero.x - 1
    end

    -- saut
    if love.keyboard.isDown("space") then
        hero.vy = hero.y - 100
        hero.y = hero.vy + 1 *dt
    else hero.y = 500
        
    end
        
end

function love.draw()
    love.graphics.draw(background, x, y, r, largeur_ecran/largeur_background, hauteur_ecran/hauteur_background)
local frameArrondie = math.floor(hero.frame, ennemies.frame)
   love.graphics.draw(hero.images[frameArrondie], hero.x, hero.y)
   love.graphics.draw(ennemies.images[frameArrondie], ennemies.x, ennemies.y)
end

function love.keypressed(key)
  
  print(key)
  
end
  