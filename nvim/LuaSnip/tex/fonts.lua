local helpers = require('luasnip-helper-funcs')
local get_visual = helpers.get_visual
local ls = require("luasnip")
local s = ls.snippet
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta

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
