require "player"

local PickUp= love.audio.newSource("PickUp.wav", "static")
PickUp:setVolume(0.5)

local weapons = {}
local god = false
local playerWeapon


function CreateWeapon(x, y, w, h, t)
    local attackSpeed
    local damage
    local durability
    if t == 1 then
        attackSpeed= 0.3
        damage= 2
        durability = 250
    elseif t== 2 then
        attackSpeed=0.4
        damage = 4
        durability = 300
    end
    return{position=vector2.new(x,y), size=vector2.new(w,h), type= t, attSp= attackSpeed, damage=damage, direction=0, attacking=false,
     grabbed=false, dropped=false, dropY= 0, groundTimer= 0, durability=durability, cooldownTimer=0}
end


    local sword = love.graphics.newImage("DroppedS-Sheet.png")
    local axe = love.graphics.newImage("DroppedA-Sheet.png")


function DrawWeapon()
    for i=1, #weapons do
        if weapons[i]~= playerWeapon then
            if weapons[i].type== 0 then

            --love.graphics.setColor(0, 1, 0.054)

        elseif weapons[i].type== 1 then  --light

            --love.graphics.setColor(0.2, 0, 0.5)
            love.graphics.setColor(1, 1, 1)
            love.graphics.draw(sword,weapons[i].position.x, weapons[i].position.y-8, 0, 1, 1, 0,0 )

        elseif weapons[i].type== 2 then  --heavy

            --love.graphics.setColor(0.5, 0.5, 0)
            love.graphics.setColor(1, 1, 1)
            love.graphics.draw(axe,weapons[i].position.x, weapons[i].position.y-8, 0, 1, 1, 0,0 )
            end
        end
    end
end


function UpdateWeapon(array,dt)
    weapons= array
    playerWeapon= GetPlayerWeapon()
    for i=1, #weapons do
        if weapons[i] then
            if god == true then
                weapons[i].damage = 400
            end

            if love.keyboard.isDown("h") then
                god = true
            end
            local Player_s = GetPlayerSize()
            local Player_p= GetPlayerPosition()
            local colliding= CheckCollision(weapons[i].position.x, weapons[i].position.y, weapons[i].size.x, weapons[i].size.y,
            Player_p.x, Player_p.y, Player_s.x, Player_s.y)


            if colliding==true and love.keyboard.isDown("z") and playerWeapon == nil then
                weapons[i].groundTimer=0
                AssignWeapon(weapons, i)
                love.audio.play(PickUp)
            end

            
            if weapons[i]~= playerWeapon then
                weapons[i].groundTimer= weapons[i].groundTimer+dt
                if weapons[i].groundTimer> 7 then
                    table.remove(weapons, i)
                end
            end
        end
    end
end



function GetWeapons()
    return weapons
end

function DropWeapon(type, position)
    table.insert( weapons, CreateWeapon(position.x, position.y, 65, 10, type))
end

function EraseWeapons()
    for i= 1, #weapons do
        weapons[i].groundTimer= 100
    end
end