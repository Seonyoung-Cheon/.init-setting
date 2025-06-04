package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

require("config.bootstrap")

vim.g.mapleader = ","
vim.opt.clipboard = "unnamedplus"

require("lazy").setup("plugins")

require("config.options")
require("config.after")
