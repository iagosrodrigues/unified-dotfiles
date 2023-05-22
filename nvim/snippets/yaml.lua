local status, luasnip = pcall(require, "luasnip")
if not status then
  return
end

local s = luasnip.s
local t = luasnip.t
local i = luasnip.i
local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}

table.insert(
  snippets,
  s(
    "kubernetes-pod",
    fmt(
      [[
apiVersion: v1
kind: Pod
metadata:
  name: {}
]],
      {
        i(1, "name"),
      }
    )
  )
)

return snippets, autosnippets
