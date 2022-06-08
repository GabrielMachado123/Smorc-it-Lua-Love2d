local mass= 1
local playerWeapon= {}
local spawned = 0
local walls = false

local hurt= love.audio.newSource("Hurt.wav", "static")
local hurtPlayed= false
local hurtTimer=0



function CreateBoss(x, y, w, h, t)
    local health
    local attackSpeed
    local maxvelocity
    local damage
    local maxHealth
    local random
    if t == 1 then
        random= love.math.random(-30, 50)
        health= 1500
        attackSpeed= 1
        maxvelocity= 300
        damage= 1
        maxHealth = 1500
    elseif t == 2 then
        random= love.math.random(-30, 40)
        health=150
        attackSpeed = 3
        maxvelocity= 900
        damage= 0.5
        maxHealth = 150
    elseif t == 3 then
        random= love.math.random(-4, 6)
        health =200
        attackSpeed = 1
        maxvelocity = 400
        damage = 1
        maxHealth = 200
    end
    return{position=vector2.new(x,y), size=vector2.new(w,h), type= t, health=health, attSp= attackSpeed, maxvelocity= maxvelocity, damage=damage, attacking=false, 
    attackLength= 0, growing=false, maxHealth=maxHealth,delay = 1,
    KnockBack = false, KnockBackTimer = 0,KnockBackCooldown = 0.05,KnockBackDirection = vector2.new(0,0), eType= 2, randomDist= random,bossattacking = false, hurt = false}
end

local BossWalkL = {
    boss = love.graphics.newImage("Boss_Walk_Left.png"),
    spritesheetQuads = {},
    animationframe = 1,
    animationframetimer = 0,
    col = 4,
    timing = 0.1
}

local BossWalkRight = {
    boss = love.graphics.newImage("Boss_Walk_Rightt.png"),
    spritesheetQuads = {},
    animationframe = 1,
    animationframetimer = 0,
    col = 4,
    timing = 0.1
}

local BossesAttacks = {
    boss = love.graphics.newImage("Boss_Final_Attack_Left.png"),
    spritesheetQuads = {},
    animationframe = 1, 
    animationframetimer = 0 ,
    col = 7,
    timing = 0.1
}

local BossesAttacksR = {
    boss = love.graphics.newImage("Boss_Final_AttackRight.png"),
    spritesheetQuads = {},
    animationframe = 1, 
    animationframetimer = 0 ,
    col = 7,
    timing = 0.1
}

local GnomeWalkR = {
    gnome = love.graphics.newImage("Gnome_Walk_Right.png"),
    spritesheetQuads = {},
    animationframe = 1, 
    animationframetimer = 0 ,
    col = 3,
    timing = 0.1
}

local GnomeWalkL = {
    gnome = love.graphics.newImage("Gnome_Walk_Left.png"),
    spritesheetQuads = {},
    animationframe = 1, 
    animationframetimer = 0 ,
    col = 3,
    timing = 0.1
}

local GnomeAttackR = {
    gnome = love.graphics.newImage("Gnome_Attack_Right.png"),
    spritesheetQuads = {},
    animationframe = 1, 
    animationframetimer = 0 ,
    col = 7,
    timing = 0.1
}

local GnomeAttackL = {
    gnome = love.graphics.newImage("Gnome_Attack_Left.png"),
    spritesheetQuads = {},
    animationframe = 1, 
    animationframetimer = 0 ,
    col = 6,
    timing = 0.1
}

local HeavyWalkL = {
    He = love.graphics.newImage("Boss_Heavy_Walk_Left.png"),
    spritesheetQuads = {},
    animationframe = 1, 
    animationframetimer = 0 ,
    col = 4,
    timing = 0.1
}

local HeavyWalkR = {
    He = love.graphics.newImage("Boss_Heavy_Walk_Right.png"),
    spritesheetQuads = {},
    animationframe = 1, 
    animationframetimer = 0 ,
    col = 4,
    timing = 0.1
}

local HeavyAttackL = {
    He = love.graphics.newImage("Boss_Heavy_Attack_LEft.png"),
    spritesheetQuads = {},
    animationframe = 1,
    animationframetimer = 0 ,
    col = 4,
    timing = 0.1
}

