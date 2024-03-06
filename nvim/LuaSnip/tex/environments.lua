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
local util = require("luasnip.util.util")
local node_util = require("luasnip.nodes.util")

local function column_count_from_string(descr)
	-- this won't work for all cases, but it's simple to improve
	-- (feel free to do so! :D )
	return #(descr:gsub("[^clm]", ""))
end

-- function for the dynamicNode.
local tab = function(args, snip)
	local cols = column_count_from_string(args[1][1])
	-- snip.rows will not be set by default, so handle that case.
	-- it's also the value set by the functions called from dynamic_node_external_update().
	if not snip.rows then
		snip.rows = 1
	end
	local nodes = {}
	-- keep track of which insert-index we're at.
	local ins_indx = 1
	for j = 1, snip.rows do
		-- use restoreNode to not lose content when updating.
		table.insert(nodes, r(ins_indx, tostring(j).."x1", i(1)))
		ins_indx = ins_indx+1
		for k = 2, cols do
			table.insert(nodes, t" & ")
			table.insert(nodes, r(ins_indx, tostring(j).."x"..tostring(k), i(1)))
			ins_indx = ins_indx+1
		end
		table.insert(nodes, t{"\\\\", ""})
	end
	-- fix last node.
	nodes[#nodes] = t""
	return sn(nil, nodes)
end

return {
s({trig="EEN", dscr="Creates a enumerate environment", snippetType="autosnippet"},
	fmta(
		[[
			\begin{enumerate}
				<>
			\end{enumerate}
		]],
		{ i(1) }
	)
),
s({trig="EIT", dscr="Creates a itemize environment", snippetType="autosnippet"},
	fmta(
		[[
			\begin{itemize}
				<>
			\end{itemize}
		]],
		{ i(1) }
	)
),
s({trig="EEQ", dscr="Creates a equation environment", snippetType="autosnippet"},
	fmta(
		[[
			\begin{equation}
				<>
			\end{equation}
		]],
		{ i(1) }
	)
),
s({trig="ECA", dscr="Creates a cases environment", snippetType="autosnippet"},
	fmta(
		[[
			\begin{cases}
				<>
			\end{cases}
		]],
		{ i(1) }
	),
	{ condition = helpers.in_mathzone }
),
s({trig="EAL", dscr="Creates a align environment", snippetType="autosnippet"},
	fmta(
		[[
			\begin{align}
				<>
			\end{align}
		]],
		{ i(1) }
	)
),
s({trig="EPR", dscr="Creates a proof environment", snippetType="autosnippet"},
	fmta(
		[[
			\begin{proof}
				<>
			\end{proof}
		]],
		{ i(1) }
	)
),
s({trig="EFI", dscr="Creates a figure environment", snippetType="autosnippet"},
	fmta(
		[[
			\begin{figure}[<>]
				\centering
				\includegraphics[]{<>}
				\caption{<>}
				\label{fig:<>}
			\end{figure}<>
		]],
		{
			i(1, "<htbp>"),
			i(2),
			i(3),
			i(4, "label"),
			i(0)
		}
	)
),
s({trig="ETA", dscr="Creates a table environment", snippetType="autosnippet"},
	fmta(
		[[
			\begin{table}[<>]
				\centering
				\begin{tabular}{<>}
					<>
				\end{tabular}
				\caption{<>}
				\label{tab:<>}
			\end{table}<>
		]],
		{
			i(1, "<htbp>"),
			i(2, "layout"),
			d(3, tab, {2}, {
				user_args = {
					-- Pass the functions used to manually update the dynamicNode as user args.
					-- The n-th of these functions will be called by dynamic_node_external_update(n).
					-- These functions are pretty simple, there's probably some cool stuff one could do
					-- with `ui.input`
					function(snip) snip.rows = snip.rows + 1 end,
					-- don't drop below one.
					function(snip) snip.rows = math.max(snip.rows - 1, 1) end
				}
			}),
			i(4),
			i(5, "label"),
			i(0)
		}
	)
),
s({trig="EAR", dscr="Creates a array environment", snippetType="autosnippet"},
	fmta(
		[[
			\begin{array}{<>}
				<>
			\end{array}
		]],
		{
			i(1),
			i(0)
		}
	)
),
s({trig="EMA", dscr="Creates a blank matrix", snippetType="autosnippet"},
	fmta(
		[[
			\begin{matrix}[<>]
				<>
			\end{matrix}
		]],
		{
			i(1),
			i(0)
		}
	),
	{ condition = helpers.in_mathzone }
),
s({trig="EMP", dscr="Creates a parenthetical matrix", snippetType="autosnippet"},
	fmta(
		[[
			\begin{pmatrix}[<>]
				<>
			\end{pmatrix}
		]],
		{
			i(1),
			i(0)
		}
	),
	{ condition = helpers.in_mathzone }
),
s({trig="EMB", dscr="Creates a bracketed matrix", snippetType="autosnippet"},
	fmta(
		[[
			\begin{bmatrix}[<>]
				<>
			\end{bmatrix}
		]],
		{
			i(1),
			i(0)
		}
	),
	{ condition = helpers.in_mathzone }
),
s({trig="EMR", dscr="Creates a braced matrix", snippetType="autosnippet"},
	fmta(
		[[
			\begin{Bmatrix}[<>]
				<>
			\end{Bmatrix}
		]],
		{
			i(1),
			i(0)
		}
	),
	{ condition = helpers.in_mathzone }
),
s({trig="EMD", dscr="Creates a piped matrix", snippetType="autosnippet"},
	fmta(
		[[
			\begin{vmatrix}[<>]
				<>
			\end{vmatrix}
		]],
		{
			i(1),
			i(0)
		}
	),
	{ condition = helpers.in_mathzone }
),
s({trig="EMV", dscr="Creates a double piped matrix", snippetType="autosnippet"},
	fmta(
		[[
			\begin{Vmatrix}[<>]
				<>
			\end{Vmatrix}
		]],
		{
			i(1),
			i(0)
		}
	),
	{ condition = helpers.in_mathzone }
),
s({trig="EMS", dscr="Creates a small matrix", snippetType="autosnippet"},
	fmta(
		[[
			\begin{smallmatrix}[<>]
				<>
			\end{smallmatrix}
		]],
		{
			i(1),
			i(0)
		}
	),
	{ condition = helpers.in_mathzone }
),
}
