require "boss"
local breakw= love.audio.newSource("Break.mp3", "static")

local playerposition = vector2.new(50, 500)
local velocity = vector2.new(0, 0)
local mass = 1
local playersize = vector2.new(40, 70)
local weapon = nil
local attacking = false
local maxvelocity = 350
local movementForce = 1500
local EndStage = false
local BackUpCam = false
local maxHealth=1500
local health=maxHealth
local teleported = false
local god = false
local wave = 0
local direction= 1
local idle= true
local active= {}
local punch= {}
local attackPause= 0
local tranfwait= 0

local PlayerWalkL = {
    playerSheet = love.graphics.newImage("WalkLeft-export.png"),
    spritesheetQuads = {},
    animationframe = 1,
    animationframetimer = 0,
    cols= 7,
    timing=0.1
}
local PlayerWalkR = {
    playerSheet = love.graphics.newImage("WalkRight-export.png"),
    spritesheetQuads = {},
    animationframe = 1,
    animationframetimer = 0,
    cols= 7,
    timing=0.1
}


local PlayerIdleL = {
    playerSheet = love.graphics.newImage("IdleLeft-export.png"),
    spritesheetQuads = {},
    animationframe = 1,
    animationframetimer = 0,
    cols= 4,
    timing=0.2
}
local PlayerIdleR = {
    playerSheet = love.graphics.newImage("IdleRight-export.png"),
    spritesheetQuads = {},
    animationframe = 1,
    animationframetimer = 0,
    cols= 4,
    timing=0.2
}


local PlayerAttackLA = {
    playerSheet = love.graphics.newImage("AttackLeftAxe-export.png"),
    spritesheetQuads = {},
    animationframe = 1,
    animationframetimer = 0,
    cols= 4,
    timing=0
}
local PlayerAttackRA = {
    playerSheet = love.graphics.newImage("AttackRightAxe-export.png"),
    spritesheetQuads = {},
    animationframe = 1,
    animationframetimer = 0,
    cols= 4,
    timing=0
}


local PlayerAttackLS = {
    playerSheet = love.graphics.newImage("AttackLeftSword-export.png"),
    spritesheetQuads = {},
    animationframe = 1,
    animationframetimer = 0,
    cols= 4,
    timing=0
}
local PlayerAttackRS = {
    playerSheet = love.graphics.newImage("AttackRightSword-export.png"),
    spritesheetQuads = {},
    animationframe = 1,
    animationframetimer = 0,
    cols= 4,
    timing=0
}


local PlayerPunchL = {
    playerSheet = love.graphics.newImage("PunchLeft.png"),
    spritesheetQuads = {},
    animationframe = 1,
    animationframetimer = 0,
    cols= 4,
    timing=0.1
}
local PlayerPunchR = {
    playerSheet = love.graphics.newImage("PunchRight.png"),
    spritesheetQuads = {},
    animationframe = 1,
    animationframetimer = 0,
    cols= 4,
    timing=0.1
}





function UpdatePlayer(dt, frictioncoefficient, enemy, origpunch)
    punch= origpunch
--Declaring a few spritesheets
    PlayerIdleL.spritesheetQuads= CreateSpriteSheetQuads(PlayerIdleL.playerSheet, 4, 1, 128, 96)
    PlayerIdleR.spritesheetQuads= CreateSpriteSheetQuads(PlayerIdleR.playerSheet, 4, 1, 128, 96)

    PlayerWalkL.spritesheetQuads= CreateSpriteSheetQuads(PlayerWalkL.playerSheet, 7, 1, 128, 96)
    PlayerWalkR.spritesheetQuads= CreateSpriteSheetQuads(PlayerWalkR.playerSheet, 7, 1, 128, 96)

    PlayerAttackLS.spritesheetQuads= CreateSpriteSheetQuads(PlayerAttackLS.playerSheet, 4, 1, 128, 96)
    PlayerAttackRS.spritesheetQuads= CreateSpriteSheetQuads(PlayerAttackRS.playerSheet, 4, 1, 128, 96)

    PlayerAttackLA.spritesheetQuads= CreateSpriteSheetQuads(PlayerAttackLA.playerSheet, 4, 1, 128, 96)
    PlayerAttackRA.spritesheetQuads= CreateSpriteSheetQuads(PlayerAttackRA.playerSheet, 4, 1, 128, 96)
    
    PlayerPunchL.spritesheetQuads= CreateSpriteSheetQuads(PlayerPunchL.playerSheet, 4, 1, 128, 96)
    PlayerPunchR.spritesheetQuads= CreateSpriteSheetQuads(PlayerPunchR.playerSheet, 4, 1, 128, 96)
--No More SpriteSheets