local HeavyAttackR = {
    He = love.graphics.newImage("Boss_Heavy_Attack_Right.png"),
    spritesheetQuads = {},
    animationframe = 1, 
    animationframetimer = 0 ,
    col = 4,
    timing = 0.1
}

local active = {}
local active2 = GnomeWalkL
local active3 = HeavyWalkR

function DrawBoss(sortedBoss)

        --love.graphics.setColor(0, 1, 0)
        --love.graphics.rectangle("fill", sortedBoss.position.x+ sortedBoss.size.x/2, sortedBoss.position.y+ sortedBoss.size.y/4, sortedBoss.attackLength, 10)

        if sortedBoss.type== 1 then
            love.graphics.setColor(1, 1, 1)
            love.graphics.draw(active.boss, active.spritesheetQuads[active.animationframe],sortedBoss.position.x+ sortedBoss.size.x/2, sortedBoss.position.y+ sortedBoss.size.y/2, 0, 1, 1, 48,48 )

        elseif sortedBoss.type == 2  then
            love.graphics.setColor(1, 1, 1)
            love.graphics.draw(active2.gnome, active2.spritesheetQuads[active2.animationframe],sortedBoss.position.x+ sortedBoss.size.x/2, sortedBoss.position.y+ sortedBoss.size.y/4, 0, 1, 1, 16,16 )

        elseif sortedBoss.type == 3 then
            love.graphics.setColor(1, 1, 1)
            love.graphics.draw(active3.He,active3.spritesheetQuads[active3.animationframe],sortedBoss.position.x+ sortedBoss.size.x/2, sortedBoss.position.y+ sortedBoss.size.y/4, 0, 1, 1, 48,48 )

        end
        --love.graphics.rectangle("fill", sortedBoss.position.x, sortedBoss.position.y, sortedBoss.size.x, sortedBoss.size.y)
        love.graphics.setColor(1, 0, 0)
        love.graphics.rectangle("fill", sortedBoss.position.x, sortedBoss.position.y-15, sortedBoss.size.x, 7.5)
        love.graphics.setColor(0, 1, 0.5)
        love.graphics.rectangle("fill", sortedBoss.position.x, sortedBoss.position.y-15, (sortedBoss.health*sortedBoss.size.x)/sortedBoss.maxHealth, 7.5)
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("line", sortedBoss.position.x, sortedBoss.position.y-15, sortedBoss.size.x, 7.5)
        --love.graphics.setColor(0, 0, 0)
        --love.graphics.rectangle("line", sortedBoss.position.x, sortedBoss.position.y, sortedBoss.size.x, sortedBoss.size.y)
end

function LoadBoss()
    BossWalkL.spritesheetQuads = CreateSpriteSheetQuads(BossWalkL.boss, 4,1,96,96)
    BossesAttacks.spritesheetQuads = CreateSpriteSheetQuads(BossesAttacks.boss,7,1,96,96)
    BossesAttacksR.spritesheetQuads = CreateSpriteSheetQuads(BossesAttacksR.boss,7,1,96,96)
    BossWalkRight.spritesheetQuads = CreateSpriteSheetQuads(BossWalkRight.boss,4,1,96,96)

    GnomeWalkL.spritesheetQuads = CreateSpriteSheetQuads(GnomeWalkL.gnome,3,1,32,32)
    GnomeWalkR.spritesheetQuads = CreateSpriteSheetQuads(GnomeWalkR.gnome,3,1,32,32)
    GnomeAttackR.spritesheetQuads = CreateSpriteSheetQuads(GnomeAttackR.gnome,7,1,32,32)
    GnomeAttackL.spritesheetQuads = CreateSpriteSheetQuads(GnomeAttackL.gnome,6,1,32,32)

    HeavyWalkR.spritesheetQuads = CreateSpriteSheetQuads(HeavyWalkR.He,4,1,96,96)
    HeavyWalkL.spritesheetQuads = CreateSpriteSheetQuads(HeavyWalkL.He,4,1,96,96)
    HeavyAttackL.spritesheetQuads = CreateSpriteSheetQuads(HeavyAttackL.He,4,1,96,96)
    HeavyAttackR.spritesheetQuads = CreateSpriteSheetQuads(HeavyAttackR.He,4,1,96,96)
