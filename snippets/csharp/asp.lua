local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function get_controller_name()
    local filename = vim.fn.expand("%:t")
    return filename:gsub("Controller%.cs$", "")
end

local function get_namespace()
    local filepath = vim.fn.expand("%:p:h")
    local project_root = vim.fn.getcwd()
    local relative_path = filepath:gsub("^" .. project_root .. "/", "")
    return relative_path:gsub("/", ".")
end

return {
    s("apicontroller", {
        t({"using Microsoft.AspNetCore.Mvc;", "", "namespace "}),
        f(get_namespace),
        t({";", "", "[ApiController]", "[Route(\"[controller]\")]", ""}),
        t({"public class "}),
        f(get_controller_name),
        t({"Controller : ControllerBase", "{", "    "}),
        i(1),
        t({"", "}"}),
    }),
    s("asyncget", {
      i(1, "public"),
      t(" async Task<"),
      i(2, "T"),
      t(">"),
      t(" "),
      i(3, "Get"),
      t("("),
      i(5),
      t(")"),
      t({ " {", "    " }),
      i(4),
      t({ "", "}" }),
    }),
}
