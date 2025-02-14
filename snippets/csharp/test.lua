local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  s("test", {
    t("This is a test snippet for C#")
  })
}
