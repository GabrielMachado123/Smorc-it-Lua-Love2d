return {
  version = "1.4",
  luaversion = "5.1",
  tiledversion = "1.4.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 25,
  height = 19,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 2,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "GRASS-Sheet",
      firstgid = 1,
      filename = "GRASS-Sheet.tsx",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 3,
      image = "GRASS-Sheet.png",
      imagewidth = 96,
      imageheight = 96,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 9,
      tiles = {
        {
          id = 0,
          probability = 0.5,
          animation = {
            {
              tileid = 0,
              duration = 100
            },
            {
              tileid = 1,
              duration = 100
            },
            {
              tileid = 2,
              duration = 100
            },
            {
              tileid = 3,
              duration = 100
            }
          }
        },
        {
          id = 1,
          probability = 0
        },
        {
          id = 2,
          probability = 0
        },
        {
          id = 3,
          probability = 0
        },
        {
          id = 4,
          probability = 0.5,
          animation = {
            {
              tileid = 4,
              duration = 100
            },
            {
              tileid = 5,
              duration = 100
            },
            {
              tileid = 6,
              duration = 100
            },
            {
              tileid = 7,
              duration = 100
            }
          }
        },
        {
          id = 5,
          probability = 0
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 25,
      height = 19,
      id = 1,
      name = "Tile Layer 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        5, 5, 5, 5, 1, 5, 5, 1, 5, 1, 5, 1, 1, 5, 5, 5, 1, 5, 5, 5, 5, 1, 5, 5, 5,
        1, 1, 5, 5, 5, 5, 5, 5, 1, 5, 5, 1, 5, 1, 5, 5, 1, 5, 1, 1, 5, 1, 5, 5, 5,
        5, 1, 5, 5, 1, 1, 1, 5, 1, 1, 5, 5, 1, 1, 5, 5, 1, 1, 5, 5, 5, 1, 1, 5, 5,
        5, 5, 5, 1, 5, 5, 5, 1, 5, 5, 5, 1, 1, 1, 1, 5, 1, 1, 1, 5, 5, 1, 5, 1, 1,
        5, 5, 5, 5, 5, 1, 1, 1, 1, 5, 1, 1, 1, 1, 5, 5, 5, 1, 1, 1, 5, 1, 5, 5, 5,
        1, 5, 1, 1, 1, 1, 1, 5, 1, 5, 5, 1, 1, 5, 5, 5, 1, 1, 5, 1, 5, 5, 1, 1, 1,
        5, 1, 1, 1, 1, 1, 5, 1, 5, 1, 5, 1, 5, 1, 1, 1, 5, 5, 1, 1, 5, 1, 1, 5, 5,
        1, 5, 1, 1, 5, 1, 5, 5, 1, 1, 1, 5, 5, 1, 1, 1, 5, 5, 5, 5, 5, 1, 1, 1, 1,
        5, 1, 1, 1, 1, 5, 5, 1, 5, 1, 5, 5, 1, 1, 1, 1, 5, 5, 1, 5, 5, 5, 1, 1, 5,
        1, 5, 5, 5, 1, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 5, 1, 1, 5, 1, 1, 5, 5,
        1, 1, 1, 1, 5, 5, 1, 1, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 1, 5, 1, 1, 5, 1, 1,
        1, 1, 1, 1, 5, 5, 5, 5, 1, 5, 5, 5, 5, 1, 5, 1, 5, 5, 1, 1, 5, 1, 1, 1, 5,
        5, 5, 1, 5, 1, 5, 5, 5, 1, 5, 1, 5, 5, 1, 5, 1, 1, 5, 5, 1, 1, 1, 5, 1, 5,
        5, 1, 1, 5, 1, 5, 1, 1, 1, 1, 5, 1, 1, 1, 5, 1, 5, 1, 1, 1, 1, 1, 1, 5, 1,
        1, 1, 1, 5, 1, 1, 5, 5, 5, 5, 5, 1, 5, 5, 1, 5, 1, 1, 1, 1, 5, 1, 1, 5, 5,
        1, 1, 5, 1, 1, 5, 5, 1, 1, 5, 5, 1, 1, 1, 1, 1, 1, 1, 5, 5, 5, 1, 5, 5, 1,
        5, 5, 5, 5, 5, 5, 1, 5, 5, 1, 5, 5, 1, 5, 1, 1, 5, 5, 5, 5, 1, 1, 5, 5, 5,
        1, 5, 5, 1, 1, 5, 5, 1, 5, 5, 5, 5, 5, 1, 1, 5, 5, 1, 1, 1, 1, 5, 5, 5, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 1, 1, 5, 1, 5, 1, 1, 1, 5, 1, 1, 5, 5, 5, 1
      }
    }
  }
}
