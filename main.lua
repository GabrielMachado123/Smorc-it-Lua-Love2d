require "vector2"
require "player"
require "enemies"
require "weapons"
require "camera"
require "menu"
require "collision"
require "boss"
require "TiledMap"
require "SortY"
require "conf"


local menuSound = love.audio.newSource("Menu.wav", "static")
local overButton = love.audio.newSource("Hover.wav", "static")
local Menuplayed= false

local fireBall= love.audio.newSource("Fire.wav", "static")
fireBall:setVolume(0.2)
local firePlayed= false
local flash= false
local flashTimer=0

local GameOverSound= love.audio.newSource("GameOver.wav", "static")
local GameOverPlayed= false
GameOverSound:setVolume(0.2)
local WinSound= love.audio.newSource("GameWin.wav", "static")
local WinPlayed= false
WinSound:setVolume(0.2)

local frictioncoefficient = 500
local Buttons = {}
local font = nil
local Reset= false
local enemy= {}
local started = false
local camera= {}
local boss = {}
local weapons = {}
local GameState = 0
local Respawn = {}
local Dead
local wallsUp
local Win
local WinB = {}
local playerposition = GetPlayerPosition()
local punch={}
local Pause = {}
local map = {}
local fire = {}
local fire2 = {}
local grassM = {}
local orc = {
  position = vector2.new(100, 200),
  spritesheet = love.graphics.newImage("OrcIdle.png"),
  spritesheetQuads = {},
  animationframe = 1,
  animationframetimer = 0
  }





function love.load()
  LoadOrc(orc)
  LoadBoss()
  grassM = LoadGrass("AnimatedGrass")
  fire2 = LoadFire2("BossSpell")
  map = LoadTiledMap("Smorc-itMap")
  fire = LoadFire("Fire")
  Dead = love.graphics.newImage("gameOver.png")
  Win = love.graphics.newImage("victory.png")

  weapons[1]=CreateWeapon(100,500,65,10,1)

  punch=CreatePunch(0,0,40,10)

  font = love.graphics.newFont(32)

  table.insert(Buttons, NewButton("Start Game", function () love.audio.play(menuSound) started= true end))
  table.insert(Buttons, NewButton("Exit", function () love.event.quit(0) end))
  --table.insert(Respawn,NewButton("Try Again", function() started = true GameState = 0  Reset = false  end))
  table.insert(Respawn, NewButton("Exit", function () love.event.quit(0) end))
  table.insert(WinB,NewButton("Exit", function () love.event.quit(0) end))
  table.insert(Pause,NewButton("Resume", function () love.audio.play(menuSound) GameState = 0 end))
  table.insert(Pause,NewButton("Exit", function () love.event.quit(0) end))
end



function love.update(dt)
  if love.keyboard.isDown("escape") then
    love.event.quit()
  end
  PlayMusic(GameState, started, Reset, dt)

  local over= GetHover()
  if over then
    if Menuplayed== false then
      Menuplayed= true
      love.audio.play(overButton)
    end
  else
    Menuplayed= false
  end

  if GetGameover() == true then
    GameState = 1
  elseif GetWin(boss)  == true then
    GameState = 2
  end

  camera=GetCamera()
  if GameState == 0 then
    grassM:update(dt)
    UpdadateOrc(orc,dt)
    if started == true then
      fire2:update(dt)
      fire:update(dt)
      PlayMusic(GameState, started, Reset, dt)
      Sort(enemy, boss)
      UpdatePlayer(dt, frictioncoefficient, enemy, punch)
      UpdateWeapon(weapons,dt)
      UpdateEnemy(enemy, dt, frictioncoefficient)
      UpdateBoss(boss,dt, frictioncoefficient)
      UpdateCamera()
      if firePlayed then
        flashTimer= flashTimer+dt
      end
      Reset = GetEndstage()
    end
  end
  wallsUp = GetWalls()
end




function love.draw()
  if GameState == 0 then
    camera:set()
    love.graphics.setColor(1,1,1)
    map:draw()
    DrawForest()
    if Reset == true then
      love.graphics.setColor(1,1,1)
      fire:draw()
    end


    if wallsUp == true then
      if firePlayed== false then
        love.audio.play(fireBall)
        firePlayed= true
      end
      love.graphics.setColor(1,1,1)
      fire2:draw()
    end

    DrawWeapon()
    if started== true then
      SortedDraw(playerposition.y)
    end

    camera:unset()
    if started == false then
      grassM:draw()
      DrawOrc(orc)
      DrawMenu(Buttons,font)
    end

    if firePlayed== true and flash== false then
      love.graphics.rectangle("fill", 0, 0, 1000, 1000)
      if flashTimer> 0.05 then
        flash= true
      end
    end


  elseif GameState == 2 then
    if WinPlayed== false then
      love.audio.play(WinSound)
      WinPlayed= true
    end
    DrawWinBAck(Win)
    DrawEnd(WinB,font)

  elseif GameState == 1 then
    if GameOverPlayed== false then
      love.audio.play(GameOverSound)
      GameOverPlayed= true
    end
    DrawEndBAck(Dead)
    DrawEnd(Respawn,font)

  elseif GameState== 3 then
    camera:set()
    love.graphics.setColor(1, 1, 1)
    map:draw()
    DrawForest()
    if Reset == true then
      love.graphics.setColor(1,1,1)
      fire:draw()
    end
    if wallsUp == true then
      love.graphics.setColor(1,1,1)
      fire2:draw()
    end
    camera:unset()
    love.graphics.setColor(0.5, 0.5, 0.5, 0.75)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    DrawSlider()
    DrawMenu(Pause,font)
    
  end
end

function RandomCheck(percentage)
  if love.math.random (1, 100)<= percentage then
    return true
  else
    return false
  end
end

function love.keypressed(key)
  if key == "backspace"  and started== true and (GameState==0 or GameState==3) then
    love.audio.play(menuSound)
    if GameState>2 then
      GameState=0
    else
      GameState= 3
    end
  end
end