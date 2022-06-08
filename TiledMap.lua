local BackGround = love.graphics.newImage("Forest.png")



function LoadTiledMap(path)
    local map = require(path)
    map.quads = {}
    local tileset = map.tilesets[1]
    map.tileset = tileset
    map.image = love.graphics.newImage(tileset.image)
    for y = 0, (tileset.imageheight / tileset.tileheight) - 1 do
        for x = 0, (tileset.imagewidth / tileset.tilewidth) - 1 do
            local quad = love.graphics.newQuad(x * tileset.tilewidth, y * tileset.tileheight,
             tileset.tilewidth, tileset.tileheight,tileset.imagewidth,tileset.imageheight )
             table.insert(map.quads, quad)
        end 
    end   
    function map:draw()  
        for i, layer in ipairs(self.layers) do 
            for y = 0, layer.height - 1 do 
                for x = 0, layer.width -1 do 
                local index = (x + y * layer.width) + 1
                local tid = layer.data[index]

                if tid ~= 0 then 
                    local quad = self.quads[tid]
                    local xx = x * self.tileset.tilewidth
                    local yy = y * self.tileset.tileheight

                    love.graphics.draw(
                        self.image,
                        quad,
                        xx,
                        yy + 340
                    )
                end 

             end
        end
    end    
end         
    return map 

end 

function LoadFire(path)
    local fire = require(path)
    fire.quads = {}
    local tileset = fire.tilesets[1]
    fire.tileset = tileset
    fire.image = love.graphics.newImage(tileset.image)

    fire.animatedtiles = {}
    for i, tile in ipairs(tileset.tiles) do 
    fire.animatedtiles[tile.id] = tile 
    end

    fire.frame = 0
    fire.timer = 0.0
    fire.maxtimer = 0.1

    for y = 0, (tileset.imageheight / tileset.tileheight) - 1 do
        for x = 0, (tileset.imagewidth / tileset.tilewidth) - 1 do
            local quad = love.graphics.newQuad(x * tileset.tilewidth, y * tileset.tileheight,
             tileset.tilewidth, tileset.tileheight,tileset.imagewidth,tileset.imageheight )
             table.insert(fire.quads, quad)
        end 
    end
    
    function fire:update(dt)
        if self.timer > self.maxtimer then 
            self.frame = self.frame + 1
            self.timer = 0 
        end

        self.timer = self.timer + dt

    end

    function fire:draw()  
        for i, layer in ipairs(self.layers) do 
            for y = 0, layer.height - 1 do 
                for x = 0, layer.width -1 do 
                local index = (x + y * layer.width) + 1
                local tid = layer.data[index]

                if tid ~= 0 then
                    
                    if self.animatedtiles[tid - 1] ~= nil then 
                        local anim = self.animatedtiles[tid-1].animation
                        local numFrames = #anim
                        local index = self.frame % numFrames
                        
                        tid = anim[index + 1].tileid + 1
                    end 
                    local quad = self.quads[tid]
                    local xx = x * self.tileset.tilewidth
                    local yy = y * self.tileset.tileheight

                    love.graphics.draw(
                        self.image,
                        quad,
                        xx + 5000,
                        yy + 340
                    )
                end 

             end
        end
    end    
end         
    return fire 
end 

function LoadFire2(path)
    local fire2 = require(path)
    fire2.quads = {}
    local tileset = fire2.tilesets[1]
    fire2.tileset = tileset
    fire2.image = love.graphics.newImage(tileset.image)

    fire2.animatedtiles = {}
    for i, tile in ipairs(tileset.tiles) do 
    fire2.animatedtiles[tile.id] = tile 
    end

    fire2.frame = 0
    fire2.timer = 0.0
    fire2.maxtimer = 0.1

    for y = 0, (tileset.imageheight / tileset.tileheight) - 1 do
        for x = 0, (tileset.imagewidth / tileset.tilewidth) - 1 do
            local quad = love.graphics.newQuad(x * tileset.tilewidth, y * tileset.tileheight,
             tileset.tilewidth, tileset.tileheight,tileset.imagewidth,tileset.imageheight )
             table.insert(fire2.quads, quad)
        end 
    end
    
    function fire2:update(dt)
        if self.timer > self.maxtimer then 
            self.frame = self.frame + 1
            self.timer = 0 
        end

        self.timer = self.timer + dt

    end

    function fire2:draw()  
        for i, layer in ipairs(self.layers) do 
            for y = 0, layer.height - 1 do 
                for x = 0, layer.width -1 do 
                local index = (x + y * layer.width) + 1
                local tid = layer.data[index]

                if tid ~= 0 then
                    
                    if self.animatedtiles[tid - 1] ~= nil then 
                        local anim = self.animatedtiles[tid-1].animation
                        local numFrames = #anim
                        local index = self.frame % numFrames
                        
                        tid = anim[index + 1].tileid + 1
                    end 
                    local quad = self.quads[tid]
                    local xx = x * self.tileset.tilewidth
                    local yy = y * self.tileset.tileheight

                    love.graphics.draw(
                        self.image,
                        quad,
                        xx + 5000,
                        yy + 340
                    )
                end 

             end
        end
    end    
end         
    return fire2 
end 

function LoadGrass(path)
    local grassM = require(path)
    grassM.quads = {}
    local tileset = grassM.tilesets[1]
    grassM.tileset = tileset
    grassM.image = love.graphics.newImage(tileset.image)

    grassM.animatedtiles = {}
    for i, tile in ipairs(tileset.tiles) do 
    grassM.animatedtiles[tile.id] = tile 
    end

    grassM.frame = 0
    grassM.timer = 0.0
    grassM.maxtimer = 0.1

    for y = 0, (tileset.imageheight / tileset.tileheight) - 1 do
        for x = 0, (tileset.imagewidth / tileset.tilewidth) - 1 do
            local quad = love.graphics.newQuad(x * tileset.tilewidth, y * tileset.tileheight,
             tileset.tilewidth, tileset.tileheight,tileset.imagewidth,tileset.imageheight )
             table.insert(grassM.quads, quad)
        end 
    end
    
    function grassM:update(dt)
        if self.timer > self.maxtimer then 
            self.frame = self.frame + 1
            self.timer = 0 
        end

        self.timer = self.timer + dt

    end

    function grassM:draw()  
        for i, layer in ipairs(self.layers) do 
            for y = 0, layer.height - 1 do 
                for x = 0, layer.width -1 do 
                local index = (x + y * layer.width) + 1
                local tid = layer.data[index]

                if tid ~= 0 then
                    
                    if self.animatedtiles[tid - 1] ~= nil then 
                        local anim = self.animatedtiles[tid-1].animation
                        local numFrames = #anim
                        local index = self.frame % numFrames
                        
                        tid = anim[index + 1].tileid + 1
                    end 
                    local quad = self.quads[tid]
                    local xx = x * self.tileset.tilewidth
                    local yy = y * self.tileset.tileheight

                    love.graphics.draw(
                        self.image,
                        quad,
                        xx ,
                        yy + 340
                    )
                end 

             end
        end
    end    
end         
    return grassM 
end 
    
function DrawForest()
 for i=0,18,1 do 
  love.graphics.draw(BackGround,i*340,0)
 end    
end