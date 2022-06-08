return {
  version = "1.4",
  luaversion = "5.1",
  tiledversion = "1.4.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 188,
  height = 12,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 2,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "GroundTileset",
      firstgid = 1,
      filename = "GroundTileset.tsx",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 3,
      image = "GroundTileset.png",
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
          id = 3,
          probability = 0.005
        },
        {
          id = 4,
          probability = 0.005
        },
        {
          id = 5,
          probability = 0.009
        },
        {
          id = 6,
          probability = 0.009
        },
        {
          id = 7,
          probability = 0.05
        },
        {
          id = 8,
          probability = 0.05
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 189,
      height = 11,
      id = 1,
      name = "Tile Layer 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        6, 1, 1, 1, 3, 2, 2, 3, 2, 2, 1, 3, 3, 3, 2, 2, 2, 2, 8, 1, 1, 2, 1, 2, 1, 2, 2, 1, 1, 2, 2, 3, 3, 2, 1, 3, 3, 3, 2, 3, 1, 2, 1, 2, 3, 2, 1, 2, 3, 1, 1, 1, 3, 3, 3, 9, 1, 3, 3, 2, 3, 2, 2, 3, 1, 2, 1, 2, 2, 3, 2, 2, 3, 3, 1, 3, 2, 3, 2, 3, 1, 1, 9, 1, 2, 3, 1, 2, 1, 3, 2, 2, 3, 1, 3, 1, 2, 2, 2, 3, 1, 2, 1, 3, 3, 2, 3, 3, 1, 3, 1, 2, 1, 2, 3, 1, 3, 1, 2, 3, 2, 3, 2, 3, 1, 2, 2, 2, 1, 3, 2, 1, 1, 3, 3, 3, 3, 3, 3, 3, 3, 2, 1, 3, 4, 3, 5, 3, 1, 1, 2, 2, 2, 1, 2, 1, 5, 2, 3, 3, 2, 1, 1, 3, 3, 1, 2, 2, 2, 5, 2, 1, 1, 2, 2, 2, 1, 3, 2, 1, 4, 3, 1, 3, 1, 2, 3, 3, 1,
        1, 1, 3, 2, 2, 1, 3, 1, 7, 2, 2, 3, 2, 3, 2, 3, 1, 3, 1, 3, 1, 2, 2, 3, 3, 1, 1, 1, 3, 1, 2, 3, 3, 2, 3, 2, 2, 1, 1, 2, 1, 1, 1, 3, 1, 1, 1, 3, 2, 3, 1, 1, 3, 1, 3, 2, 3, 9, 8, 2, 2, 1, 3, 2, 1, 3, 2, 3, 2, 3, 3, 3, 1, 3, 1, 1, 2, 3, 2, 2, 2, 2, 3, 1, 2, 1, 1, 3, 2, 2, 3, 2, 1, 1, 3, 2, 1, 1, 2, 3, 3, 1, 1, 1, 2, 3, 3, 2, 3, 2, 3, 2, 2, 2, 3, 2, 1, 8, 1, 2, 2, 1, 2, 2, 1, 1, 1, 2, 3, 1, 2, 1, 2, 3, 3, 1, 1, 1, 2, 3, 3, 5, 3, 4, 3, 3, 3, 2, 4, 3, 2, 2, 1, 5, 1, 1, 1, 2, 3, 2, 2, 1, 4, 2, 3, 4, 2, 1, 1, 1, 2, 4, 2, 2, 7, 3, 2, 5, 1, 4, 1, 2, 1, 5, 2, 2, 4, 2, 2,
        3, 2, 1, 1, 3, 1, 1, 1, 3, 2, 2, 1, 2, 1, 2, 3, 3, 1, 3, 3, 1, 3, 2, 1, 1, 1, 3, 1, 3, 2, 1, 3, 2, 3, 1, 3, 9, 1, 1, 3, 1, 2, 1, 3, 2, 3, 3, 3, 3, 2, 3, 2, 1, 3, 2, 3, 1, 3, 2, 2, 1, 3, 3, 3, 3, 1, 2, 1, 2, 1, 3, 3, 1, 2, 1, 3, 1, 3, 2, 1, 1, 2, 3, 3, 3, 3, 1, 3, 2, 3, 3, 1, 3, 3, 1, 3, 3, 3, 1, 2, 1, 1, 1, 3, 2, 3, 3, 1, 2, 2, 2, 1, 1, 1, 1, 2, 3, 3, 1, 3, 1, 3, 2, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 1, 1, 3, 3, 2, 3, 2, 4, 1, 1, 3, 5, 1, 2, 1, 3, 1, 4, 3, 3, 2, 3, 1, 2, 2, 1, 3, 2, 2, 1, 1, 2, 1, 2, 3, 5, 1, 2, 1, 2, 1, 2, 1, 3, 1, 2, 5, 2, 2, 3, 3, 1, 2, 3, 1,
        1, 2, 3, 3, 2, 3, 2, 2, 1, 1, 9, 2, 1, 2, 1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 3, 2, 1, 1, 1, 2, 2, 1, 1, 3, 2, 2, 1, 3, 1, 1, 2, 1, 2, 3, 2, 2, 3, 2, 2, 2, 2, 3, 1, 1, 1, 2, 3, 1, 3, 3, 2, 2, 2, 2, 1, 3, 3, 1, 1, 3, 3, 3, 1, 2, 9, 2, 8, 3, 2, 1, 1, 2, 1, 3, 2, 3, 2, 1, 2, 3, 2, 1, 2, 3, 3, 2, 1, 3, 1, 9, 2, 1, 3, 3, 2, 2, 6, 3, 3, 3, 3, 3, 2, 3, 1, 1, 1, 2, 3, 3, 3, 2, 2, 1, 1, 1, 3, 2, 1, 2, 1, 2, 2, 1, 9, 2, 3, 1, 1, 2, 2, 1, 3, 3, 5, 4, 1, 3, 2, 1, 3, 1, 1, 5, 1, 2, 3, 3, 4, 3, 3, 3, 1, 2, 4, 6, 3, 1, 6, 1, 2, 2, 1, 2, 1, 3, 4, 2, 1, 2, 3, 2, 3, 1, 3, 4, 1, 3, 4,
        1, 3, 1, 3, 2, 1, 1, 3, 2, 3, 3, 2, 2, 2, 3, 1, 1, 3, 1, 3, 3, 3, 2, 2, 1, 3, 3, 1, 2, 3, 1, 3, 8, 2, 2, 2, 1, 3, 1, 2, 1, 3, 2, 2, 1, 2, 8, 3, 3, 2, 1, 2, 3, 8, 1, 2, 1, 3, 3, 3, 1, 1, 3, 2, 2, 1, 2, 3, 2, 1, 2, 1, 1, 3, 3, 2, 2, 3, 2, 2, 3, 2, 1, 1, 3, 3, 3, 1, 1, 2, 1, 1, 1, 9, 2, 1, 3, 2, 4, 1, 2, 3, 1, 1, 3, 3, 1, 1, 3, 3, 1, 3, 2, 1, 3, 1, 1, 3, 3, 3, 1, 2, 3, 3, 1, 1, 1, 1, 2, 1, 3, 3, 1, 2, 1, 1, 1, 9, 2, 1, 2, 2, 4, 3, 2, 3, 1, 3, 4, 1, 3, 2, 3, 3, 1, 3, 1, 2, 3, 3, 2, 2, 3, 3, 3, 2, 3, 3, 3, 3, 5, 2, 2, 2, 5, 2, 3, 7, 1, 3, 2, 1, 3, 2, 3, 5, 2, 3, 3,
        1, 2, 3, 1, 1, 3, 1, 2, 2, 2, 1, 2, 1, 1, 2, 2, 1, 1, 1, 2, 1, 1, 3, 2, 3, 2, 3, 2, 1, 2, 3, 1, 2, 1, 1, 2, 3, 3, 2, 1, 1, 3, 3, 2, 2, 2, 1, 3, 3, 3, 3, 2, 1, 3, 3, 2, 3, 3, 1, 2, 8, 3, 2, 3, 3, 1, 2, 3, 2, 2, 3, 1, 2, 1, 2, 2, 3, 1, 2, 2, 1, 3, 2, 2, 1, 1, 2, 1, 2, 2, 2, 2, 1, 2, 1, 2, 3, 2, 2, 1, 2, 3, 2, 2, 2, 3, 3, 2, 1, 3, 3, 2, 2, 3, 2, 2, 6, 2, 3, 1, 1, 1, 1, 2, 1, 1, 1, 9, 3, 2, 2, 3, 3, 2, 2, 3, 1, 8, 3, 1, 8, 1, 5, 2, 2, 1, 5, 2, 1, 1, 5, 1, 2, 1, 2, 2, 2, 3, 2, 1, 1, 1, 1, 5, 1, 3, 1, 2, 3, 3, 3, 3, 3, 1, 2, 2, 1, 3, 1, 2, 4, 3, 1, 3, 3, 1, 1, 3, 5,
        2, 3, 2, 1, 3, 9, 3, 2, 3, 3, 3, 2, 1, 1, 3, 1, 2, 3, 2, 1, 1, 1, 3, 2, 2, 1, 1, 3, 1, 1, 3, 1, 3, 1, 1, 2, 3, 3, 3, 3, 2, 3, 2, 2, 3, 3, 3, 3, 3, 8, 3, 2, 3, 1, 1, 3, 3, 1, 2, 2, 1, 1, 3, 1, 1, 1, 2, 3, 1, 1, 1, 2, 3, 1, 2, 2, 1, 2, 2, 2, 2, 2, 1, 1, 2, 3, 1, 2, 3, 1, 9, 1, 3, 3, 1, 3, 1, 1, 1, 3, 2, 3, 2, 2, 3, 2, 1, 3, 2, 2, 1, 3, 9, 9, 1, 2, 1, 3, 1, 1, 3, 3, 2, 2, 1, 1, 3, 1, 2, 2, 8, 2, 3, 3, 3, 3, 1, 3, 1, 2, 2, 1, 1, 1, 1, 4, 2, 2, 3, 1, 1, 1, 1, 4, 2, 2, 1, 5, 2, 5, 1, 3, 2, 2, 3, 5, 1, 1, 2, 4, 1, 3, 3, 1, 1, 2, 2, 2, 3, 3, 3, 1, 1, 5, 2, 2, 2, 2, 3,
        3, 3, 1, 1, 3, 2, 2, 3, 2, 1, 1, 2, 1, 3, 3, 3, 3, 2, 2, 1, 2, 3, 1, 3, 3, 1, 3, 1, 1, 1, 1, 9, 8, 1, 3, 1, 2, 1, 2, 3, 1, 1, 2, 1, 3, 3, 1, 1, 3, 2, 2, 3, 1, 1, 3, 3, 2, 1, 2, 2, 2, 2, 1, 2, 3, 3, 1, 2, 2, 1, 1, 1, 1, 3, 3, 1, 1, 3, 1, 3, 2, 3, 2, 3, 1, 2, 3, 3, 2, 3, 3, 3, 2, 3, 2, 1, 3, 3, 1, 3, 8, 3, 3, 3, 1, 3, 1, 2, 1, 1, 1, 1, 3, 3, 1, 3, 2, 2, 3, 2, 2, 1, 2, 2, 2, 2, 1, 8, 2, 3, 1, 1, 1, 2, 1, 1, 3, 1, 3, 8, 1, 3, 4, 1, 3, 1, 3, 1, 2, 3, 1, 1, 2, 3, 2, 3, 2, 3, 2, 2, 2, 2, 2, 2, 2, 2, 1, 3, 2, 1, 3, 1, 1, 5, 1, 1, 2, 5, 1, 3, 1, 1, 3, 1, 2, 1, 2, 1, 2,
        1, 1, 2, 1, 1, 1, 3, 3, 3, 1, 3, 2, 3, 1, 1, 3, 2, 3, 1, 2, 1, 3, 2, 2, 1, 3, 1, 3, 2, 2, 3, 2, 9, 2, 1, 3, 2, 8, 3, 1, 1, 1, 1, 3, 3, 1, 3, 1, 3, 3, 2, 8, 1, 1, 1, 1, 2, 1, 2, 3, 3, 2, 2, 1, 1, 2, 2, 1, 3, 1, 1, 2, 1, 2, 1, 3, 1, 3, 2, 2, 1, 1, 3, 1, 3, 1, 3, 1, 3, 3, 2, 1, 3, 1, 1, 3, 3, 3, 1, 2, 1, 1, 3, 3, 1, 1, 1, 1, 2, 3, 3, 1, 2, 3, 2, 1, 3, 3, 2, 1, 2, 1, 2, 3, 1, 2, 1, 3, 1, 1, 2, 3, 1, 1, 3, 2, 1, 2, 1, 3, 2, 2, 2, 1, 1, 1, 2, 2, 2, 5, 5, 4, 1, 2, 3, 2, 4, 3, 3, 1, 1, 1, 2, 2, 1, 1, 7, 3, 2, 7, 3, 2, 3, 1, 3, 2, 3, 1, 1, 3, 2, 2, 2, 5, 2, 2, 4, 2, 1,
        2, 2, 3, 1, 1, 2, 9, 3, 2, 3, 9, 3, 3, 2, 3, 3, 1, 2, 1, 3, 1, 3, 3, 2, 3, 9, 1, 2, 2, 3, 1, 3, 1, 3, 2, 2, 1, 1, 1, 1, 1, 3, 9, 2, 2, 1, 2, 1, 2, 3, 2, 3, 2, 1, 3, 1, 1, 1, 2, 1, 3, 1, 1, 3, 1, 2, 9, 2, 1, 3, 1, 3, 2, 1, 2, 2, 2, 1, 1, 8, 2, 2, 3, 1, 2, 1, 3, 2, 3, 3, 2, 1, 3, 3, 2, 2, 3, 3, 3, 3, 3, 1, 2, 2, 2, 3, 1, 1, 1, 3, 2, 3, 2, 2, 3, 3, 3, 2, 1, 1, 1, 2, 2, 1, 3, 3, 2, 2, 2, 3, 3, 1, 1, 3, 1, 9, 1, 2, 1, 2, 2, 2, 2, 3, 4, 3, 5, 1, 1, 4, 1, 2, 3, 1, 1, 2, 1, 3, 3, 1, 3, 1, 3, 4, 1, 2, 1, 3, 2, 3, 1, 2, 2, 5, 3, 1, 4, 2, 5, 3, 2, 1, 3, 2, 3, 1, 2, 3, 6,
        3, 2, 3, 1, 2, 3, 2, 2, 3, 3, 2, 1, 1, 2, 1, 3, 3, 1, 3, 3, 3, 2, 3, 3, 1, 2, 9, 2, 2, 1, 3, 1, 2, 1, 2, 3, 1, 3, 2, 1, 2, 1, 1, 2, 2, 3, 2, 3, 1, 3, 3, 3, 2, 2, 3, 8, 1, 2, 1, 3, 3, 3, 1, 2, 2, 1, 1, 2, 3, 2, 2, 2, 3, 2, 3, 3, 3, 1, 3, 2, 3, 2, 3, 3, 1, 3, 1, 1, 1, 1, 2, 1, 2, 2, 3, 3, 1, 1, 1, 2, 3, 2, 2, 3, 1, 1, 2, 2, 2, 1, 3, 3, 3, 1, 2, 1, 3, 1, 3, 3, 3, 2, 2, 1, 1, 2, 3, 2, 2, 3, 1, 2, 1, 2, 1, 1, 1, 2, 2, 3, 2, 5, 2, 1, 3, 1, 2, 2, 2, 3, 2, 2, 2, 5, 2, 5, 1, 4, 3, 1, 2, 2, 2, 1, 1, 3, 3, 3, 5, 3, 3, 3, 1, 3, 3, 1, 3, 3, 1, 1, 3, 4, 2, 6, 1, 4, 2, 3, 1
      }
    }
  }
}