local helpers = require('luasnip-helper-funcs')
local get_visual = helpers.get_visual
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
s({trig="FBF", dscr="Creates a boldface text", snippetType="autosnippet"},
	fmta("\\textbf{<>}", { d(1, get_visual) })
),
s({trig="FIT", dscr="Creates a italics text", snippetType="autosnippet"},
	fmta("\\textit{<>}", { d(1, get_visual) })
),
s({trig="FTT", dscr="Creates a texttype text", snippetType="autosnippet"},
	fmta("\\texttt{<>}", { d(1, get_visual) })
),
}
