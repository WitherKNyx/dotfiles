local helpers = require('luasnip-helper-funcs')
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local int1 = function(_, snip)
    local vars = tonumber(snip.captures[1])
    local nodes = {}
    for j = 1, vars do
	table.insert(nodes, t("\\int_{"))
	table.insert(nodes, r(2*j-1, "lb" .. tostring(j), i(1))) -- thanks L3MON4D3 for finding the index issue
	table.insert(nodes, t("}^{"))
	table.insert(nodes, r(2*j, "ub" .. tostring(j), i(1))) -- please remember to count and don't be like me
	table.insert(nodes, t("} "))
    end
    return sn(nil, nodes)
end

-- generate \dd <>
local int2 = function(_, snip)
    local vars = tonumber(snip.captures[1])
    local nodes = {}
    for j = 1, vars do
	table.insert(nodes, t(" \\dd "))
	table.insert(nodes, r(j, "var" .. tostring(j), i(1)))
    end
    return sn(nil, nodes)
end

return {
s({trig="(%d)int", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta([[
		<> <> <> <>
	]],
	{
		c(1, { fmta([[
				\<><>nt_{<>}
			]],
			{
				c(1, { t(""), t("o") }),
				f(function(_, parent, _)
					local inum = tonumber(parent.parent.captures[1])
					local res = string.rep("i", inum)
					return res
				end),
				i(2)
			}),
			d(nil, int1)
		}),
		i(2),
		d(3, int2),
		i(0)
	}),
	{condition = helpers.in_mathzone}
),
s({trig="__", dscr="subscripting", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>_{<>}",
	{
		f(function(_, snip) return snip.captures[1] end),
		i(1)
	}),
	{condition = helpers.in_mathzone}
),
s({trig="%^%^", dscr="superscripting", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>^{<>}",
	{
		f(function(_, snip) return snip.captures[1] end),
		i(1)
	}),
	{condition = helpers.in_mathzone}
),
s({trig="`0", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\emptyset", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`2", snippetType="autosnippet", wordTrig=false, regTrig=true},
	{ t("\\sqrt") },
	{condition = helpers.in_mathzone}
),
s({trig="`6", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\partial", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`8", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\infty", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`=", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\equiv", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`\\", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\setminus", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`%.", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\cdot", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`%*", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\times", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`<", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\langle", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`>", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\rangle", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`H", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\hbar", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`%+", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\bigcup", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`%-", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\bigcap", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`%[", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\subseteq", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`%]", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\supseteq", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`%(", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\subset", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`%)", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\supset", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`%&", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\wedge", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`^", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta([[<>\Hat{<>}]],
	{
		f(function(_, snip) return snip.captures[1] end),
		i(1)
	}),
	{condition = helpers.in_mathzone}
),
s({trig="`/", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta([[<>\frac{<>}{<>}]],
	{
		f(function(_, snip) return snip.captures[1] end),
		i(1),
		i(2)
	}),
	{condition = helpers.in_mathzone}
),
s({trig="`I", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\in", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`O", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\circ", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`A", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\forall", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`B", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta([[<>\boldsymbol{<>}]],
	{
		f(function(_, snip) return snip.captures[1] end),
		i(1)
	}),
	{condition = helpers.in_mathzone}
),
s({trig="`E", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\exists", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`N", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\nabla", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`jj", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\downarrow", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`jJ", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\Downarrow", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`jk", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\uparrow", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`jK", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\Uparrow", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`jh", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\leftarrow", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`jH", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\Leftarrow", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`jl", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\rightarrow", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`jL", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\Rightarrow", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="#b", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta([[<>\mathbf{<>}]],
	{
		f(function(_, snip) return snip.captures[1] end),
		i(1)
	}),
	{condition = helpers.in_mathzone}
),
s({trig="#B", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta([[<>\mathbb{<>}]],
	{
		f(function(_, snip) return snip.captures[1] end),
		i(1)
	}),
	{condition = helpers.in_mathzone}
),
s({trig="#c", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta([[<>\mathcal{<>}]],
	{
		f(function(_, snip) return snip.captures[1] end),
		i(1)
	}),
	{condition = helpers.in_mathzone}
),
s({trig="#%-", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta([[<>\overline{<>}]],
	{
		f(function(_, snip) return snip.captures[1] end),
		i(1)
	}),
	{condition = helpers.in_mathzone}
),
s({trig="`a", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\alpha", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`b", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\beta", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`c", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\chi", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`d", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\delta", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`e", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\epsilon", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`f", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\phi", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`g", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\gamma", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`h", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\eta", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`i", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\iota", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`k", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\kappa", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`l", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\lambda", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`m", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\mu", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`n", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\nu", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`p", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\pi", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`q", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\theta", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`r", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\rho", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`s", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\sigma", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`t", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\tau", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`u", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\upsilon", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`w", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\omega", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`x", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\xi", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`y", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\psi", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`z", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\zeta", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`D", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\Delta", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`F", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\Phi", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`G", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\Gamma", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`L", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\Lambda", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`P", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\Pi", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`Q", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\Theta", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`S", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\Sigma", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`U", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\Upsilon", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`W", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\Omega", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`X", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\Xi", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`Y", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\Psi", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`ve", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\varepsilon", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`vf", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\varphi", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`vk", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\varkappa", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`vp", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\varpi", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`vq", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\vartheta", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
s({trig="`vr", snippetType="autosnippet", wordTrig=false, regTrig=true},
	fmta("<>\\varrho", { f(function(_, snip) return snip.captures[1] end) }),
	{condition = helpers.in_mathzone}
),
}
