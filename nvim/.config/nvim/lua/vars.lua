--[[ vars.lua ]]

local g = vim.g
g.t_co = 256
g.background = "dark"

-- Update the packpath
local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path

-- [[ Language Providers ]]
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0

