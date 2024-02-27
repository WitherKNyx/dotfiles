local helpers = require('luasnip-helper-funcs')
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
s({trig="__", dscr="subscripting", snippetType="autosnippet"},
	fmta([[_{<>}]], { i(1) }),
	{condition = helpers.in_mathzone}
),
s({trig="^^", dscr="superscripting", snippetType="autosnippet"},
	fmta([[^{<>}]], { i(1) }),
	{condition = helpers.in_mathzone}
),
s({trig="`0", snippetType="autosnippet"},
	{ t("\\emptyset") },
	{condition = helpers.in_mathzone}
),
s({trig="`2", snippetType="autosnippet"},
	{ t("\\sqrt") },
	{condition = helpers.in_mathzone}
),
s({trig="`6", snippetType="autosnippet"},
	{ t("\\partial") },
	{condition = helpers.in_mathzone}
),
s({trig="`8", snippetType="autosnippet"},
	{ t("\\infty") },
	{condition = helpers.in_mathzone}
),
s({trig="`=", snippetType="autosnippet"},
	{ t("\\equiv") },
	{condition = helpers.in_mathzone}
),
s({trig="`\\", snippetType="autosnippet"},
	{ t("\\setminus") },
	{condition = helpers.in_mathzone}
),
s({trig="`.", snippetType="autosnippet"},
	{ t("\\cdot") },
	{condition = helpers.in_mathzone}
),
s({trig="`*", snippetType="autosnippet"},
	{ t("\\times") },
	{condition = helpers.in_mathzone}
),
s({trig="`<", snippetType="autosnippet"},
	{ t("\\langle") },
	{condition = helpers.in_mathzone}
),
s({trig="`>", snippetType="autosnippet"},
	{ t("\\rangle") },
	{condition = helpers.in_mathzone}
),
s({trig="`H", snippetType="autosnippet"},
	{ t("\\hbar") },
	{condition = helpers.in_mathzone}
),
s({trig="`+", snippetType="autosnippet"},
	{ t("\\bigcup") },
	{condition = helpers.in_mathzone}
),
s({trig="`-", snippetType="autosnippet"},
	{ t("\\bigcap") },
	{condition = helpers.in_mathzone}
),
s({trig="`[", snippetType="autosnippet"},
	{ t("\\subseteq") },
	{condition = helpers.in_mathzone}
),
s({trig="`]", snippetType="autosnippet"},
	{ t("\\supseteq") },
	{condition = helpers.in_mathzone}
),
s({trig="`(", snippetType="autosnippet"},
	{ t("\\subset") },
	{condition = helpers.in_mathzone}
),
s({trig="`)", snippetType="autosnippet"},
	{ t("\\supset") },
	{condition = helpers.in_mathzone}
),
s({trig="`&", snippetType="autosnippet"},
	{ t("\\wedge") },
	{condition = helpers.in_mathzone}
),
s({trig="`^", snippetType="autosnippet"},
	fmta([[\Hat{<>}<>]], { i(1), i(0) }),
	{condition = helpers.in_mathzone}
),
s({trig="`/", snippetType="autosnippet"},
	fmta([[\frac{<>}{<>}<>]], { i(1), i(2), i(0) }),
	{condition = helpers.in_mathzone}
),
s({trig="`I", snippetType="autosnippet"},
	{ t("\\int") },
	{condition = helpers.in_mathzone}
),
s({trig="`O", snippetType="autosnippet"},
	{ t("\\circ") },
	{condition = helpers.in_mathzone}
),
s({trig="`A", snippetType="autosnippet"},
	{ t("\\forall") },
	{condition = helpers.in_mathzone}
),
s({trig="`B", snippetType="autosnippet"},
	fmta([[\boldsymbol{<>}<>]], { i(1), i(0) }),
	{condition = helpers.in_mathzone}
),
s({trig="`E", snippetType="autosnippet"},
	{ t("\\exists") },
	{condition = helpers.in_mathzone}
),
s({trig="`N", snippetType="autosnippet"},
	{ t("\\nabla") },
	{condition = helpers.in_mathzone}
),
s({trig="`jj", snippetType="autosnippet"},
	{ t("\\downarrow") },
	{condition = helpers.in_mathzone}
),
s({trig="`jJ", snippetType="autosnippet"},
	{ t("\\Downarrow") },
	{condition = helpers.in_mathzone}
),
s({trig="`jk", snippetType="autosnippet"},
	{ t("\\uparrow") },
	{condition = helpers.in_mathzone}
),
s({trig="`jK", snippetType="autosnippet"},
	{ t("\\Uparrow") },
	{condition = helpers.in_mathzone}
),
s({trig="`jh", snippetType="autosnippet"},
	{ t("\\leftarrow") },
	{condition = helpers.in_mathzone}
),
s({trig="`jH", snippetType="autosnippet"},
	{ t("\\Leftarrow") },
	{condition = helpers.in_mathzone}
),
s({trig="`jl", snippetType="autosnippet"},
	{ t("\\rightarrow") },
	{condition = helpers.in_mathzone}
),
s({trig="`jL", snippetType="autosnippet"},
	{ t("\\Rightarrow") },
	{condition = helpers.in_mathzone}
),
s({trig="#b", snippetType="autosnippet"},
	fmta([[\mathbf{<>}<>]], { i(1), i(0) }),
	{condition = helpers.in_mathzone}
),
s({trig="#B", snippetType="autosnippet"},
	fmta([[\mathbb{<>}<>]], { i(1), i(0) }),
	{condition = helpers.in_mathzone}
),
s({trig="#c", snippetType="autosnippet"},
	fmta([[\mathcal{<>}<>]], { i(1), i(0) }),
	{condition = helpers.in_mathzone}
),
s({trig="#-", snippetType="autosnippet"},
	fmta([[\overline{<>}<>]], { i(1), i(0) }),
	{condition = helpers.in_mathzone}
),
s({trig="`a", snippetType="autosnippet"},
	{ t("\\alpha") },
	{condition = helpers.in_mathzone}
),
s({trig="`b", snippetType="autosnippet"},
	{ t("\\beta") },
	{condition = helpers.in_mathzone}
),
s({trig="`c", snippetType="autosnippet"},
	{ t("\\chi") },
	{condition = helpers.in_mathzone}
),
s({trig="`d", snippetType="autosnippet"},
	{ t("\\delta") },
	{condition = helpers.in_mathzone}
),
s({trig="`e", snippetType="autosnippet"},
	{ t("\\epsilon") },
	{condition = helpers.in_mathzone}
),
s({trig="`f", snippetType="autosnippet"},
	{ t("\\phi") },
	{condition = helpers.in_mathzone}
),
s({trig="`g", snippetType="autosnippet"},
	{ t("\\gamma") },
	{condition = helpers.in_mathzone}
),
s({trig="`h", snippetType="autosnippet"},
	{ t("\\eta") },
	{condition = helpers.in_mathzone}
),
s({trig="`i", snippetType="autosnippet"},
	{ t("\\iota") },
	{condition = helpers.in_mathzone}
),
s({trig="`k", snippetType="autosnippet"},
	{ t("\\kappa") },
	{condition = helpers.in_mathzone}
),
s({trig="`l", snippetType="autosnippet"},
	{ t("\\lambda") },
	{condition = helpers.in_mathzone}
),
s({trig="`m", snippetType="autosnippet"},
	{ t("\\mu") },
	{condition = helpers.in_mathzone}
),
s({trig="`n", snippetType="autosnippet"},
	{ t("\\nu") },
	{condition = helpers.in_mathzone}
),
s({trig="`p", snippetType="autosnippet"},
	{ t("\\pi") },
	{condition = helpers.in_mathzone}
),
s({trig="`q", snippetType="autosnippet"},
	{ t("\\theta") },
	{condition = helpers.in_mathzone}
),
s({trig="`r", snippetType="autosnippet"},
	{ t("\\rho") },
	{condition = helpers.in_mathzone}
),
s({trig="`s", snippetType="autosnippet"},
	{ t("\\sigma") },
	{condition = helpers.in_mathzone}
),
s({trig="`t", snippetType="autosnippet"},
	{ t("\\tau") },
	{condition = helpers.in_mathzone}
),
s({trig="`u", snippetType="autosnippet"},
	{ t("\\upsilon") },
	{condition = helpers.in_mathzone}
),
s({trig="`w", snippetType="autosnippet"},
	{ t("\\omega") },
	{condition = helpers.in_mathzone}
),
s({trig="`x", snippetType="autosnippet"},
	{ t("\\xi") },
	{condition = helpers.in_mathzone}
),
s({trig="`y", snippetType="autosnippet"},
	{ t("\\psi") },
	{condition = helpers.in_mathzone}
),
s({trig="`z", snippetType="autosnippet"},
	{ t("\\zeta") },
	{condition = helpers.in_mathzone}
),
s({trig="`D", snippetType="autosnippet"},
	{ t("\\Delta") },
	{condition = helpers.in_mathzone}
),
s({trig="`F", snippetType="autosnippet"},
	{ t("\\Phi") },
	{condition = helpers.in_mathzone}
),
s({trig="`G", snippetType="autosnippet"},
	{ t("\\Gamma") },
	{condition = helpers.in_mathzone}
),
s({trig="`L", snippetType="autosnippet"},
	{ t("\\Lambda") },
	{condition = helpers.in_mathzone}
),
s({trig="`P", snippetType="autosnippet"},
	{ t("\\Pi") },
	{condition = helpers.in_mathzone}
),
s({trig="`Q", snippetType="autosnippet"},
	{ t("\\Theta") },
	{condition = helpers.in_mathzone}
),
s({trig="`S", snippetType="autosnippet"},
	{ t("\\Sigma") },
	{condition = helpers.in_mathzone}
),
s({trig="`U", snippetType="autosnippet"},
	{ t("\\Upsilon") },
	{condition = helpers.in_mathzone}
),
s({trig="`W", snippetType="autosnippet"},
	{ t("\\Omega") },
	{condition = helpers.in_mathzone}
),
s({trig="`X", snippetType="autosnippet"},
	{ t("\\Xi") },
	{condition = helpers.in_mathzone}
),
s({trig="`Y", snippetType="autosnippet"},
	{ t("\\Psi") },
	{condition = helpers.in_mathzone}
),
s({trig="`ve", snippetType="autosnippet"},
	{ t("\\varepsilon") },
	{condition = helpers.in_mathzone}
),
s({trig="`vf", snippetType="autosnippet"},
	{ t("\\varphi") },
	{condition = helpers.in_mathzone}
),
s({trig="`vk", snippetType="autosnippet"},
	{ t("\\varkappa") },
	{condition = helpers.in_mathzone}
),
s({trig="`vp", snippetType="autosnippet"},
	{ t("\\varpi") },
	{condition = helpers.in_mathzone}
),
s({trig="`vq", snippetType="autosnippet"},
	{ t("\\vartheta") },
	{condition = helpers.in_mathzone}
),
s({trig="`vr", snippetType="autosnippet"},
	{ t("\\varrho") },
	{condition = helpers.in_mathzone}
),
}
