local enable_const = require "const"
local const = {}
enable_const(const)

const.pi = 3.1415926
print(const.pi)

-- try to modify const.pi
const.pi = 65132 -- should throw an error