--Updating Frames

    if punch.attacking and direction> 0 then
        active= PlayerPunchR

    elseif punch.attacking and direction< 0 then
        active= PlayerPunchL

    elseif direction> 0 and idle==true then
        active= PlayerIdleR

    elseif direction< 0 and idle== true then
        active= PlayerIdleL

    elseif direction> 0 and idle== false then

        if attacking== false then
            active= PlayerWalkR

        elseif weapon~= nil and weapon.type== 1 then
            active= PlayerAttackRS

        elseif weapon~= nil and weapon.type== 2 then
            active= PlayerAttackRA
        end
    elseif direction< 0 and idle== false then
        if attacking== false then
            active= PlayerWalkL

        elseif weapon~= nil and weapon.type== 1 then
            active= PlayerAttackLS

        elseif weapon~= nil and weapon.type== 2 then
            active= PlayerAttackLA
        end
    end


    active.animationframetimer = active.animationframetimer + dt
    if active.animationframetimer > active.timing then
        active.animationframe = active.animationframe + 1
        if active.animationframe > active.cols then
            active.animationframe = 1
        end
        active.animationframetimer = 0
    end
--Frames Over

--Movement Start
    local friction = vector2.mult(velocity, -1)
    friction = vector2.normalize(friction)
    friction = vector2.mult(friction, frictioncoefficient)
    local acceleration = vector2.new(0, 0)
    local wallsUp = GetWalls()
    tranfwait= tranfwait+ dt

    acceleration = vector2.applyForce(friction, mass, acceleration)

    if love.keyboard.isDown("g") then
        if tranfwait> 0.5 then
            if god== true then
                god= false
                tranfwait= 0
            else
                god = true
                tranfwait= 0
            end
        end
    end
    idle= true

    if love.keyboard.isDown("right") then
        local moveForce = vector2.new(movementForce, 0)
        acceleration = vector2.applyForce(moveForce, mass, acceleration)
        direction= 1
        idle= false
    end

    if love.keyboard.isDown("left") then
        local moveForce = vector2.new(-movementForce, 0)
        acceleration = vector2.applyForce(moveForce, mass, acceleration)
        direction= -1
        idle= false
    end

    if love.keyboard.isDown("up") then
        local moveForce = vector2.new(0, -movementForce)
        acceleration = vector2.applyForce(moveForce, mass, acceleration)
        idle= false
    end

    if love.keyboard.isDown("down") then
        local moveForce = vector2.new(0, movementForce)
        acceleration = vector2.applyForce(moveForce, mass, acceleration)
        idle= false
    end

    punch.direction= direction
    
    if friction.x * acceleration.x >= (0.7*dt) then
        velocity.x = 0
    end

    if friction.y * acceleration.y >= (0.7*dt) then
        velocity.y = 0
    end

    velocity = vector2.add(velocity, vector2.mult(acceleration, dt))
    velocity = vector2.limit(velocity, maxvelocity)
    playerposition = vector2.add(playerposition, vector2.mult(velocity, dt))
-- Movement End

-- Player Movement Restrictions start
    wave = GetWave()
    if playerposition.y < love.graphics.getHeight()  -200 - playersize.y then
        playerposition.y = love.graphics.getHeight() -200 - playersize.y
    end

    if playerposition.y > love.graphics.getHeight() + 80 - playersize.y then
        playerposition.y = love.graphics.getHeight() + 80 - playersize.y
    end

    if playerposition.x < (playersize.x/2)*0.3 then
       playerposition.x = (playersize.x /2)*0.3
    end

    if playerposition.x > 800 - playersize.x and #enemy > 0 and wave == 1 then
        playerposition.x = 800 -playersize.x
    end

    if playerposition.x > 1600 - playersize.x and #enemy > 0 and wave == 2 then
        playerposition.x = 1600 - playersize.x
    end

    if playerposition.x > 3200 - playersize.x and #enemy > 0 and wave == 3 then
        playerposition.x = 3200 - playersize.x
    end

    if playerposition.x > 4700 - playersize.x and #enemy > 0 and wave == 4 then
        playerposition.x = 4700 - playersize.x
    end

    if playerposition.x > 5075  then
        EndStage = true
    end

    if playerposition.x > 6050 - playersize.x  then
        playerposition.x = 6050 - playersize.x
    end

    if EndStage == true and playerposition.x < 5075  then
        playerposition.x = 5075
    end

    if wallsUp == true then
        if teleported == false then
            playerposition = vector2.new(5450,500)
            velocity = vector2.new(0,0)
            teleported = true
        end

        if playerposition.x >= 5700 - playersize.x then
            playerposition.x = 5700 - playersize.x
        end

        if playerposition.x < 5400  then
            playerposition.x = 5400
        end

        if playerposition.y < love.graphics.getHeight()  -200 - playersize.y then
            playerposition.y = love.graphics.getHeight() -200 - playersize.y
        end

        if playerposition.y > love.graphics.getHeight() + 80 - playersize.y then
            playerposition.y = love.graphics.getHeight() + 80 - playersize.y
        end
    end
    if love.keyboard.isDown("l") then
        playerposition.x= 5100
        playerposition.y= 500
    end