end

function GetWalls()
    return walls
end

function UpdateBoss(boss,dt,frictionCoef)
    
    local BossStage = GetEndstage()
    local playerPos=GetPlayerPosition()
    local playerSize=GetPlayerSize()

    if dt<0.05 then
            if  BossStage == true and spawned == 0  then
                table.insert( boss,CreateBoss(5500,470, 60, 100, 1))
                spawned = 1
            end 

                for i=1, #boss do
                    if boss[i] then
            if  boss[1].health < 1000 and spawned == 1 then 
                table.insert(boss,CreateBoss(6000,470,20,30,2))
                table.insert(boss,CreateBoss(5500,620,40,60,3))
                table.insert(boss,CreateBoss(5100,620,40,60,3))
                boss[1].damage = 2
                boss[1].attackSpeed = 1.5
                boss[1].maxvelocity = 400
                spawned = 2

            elseif boss[1].health < 500 and spawned == 2 then
                boss[1].damage = 2.5
                boss[1].attackSpeed = 2
                boss[1].maxvelocity = 500
                boss[1].position.x = 5600
                boss[1].position.y = 470
                spawned = 4
                walls = true
            end

            if boss[i].KnockBack == true and boss[i].type > 3 then
                boss[i].KnockBackTimer = boss[i].KnockBackTimer+dt

            if  boss[i].KnockBackTimer < boss[i].KnockBackCooldown then 
                local movement = vector2.mult(boss[i].KnockBackDirection,7500)
                local velocity = vector2.new(0,0)

            velocity= vector2.add(velocity, movement)
            velocity=vector2.limit(velocity, boss[i].maxvelocity)
            velocity= vector2.mult(velocity, dt)
            boss[i].position= vector2.add(boss[i].position, velocity)
            elseif  boss[i].KnockBackTimer > boss[i].KnockBackCooldown  then
                boss[i].KnockBack = false
                boss[i].KnockBackTimer = 0   
            end 
        elseif math.abs(boss[i].position.x-playerPos.x)<2000 then

                    local velocity= vector2.sub(vector2.new(playerPos.x, playerPos.y+ boss[i].randomDist), boss[i].position)
                    velocity= vector2.normalize(velocity)
                    velocity= vector2.mult(velocity, 100)

                        if velocity.x > 0 and boss[i].bossattacking == false and boss[i].type == 1 then 
                            active= BossWalkRight
                        elseif velocity.x < 0 and boss[i].bossattacking == false and boss[i].type == 1 then 
                            active= BossWalkL

                        elseif boss[i].bossattacking == true and boss[i].type == 1 and boss[i].position.x < playerPos.x then
                            active= BossesAttacksR
                            boss[i].attacking = false

                        elseif boss[i].bossattacking == true and boss[i].type == 1 and boss[i].position.x > playerPos.x then   
                            active=BossesAttacks
                            boss.attacking = false
                        end

                        if velocity.x > 0 and boss[i].bossattacking == false and boss[i].type == 2 then 
                            active2= GnomeWalkR

                        elseif  velocity.x < 0 and boss[i].bossattacking == false and boss[i].type == 2 then 
                            active2= GnomeWalkL

                        elseif boss[i].bossattacking == true and boss[i].type == 2 and boss[i].position.x < playerPos.x then
                            active2= GnomeAttackR
                            boss[i].attacking = false

                        elseif boss[i].bossattacking == true and boss[i].type == 2 and boss[i].position.x > playerPos.x then
                            active2= GnomeAttackL
                            boss[i].attacking = false
                        end

                        if velocity.x > 0 and boss[i].bossattacking == false and boss[i].type == 3 then 
                            active3= HeavyWalkR

                        elseif  velocity.x < 0 and boss[i].bossattacking == false and boss[i].type == 3 then 
                            active3= HeavyWalkL

                        elseif boss[i].bossattacking == true and boss[i].type == 3 and boss[i].position.x < playerPos.x then
                            active3= HeavyAttackR
                            boss[i].attacking = false

                        elseif boss[i].bossattacking == true and boss[i].type == 3 and boss[i].position.x > playerPos.x then
                            active3= HeavyAttackL
                            boss[i].attacking = false
                        end
                        


                    
                    if i == 1 then  
                        active.animationframetimer = active.animationframetimer + dt
                        if active.animationframetimer > active.timing then
                            active.animationframe = active.animationframe + 1
                            if active.animationframe > active.col then
                                active.animationframe = 1
                            end
                            active.animationframetimer = 0
                        end
                    end
                        if i == 2 then
                        active2.animationframetimer = active2.animationframetimer + dt
                        if active2.animationframetimer > active2.timing then
                            active2.animationframe = active2.animationframe + 1
                            if active2.animationframe > active2.col then
                                active2.animationframe = 1
                            end
                            active2.animationframetimer = 0
                        end
                    end
                    if i >= 3 then 
                        active3.animationframetimer = active3.animationframetimer + dt
                        if active3.animationframetimer > active3.timing then
                            active3.animationframe = active3.animationframe + 1
                            if active3.animationframe > active3.col then
                                active3.animationframe = 1
                            end
                            active3.animationframetimer = 0
                        end

                    end


                    local friction = vector2.mult(velocity, -1)
                    friction = vector2.normalize(friction)
                    friction = vector2.mult(friction, frictionCoef)

                   local acceleration= vector2.new(0, 0)
                    acceleration= vector2.applyForce(friction, mass, acceleration)
                    acceleration= vector2.applyForce(velocity, mass, acceleration)
                    acceleration= vector2.mult(acceleration, dt)



                    local futurevelocity=vector2.add(velocity, acceleration)
                    futurevelocity=vector2.limit(futurevelocity, boss[i].maxvelocity)
                    futurevelocity= vector2.mult(futurevelocity, dt)

                    

                    if math.abs((boss[i].position.x + boss[i].size.x/2)- (playerPos.x + playerSize.x /2))<boss[i].size.x + 10 and math.abs(boss[i].position.y- playerPos.y)<50 then
                        velocity.x= 0
                        acceleration.x= 0
                        BossAttack(boss[i], playerPos, dt, playerSize)
                    else
                        boss[i].attackLength=0
                    end

                    velocity= vector2.add(velocity, acceleration)
                    velocity=vector2.limit(velocity, boss[i].maxvelocity)
                    velocity= vector2.mult(velocity, dt)
                    boss[i].position= vector2.add(boss[i].position, velocity)
                end

                if love.keyboard.isDown("o") == true  and math.abs(boss[i].position.x-playerPos.x)<1000 then
                    DamageBoss(boss, 5, i)
                    boss[i].delay= 0
                end

                boss[i].delay=boss[i].delay+dt

                --Damage Boss Start
                playerWeapon= GetPlayerWeapon()
            if playerWeapon~= nil then
                local playerAttack= GetAttack()

                if playerAttack== true and playerWeapon.direction>0 and CheckCollision(playerWeapon.position.x, playerWeapon.position.y, playerWeapon.size.x, playerWeapon.size.y,
                boss[i].position.x, boss[i].position.y, boss[i].size.x, boss[i].size.y)== true then
                    DamageWeapon(playerWeapon)
                    DamageBoss(boss, playerWeapon.damage, i)
                    boss[i].KnockBackDirection = vector2.new(1,0)
                    boss[i].delay=0
                    boss[i].KnockBack = true
                    break
                end

                if playerAttack== true and playerWeapon.direction<0 and CheckCollision(playerWeapon.position.x-playerWeapon.size.x, playerWeapon.position.y, playerWeapon.size.x, playerWeapon.size.y,
                boss[i].position.x, boss[i].position.y, boss[i].size.x, boss[i].size.y)== true then
                    DamageWeapon(playerWeapon)
                    DamageBoss(boss, playerWeapon.damage, i)
                    boss[i].KnockBackDirection = vector2.new(-1,0)
                    boss[i].delay=0
                    boss[i].KnockBack = true
                    break
                end
            end

            local punch= GetPunch()
                if punch.direction>0 and punch.attacking==true and CheckCollision(punch.position.x, punch.position.y, punch.size.x, punch.size.y, 
                boss[i].position.x, boss[i].position.y, boss[i].size.x, boss[i].size.y)== true then

                    if boss[i].delay>-1 then --ataque para direita
                    DamageBoss(boss, punch.damage, i)
                    boss[i].KnockBackDirection = vector2.new(1,0)
                    boss[i].delay=0
                    boss[i].KnockBack = true
                    break
                   end

                elseif punch.direction<0 then --ataque para esquerda
                    if punch.attacking==true and CheckCollision(punch.position.x-punch.size.x, punch.position.y, punch.size.x, punch.size.y, 
                    boss[i].position.x, boss[i].position.y, boss[i].size.x, boss[i].size.y)== true then

                        if boss[i].delay>-1 then
                            DamageBoss(boss, punch.damage, i)
                            boss[i].KnockBackDirection = vector2.new(-1,0)
                            boss[i].KnockBack = true 
                            boss[i].delay=0
                            break
                        end
                    end
                end

                hurtTimer= hurtTimer+dt

                if hurtPlayed== true and hurtTimer>0.3 then
                    hurtPlayed= false
                    hurtTimer=0
                end
                --Damage Boss End

                if boss[i].health<0 then
                    KillBoss(boss, i)
                end
                end
            end
        end
    end


