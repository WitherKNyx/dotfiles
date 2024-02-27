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
s({trig="((", snippetType="autosnippet"},
	fmta(
		"\\left(<>\\right)",
		{
			d(1, get_visual)
		}
	)
),
s({trig="[[", snippetType="autosnippet"},
	fmta(
		"\\left[<>\\right]",
		{
			d(1, get_visual)
		}
	)
),
s({trig="<<", snippetType="autosnippet"},
	fmta(
		"\\left\\langle<>\\right\\rangle",
		{
			d(1, get_visual)
		}
	)
),
s({trig="([^%a])mm", wordTrig=false, regTrig=true},
	fmta(
		"<>$<>$",
		{
			f(function(_, snip) return snip.captures[1] end),
			d(1, get_visual)
		}
	)
),
s({trig="([^%a])MM", wordTrig=false, regTrig=true},
	fmta(
		"<>$$<>$$",
		{
			f(function(_, snip) return snip.captures[1] end),
			d(1, get_visual)
		}
	)
),
s({trig="\"\"", snippetType="autosnippet"},
	fmta(
		"``<>''",
		{
			d(1, get_visual)
		}
	)
),
s({trig="{{", snippetType="autosnippet"},
	fmta(
		"\\left\\{<>\\right\\}",
		{
			d(1, get_visual)
		}
	)
),
s({trig="CC", snippetType="autosnippet"},
	fmta(
		"\\left\\lceil<>\\right\\rceil",
		{
			d(1, get_visual)
		}
	),
	{ condition = helpers.in_mathzone }
),
s({trig="FF", snippetType="autosnippet"},
	fmta(
		"\\left\\lfloor<>\\right\\rfloor",
		{
			d(1, get_visual)
		}
	),
	{ condition = helpers.in_mathzone }
),
}