--Movement End

    attackPause= attackPause+ dt

--Weapon Start
    if weapon ~= nil then
        if weapon.durability <0 then
            attacking= false
            weapon.groundTimer= 100
            BreakWeapon()
        end
    end

    if weapon~= nil then
        if weapon.type== 1 then
            PlayerAttackRS.timing= weapon.attSp/4
            PlayerAttackLS.timing= weapon.attSp/4
        else
            PlayerAttackRA.timing= weapon.attSp/4
            PlayerAttackLA.timing= weapon.attSp/4
        end

        weapon.position.x=playerposition.x+playersize.x/2
        weapon.position.y=playerposition.y+playersize.y/2
        weapon.cooldownTimer=(weapon.cooldownTimer + dt)


        weapon.direction= direction

        if love.keyboard.isDown("x") and weapon ~= nil  then
            weapon = nil
        end
    end

    if weapon ~= nil and love.keyboard.isDown("c") then
        idle= false
    end

    if weapon ~= nil and attacking==false and love.keyboard.isDown("c") and weapon.cooldownTimer>weapon.attSp and attackPause>weapon.attSp*1.5 then --attack
        attacking= true
        weapon.cooldownTimer= 0
    end

    if weapon ~= nil and weapon.cooldownTimer> weapon.attSp and attacking== true then
        attacking= false
        weapon.cooldownTimer=0
        attackPause= 0
    end
--Weapon End



        punch.position.x=playerposition.x+playersize.x/2
        punch.position.y=playerposition.y+playersize.y/2


        punch.cooldownTimer= punch.cooldownTimer+ dt

        if love.keyboard.isDown("v") then
            idle= false
        end
        if love.keyboard.isDown("v") and (punch.cooldownTimer>punch.attackSpeed) and attackPause>punch.attackSpeed*1.5 and punch.attacking==false then
            punch.attacking= true
            punch.cooldownTimer= 0
        end

        if punch.cooldownTimer>punch.attackSpeed and punch.attacking== true then
            punch.attacking= false
            punch.cooldownTimer= 0
            attackPause= 0
        end
end




function DrawPlayer()
    --love.graphics.setColor(1, 1, 1)
    --love.graphics.rectangle("fill", playerposition.x, playerposition.y, playersize.x, playersize.y)
    --love.graphics.setColor(0, 0, 0)
    --love.graphics.rectangle("line",playerposition.x, playerposition.y, playersize.x, playersize.y)
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill",playerposition.x, playerposition.y-15, playersize.x, 7.5)

    if health>0 then
        love.graphics.setColor(0, 1, 0.5)
        love.graphics.rectangle("fill",playerposition.x, playerposition.y-15, playersize.x*health/maxHealth, 7.5)
    end


    love.graphics.setColor(0, 0, 0)
    --love.graphics.rectangle("fill", punch.position.x, punch.position.y, punch.direction*punch.size.x, punch.size.y)
    love.graphics.rectangle("line",playerposition.x, playerposition.y-15, playersize.x, 7.5)



    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(active.playerSheet, active.spritesheetQuads[active.animationframe],playerposition.x, playerposition.y, 0, 1, 1, 48)

end







--General Info
function GetEndstage()
    return EndStage
end

function Getcamerareset()
    return BackUpCam
end

function GetPlayerPosition()
    return playerposition
end

function GetPlayerSize()
    return playersize
end

function GetPlayerVelocity()
    return velocity
end

function UpdatePlayerHealth()
    if health == 0 then
        return true
    else
        return false
    end
end

function GetGameover()
    if health < 0 then
        return true
    else
        return false
    end
end
--Info End

function DamagePlayer(damage)
    if god == false then
        health=health-damage
    end
end

--Weapon Related
function AssignWeapon(array, id)
    weapon= array[id]
end

function BreakWeapon()
    love.audio.play(breakw)
    weapon= nil
end

function DamageWeapon(weapon)
    weapon.durability= weapon.durability- 1
    return weapon.durability
end

function GetPlayerWeapon()
    return weapon
end

function GetAttack()
    return attacking
end
-- Weapon End


function CreatePunch(x, y, w, h)
    return{position=vector2.new(x,y), size=vector2.new(w,h), attackSpeed= 0.2, damage=3, direction=0, attacking=false,
     grabbed=true,dropY= 0,cooldownTimer=0,cooldownDraw=0}
end

function GetPunch()
    return punch
end