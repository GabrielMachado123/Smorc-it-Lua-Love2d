local world = {}
local tileSize  = 16
local worldconfig = {
  worldsizeX = 388,
  worldsizeY = 44,
  worldDisplayX = 388,
  worldDisplayY = 22 
}
local tileset
local tilesetQuads = {}

function Linesinmap()
    for i = 1, 60, 1 do
        love.graphics.setColor(0,0.2,1)
        love.graphics.rectangle("fill",(100*i),340,50,340)
    end
end

function DrawTree()
    for i = 1, 60, 1 do
    love.graphics.setColor(0.345, 0.219, 0.054)
    love.graphics.rectangle("fill", 500*i, 200, 50, 140)

    love.graphics.setColor(0.007, 0.450, 0.050)
    love.graphics.circle("fill", 30 + i*500, 140, 80)
    end
end

function DrawClouds()
    for i = 10, 150, 10 do
      love.graphics.setColor(1, 1, 1)
      love.graphics.circle("fill",i*70, 100,40)
      love.graphics.setColor(1, 1, 1)
      love.graphics.circle("fill", (i*70)-50, 100,40)
      love.graphics.setColor(1, 1, 1)
      love.graphics.circle("fill", (i*70)-100, 100, 40)
      love.graphics.setColor(1, 1, 1)
      love.graphics.circle("fill", (i*70)-150, 100, 40)
    end
end
function LoadWorld(filename)
    local file = io.open(filename)
    local matrix = {}
    local i = 1
  
    for line in file:lines() do
      matrix[i] = {}
      for j = 1, #line, 1 do
         matrix[i][j] = line:sub(j,j)
    end
     i = i + 1
  end
  file:close()
  return matrix
  end

  function CreateSpriteSheetQuads(spritesheet, cols, rows, w, h)
    local quads = {}
    local count = 1
    for j = 0, rows - 1, 1 do
        for i = 0, cols - 1, 1 do
            quads[count] = love.graphics.newQuad(i * w, j * h, w, h, spritesheet:getWidth(), spritesheet:getHeight())
            count = count + 1
   end
  end
  return quads
  end

function DrawMap(camera)
    love.graphics.setColor(1,1,1)
    local fristtilex = math.floor(camera.x / tileSize)
    local offsetx = math.floor(camera.x % tileSize)

    for i = 1, worldconfig.worldDisplayY, 1 do

        for j = 1, worldconfig.worldDisplayX, 1 do

         if world[i][j + fristtilex] == '1' then
            love.graphics.draw(tileset,tilesetQuads[1],(j*tileSize)-tileSize - offsetx,(i*tileSize)-tileSize + 340)

         elseif world[i][j+ fristtilex] == '2' then
            love.graphics.draw(tileset,tilesetQuads[2],(j*tileSize)-tileSize  - offsetx,(i*tileSize)-tileSize + 340)

         elseif world[i][j+ fristtilex] == '3' then
            love.graphics.draw(tileset,tilesetQuads[3],(j*tileSize)-tileSize  - offsetx,(i*tileSize)-tileSize + 340)

         elseif world[i][j+ fristtilex] == '4' then 
            love.graphics.draw(tileset,tilesetQuads[4],(j*tileSize)-tileSize  - offsetx,(i*tileSize)-tileSize + 340)

        elseif world[i][j+ fristtilex] == '5' then
            love.graphics.draw(tileset,tilesetQuads[5],(j*tileSize)-tileSize  - offsetx,(i*tileSize)-tileSize + 340)

          elseif world[i][j+ fristtilex] == '6' then
            love.graphics.draw(tileset,tilesetQuads[6],(j*tileSize)-tileSize  - offsetx,(i*tileSize)-tileSize + 340)

          elseif world[i][j+ fristtilex] == '7' then
            love.graphics.draw(tileset,tilesetQuads[7],(j*tileSize)-tileSize  - offsetx,(i*tileSize)-tileSize + 340)

          elseif world[i][j+ fristtilex] == '8' then
            love.graphics.draw(tileset,tilesetQuads[8],(j*tileSize)-tileSize  - offsetx,(i*tileSize)-tileSize + 340)

          elseif world[i][j+ fristtilex] == '9' then
            love.graphics.draw(tileset,tilesetQuads[9],(j*tileSize)-tileSize  - offsetx,(i*tileSize)-tileSize + 340)

          end
        end
      end
end

function LoadMap()
    world = LoadWorld("Map.txt")
  tileset = love.graphics.newImage("GroundTileset.png")
  tilesetQuads = CreateSpriteSheetQuads(tileset,3,3,tileSize,tileSize)
    
end