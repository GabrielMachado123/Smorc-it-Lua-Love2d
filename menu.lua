local testOver= {}
local sliderBar={
    position= vector2.new(100, 20),
    size= vector2.new(200, 10)
}
local sliderBall= {
    position= vector2.new(sliderBar.position.x+ sliderBar.size.x/2, sliderBar.position.y+ sliderBar.size.y/2),
    radius= 20
}

local music = love.audio.newSource("music.mp3", "static")
music:setLooping(true)
local volume=0

local waitforBoss= 0
local bossm = love.audio.newSource("Boss.mp3", "static")
bossm:setLooping(true)

local vento = love.audio.newSource("vento.wav", "static")
vento:setLooping(true)

local mute= love.graphics.newImage("mute.png")
local soundOn= love.graphics.newImage("audio.png")


function PlayMusic(Gamestate, started, Reset, dt)
    if love.keyboard.isDown("m") then 
        sliderBall.position.x = sliderBar.position.x
    end
    if sliderBall.position.x< sliderBar.position.x then
        sliderBall.position.x= sliderBar.position.x
    end

    if sliderBall.position.x> sliderBar.position.x+ sliderBar.size.x then
        sliderBall.position.x= sliderBar.position.x+ sliderBar.size.x
    end

    if love.mouse.isDown(1) and math.abs(love.mouse.getX()- sliderBar.position.x)< sliderBar.size.x and math.abs(love.mouse.getY()- sliderBall.position.y)< sliderBall.radius 
    and sliderBall.position.x>= sliderBar.position.x and sliderBall.position.x<= sliderBar.position.x+ sliderBar.size.x then
        sliderBall.position.x= love.mouse.getX()
        if sliderBall.position.x< sliderBar.position.x then
            sliderBall.position.x= sliderBar.position.x
        end

        if sliderBall.position.x> sliderBar.position.x+ sliderBar.size.x then
            sliderBall.position.x= sliderBar.position.x+ sliderBar.size.x
        end
    end

    volume= (sliderBall.position.x- sliderBar.position.x)/ sliderBar.size.x

    if Gamestate== 0 and started== false then
        vento:setVolume(0.1)
        love.audio.play(vento)

    elseif Gamestate== 0 and started== true then
        music:setVolume(0.5*volume- waitforBoss/3)
        love.audio.stop(vento)
        love.audio.play(music)
    end

    if Gamestate== 0 and started== true and Reset == true then
        waitforBoss= waitforBoss+dt
        music:setVolume(0.5* volume - waitforBoss/3)
        if waitforBoss> 1.2 then
            love.audio.stop(music)
            bossm:setVolume(0.6*volume)
            love.audio.play(bossm)
        end

    elseif Gamestate== 3 then
        music:setVolume(0.1*volume)
        love.audio.play(music)
    elseif Gamestate== 1 or Gamestate== 2 then
        love.audio.stop(music)
        love.audio.stop(bossm)
    end
end

function DrawSlider()
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", sliderBar.position.x, sliderBar.position.y, sliderBar.size.x, sliderBar.size.y)
    love.graphics.circle("fill", sliderBall.position.x, sliderBall.position.y, sliderBall.radius)
    if sliderBall.position.x<= sliderBar.position.x then
        love.graphics.draw(mute, sliderBar.position.x- mute:getWidth()/10, sliderBar.position.y+ sliderBar.size.y, 0 ,0.1 ,0.1 ,mute:getWidth()/2 , mute:getHeight()/2)
    else
        love.graphics.draw(soundOn, sliderBar.position.x- soundOn:getWidth()/10, sliderBar.position.y+ sliderBar.size.y, 0 ,0.1 ,0.1 ,soundOn:getWidth()/2 , soundOn:getHeight()/2)
    end
end




function Colorir(x,y,z,v)
    return x,y,z,v
end

function NewButton(text, fn)
    return{text = text, fn = fn,now = false,last = false}
end

