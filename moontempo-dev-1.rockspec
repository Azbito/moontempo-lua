package = "moontempo"
version = "dev-1"
source = {
   url = "git+https://github.com/Azbito/moontempo-lua.git"
}
description = {
   summary = "# moontempo (Lua)",
   detailed = "# This library will help you to get the difference between times.",
   homepage = "https://github.com/Azbito/moontempo-lua",
   license = "MIT"
}
build = {
   type = "builtin",
   modules = {
      config = "config.lua",
      init = "init.lua"
   }
}
