package = "moontempo"
version = "1.0-1"
source = {
  url = "git://github.com/seu_usuario/moontempo.git"
}
description = {
  summary = "moontempo",
  detailed = "This library will help you to get the difference between times.",
  homepage = "https://github.com/seu_usuario/moontempo",
  license = "MIT",
}
dependencies = {
  "lua >= 5.1, < 5.5",
}
build = {
  type = "builtin",
  modules = {
    ["moontempo"] = "main.lua",
  },
  copy_directories = {
    "doc",
    "tests",
  },
}