function DrawMenu(Buttons,font)
    local ww = love.graphics.getWidth()
    local wh = love.graphics.getHeight()
    local ButtonWidth = ww* (1/3)
    local ButtonHeight = 64
    local margin = 16 
    local TotalHeight = (ButtonHeight + margin) * #Buttons
    local CurrentButtonY = 0
    for i, Buttons in ipairs(Buttons) do
        Buttons.last = Buttons.now
        local bx = (ww * 0.5) - (ButtonWidth * 0.5)
        local by = (wh*0.5) - (TotalHeight * 0.5) + CurrentButtonY
        local color = {0.4,0.4,0.45,0.5}
        local mx, my = love.mouse.getPosition()
        local over = mx > bx and mx < bx  + ButtonWidth and my > by and my < by +ButtonHeight
        testOver[i]= over

        if over then
            color = {0.8,0.8,0.9,1.0}
        end

        Buttons.now = love.mouse.isDown(1)
        if Buttons.now and not Buttons.last and over then 
            Buttons.fn()
        end

        love.graphics.setColor(Colorir(color))
        love.graphics.rectangle("fill", bx, by,ButtonWidth,ButtonHeight)
        love.graphics.setColor(0,0,0,1)
        local textW = font:getWidth(Buttons.text)
        local textH = font:getHeight(Buttons.text)
        love.graphics.print(Buttons.text,font,(ww * 0.5) - (textW*0.5),by + (textH *0.5))                
        CurrentButtonY  = CurrentButtonY + (ButtonHeight + margin )
    end
end

function DrawMenuBAck()
    love.graphics.setColor(0.062, 0.537, 0.215)
    love.graphics.rectangle("fill",0,0,800,600)
    love.graphics.setColor(0.058, 0.062, 0.058)
    love.graphics.setLineWidth(25)
    love.graphics.rectangle("line",0,0,800,600)
    love.graphics.setLineWidth(2)
end

function DrawEnd(Respawn,font)   
    local ww = love.graphics.getWidth()
    local wh = love.graphics.getHeight() 
    local ButtonWidth = ww* (1/3)
    local ButtonHeight = 64
    local margin = 16 
    local TotalHeight = (ButtonHeight + margin) * #Respawn
    local CurrentButtonY = 0
    for i, Respawn in ipairs(Respawn) do 
        Respawn.last = Respawn.now
        local bx = (ww * 0.5) - (ButtonWidth * 0.5)
        local by = (wh*0.5 + 120) - (TotalHeight * 0.5) + CurrentButtonY
        local color = {0.4,0.4,0.45,0.5}
        local mx, my = love.mouse.getPosition()
        local over = mx > bx and mx < bx  + ButtonWidth and my > by and my < by +ButtonHeight
        testOver[1]= over

        if over then
            color = {0.8,0.8,0.9,1.0}
        end

        Respawn.now = love.mouse.isDown(1)

        if Respawn.now and not Respawn.last and over then
            Respawn.fn()
        end

        love.graphics.setColor(Colorir(color))
        love.graphics.rectangle("fill", bx, by,ButtonWidth,ButtonHeight)
        love.graphics.setColor(0,0,0,1)
        local textW = font:getWidth(Respawn.text)
        local textH = font:getHeight(Respawn.text)
        love.graphics.print(Respawn.text,font,(ww * 0.5) - (textW*0.5),by + (textH *0.5))                
        CurrentButtonY  = CurrentButtonY + (ButtonHeight + margin )
    end
end

function DrawEndBAck(Dead)
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("fill",0,0,1000,1000)
    love.graphics.draw(Dead,230,love.graphics.getHeight()/2,0,0.5,0.5,0,Dead:getHeight()/2)
end

function DrawWinBAck(Win)
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill",0,0,1000,1000)
    love.graphics.setColor(1,1,1)
    love.graphics.draw(Win,230,love.graphics.getHeight()/2,0,0.5,0.5,0,Win:getHeight()/2)
end

function GetHover()
    for i=1, #testOver do
        if testOver[i]== true then return true end
    end
    return false
end

function CreateSpriteSheetQuads(spritesheet,cols,rows,w,h)
    local quads = {}
    local count = 1 
    for j = 0, rows - 1, 1 do 
        for i = 0, cols -1, 1 do 
            quads[count] = love.graphics.newQuad(i * w,j * h,w,h,spritesheet:getWidth(),spritesheet:getHeight() )

            count = count + 1
        end

    end 
    return quads 
    
end
function LoadOrc(orc)
    orc.spritesheetQuads = CreateSpriteSheetQuads(orc.spritesheet, 4,1,96,96)
end

function UpdadateOrc(orc,dt)
    orc.animationframetimer = orc.animationframetimer + dt

    if orc.animationframetimer > 0.2 then

        orc.animationframe = orc.animationframe + 1

        if orc.animationframe > 4 then

            orc.animationframe = 1

        end

        orc.animationframetimer = 0
end
end 

function DrawOrc(orc)
    love.graphics.draw(orc.spritesheet, orc.spritesheetQuads[orc.animationframe],orc.position.x,orc.position.y*2 )
end