function DamageBoss(boss, damage, i)
    if hurtPlayed== false then
        love.audio.play(hurt)
        hurtPlayed= true
    end
    boss[i].health= boss[i].health- damage
    return boss[i].health
    end

function KillBoss(boss, i)
    table.remove(boss, i)
    return boss[i]
end

function GetWin(boss)
    local BossStage = GetEndstage()
    if #boss == 0 and BossStage == true then
        return true
    end
end

function BossAttack(boss, playerPos, dt, playerSize)
    if boss.position.x> playerPos.x then
        if boss.attackLength> -75 and boss.growing==true then
                boss.bossattacking = true
            boss.attackLength= boss.attackLength- boss.attSp*250*dt
        elseif boss.attackLength<= -75 then
            boss.growing=false
        end
        if boss.attackLength<0 and boss.growing==false then
            boss.attackLength= boss.attackLength+ boss.attSp*350*dt
        elseif boss.attackLength>= 0 then
            boss.growing= true
        end
    elseif boss.position.x< playerPos.x then
        if boss.attackLength< 75 and boss.growing==true then
            boss.bossattacking = true
            boss.attackLength= boss.attackLength+ boss.attSp*250*dt
        elseif boss.attackLength>= 75 then
            boss.growing=false
        end
        if boss.attackLength>0 and boss.growing==false then
            boss.attackLength= boss.attackLength- boss.attSp*350*dt
        elseif boss.attackLength<= 0 then
            boss.growing= true
        end
    end

    local bossweapon={
        position= vector2.new(0, 0),
        size= vector2.new(0, 0)
    }

    bossweapon.position.x=  boss.position.x+(boss.size.x/2)
    bossweapon.position.y=  boss.position.y+( boss.size.y/4)
    bossweapon.size.x=  boss.attackLength
    bossweapon.size.y= 10
    local player= {
        position= playerPos,
        size= playerSize
    }
    CheckBossWeaponCollision(bossweapon, player, boss)
end

function CheckBossWeaponCollision(bossweapon, player, boss)

    if CheckCollision(bossweapon.position.x, bossweapon.position.y, bossweapon.size.x, bossweapon.size.y, player.position.x, player.position.y, player.size.x, player.size.y)== true and bossweapon.size.x>0 then
        DamagePlayer(boss.damage)

    elseif bossweapon.size.x<0 then
        if CheckCollision(bossweapon.position.x+bossweapon.size.x, bossweapon.position.y, -bossweapon.size.x, bossweapon.size.y, player.position.x, player.position.y, player.size.x, player.size.y)== true then
            DamagePlayer(boss.damage)

        end
    end
end