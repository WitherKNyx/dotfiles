local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
	-- Nonstandard Functions
	s(
		{trig="duplicate", dscr="Duplicate the top value on the stack"},
		{ t(".") }
	),
	s(
		{trig="over", dscr="Duplicate the second-to-top value to the top of the stack"},
		{ t(",") }
	),
	s(
		{trig="flip", dscr="Swap the top two values on the stack"},
		{ t(":") }
	),
	s(
		{trig="pop", dscr="Discard the top stack value"},
		{ t("◌") }
	),
	s(
		{trig="identity", dscr="Do nothing with one value"},
		{ t("∘") }
	),
	-- Monadic Pervasive Functions
	s(
		{trig="not", dscr="Logical not"},
		{ t("¬") }
	),
	s(
		{trig="sign", dscr="Numerical sign (1, ¯1, or 0)"},
		{ t("±") }
	),
	s(
		{trig="negate", dscr="Negate a number"},
		{ t("¯") }
	),
	s(
		{trig="abs", dscr="Get the absolute value of a number"},
		{ t("⌵") }
	),
	s(
		{trig="absolute value", dscr="Get the absolute value of a number"},
		{ t("⌵") }
	),
	s(
		{trig="sqrt", dscr="Take the square root of a number"},
		{ t("√") }
	),
	s(
		{trig="sine", dscr="Get the sine of a number"},
		{ t("∿") }
	),
	s(
		{trig="floor", dscr="Round to the nearest integer towards ¯∞"},
		{ t("⌊") }
	),
	s(
		{trig="ceil", dscr="Round to the nearest integer towards ∞"},
		{ t("⌈") }
	),
	s(
		{trig="ceiling", dscr="Round to the nearest integer towards ∞"},
		{ t("⌈") }
	),
	s(
		{trig="round", dscr="Round to the nearest integer"},
		{ t("⁅") }
	),
	-- Dyadic Pervasive Functions
	s(
		{trig="eq", dscr="Compare for equality"},
		{ t("=") }
	),
	s(
		{trig="equals", dscr="Compare for equality"},
		{ t("=") }
	),
	s(
		{trig="ne", dscr="Compare for inequality"},
		{ t("≠") }
	),
	s(
		{trig="not equals", dscr="Compare for inequality"},
		{ t("≠") }
	),
	s(
		{trig="lt", dscr="Compare for less than"},
		{ t("<") }
	),
	s(
		{trig="less than", dscr="Compare for less than"},
		{ t("<") }
	),
	s(
		{trig="le", dscr="Compare for less than or equal"},
		{ t("≤") }
	),
	s(
		{trig="less or equal", dscr="Compare for less than or equal"},
		{ t("≤") }
	),
	s(
		{trig="gt", dscr="Compare for greater than"},
		{ t(">") }
	),
	s(
		{trig="greater than", dscr="Compare for greater than"},
		{ t(">") }
	),
	s(
		{trig="ge", dscr="Compare for greater than or equal"},
		{ t("≥") }
	),
	s(
		{trig="greater or equal", dscr="Compare for greater than or equal"},
		{ t("≥") }
	),
	s(
		{trig="add", dscr="Add values"},
		{ t("+") }
	),
	s(
		{trig="sub", dscr="Subtract values"},
		{ t("-") }
	),
	s(
		{trig="subtract", dscr="Subtract values"},
		{ t("-") }
	),
	s(
		{trig="mul", dscr="Multiply values"},
		{ t("×") }
	),
	s(
		{trig="multiply", dscr="Multiply values"},
		{ t("×") }
	),
	s(
		{trig="div", dscr="Divide values"},
		{ t("÷") }
	),
	s(
		{trig="divide", dscr="Divide values"},
		{ t("÷") }
	),
	s(
		{trig="mod", dscr="Modulo values"},
		{ t("◿") }
	),
	s(
		{trig="modulus", dscr="Modulo values"},
		{ t("◿") }
	),
	s(
		{trig="pow", dscr="Raise a value to a power"},
		{ t("ⁿ") }
	),
	s(
		{trig="power", dscr="Raise a value to a power"},
		{ t("ⁿ") }
	),
	s(
		{trig="log", dscr="Get the based logarithm of a number"},
		{ t("ₙ") }
	),
	s(
		{trig="logarithm", dscr="Get the based logarithm of a number"},
		{ t("ₙ") }
	),
	s(
		{trig="min", dscr="Take the minimum of two arrays"},
		{ t("↧") }
	),
	s(
		{trig="minimum", dscr="Take the minimum of two arrays"},
		{ t("↧") }
	),
	s(
		{trig="max", dscr="Take the maximum of two arrays"},
		{ t("↥") }
	),
	s(
		{trig="maximum", dscr="Take the maximum of two arrays"},
		{ t("↥") }
	),
	s(
		{trig="atan", dscr="Take the arctangent of two numbers"},
		{ t("∠") }
	),
	s(
		{trig="atangent", dscr="Take the arctangent of two numbers"},
		{ t("∠") }
	),
	s(
		{trig="complex", dscr="Make a complex number"},
		{ t("ℂ") }
	),
	-- Monadic Functions
	s(
		{trig="len", dscr="Get the number of rows in an array"},
		{ t("⧻") }
	),
	s(
		{trig="shape", dscr="Get the dimensions of an array"},
		{ t("△") }
	),
	s(
		{trig="range", dscr="Make an array of all natural numbers less than a number"},
		{ t("⇡") }
	),
	s(
		{trig="first", dscr="Get the first row of an array"},
		{ t("⊢") }
	),
	s(
		{trig="reverse", dscr="Reverse the rows of an array"},
		{ t("⇌") }
	),
	s(
		{trig="deshape", dscr="Make an array 1-dimensional"},
		{ t("♭") }
	),
	s(
		{trig="fix", dscr="Add a length-1 axis to an array"},
		{ t("¤") }
	),
	s(
		{trig="bits", dscr="Encode an array as bits (LSB-first)"},
		{ t("⋯") }
	),
	s(
		{trig="trans", dscr="Rotate the shape of an array"},
		{ t("⍉") }
	),
	s(
		{trig="transpose", dscr="Rotate the shape of an array"},
		{ t("⍉") }
	),
	s(
		{trig="rise", dscr="Get the indices into an array if it were sorted ascending"},
		{ t("⍏") }
	),
	s(
		{trig="fall", dscr="Get the indices into an array if it were sorted descending"},
		{ t("⍖") }
	),
	s(
		{trig="where", dscr="Get indices where array values are not equal to zero"},
		{ t("⊚") }
	),
	s(
		{trig="classify", dscr="Assign a unique index to each unique element in an array"},
		{ t("⊛") }
	),
	s(
		{trig="dedup", dscr="Remove duplicate elements from an array"},
		{ t("◴") }
	),
	s(
		{trig="deduplicate", dscr="Remove duplicate elements from an array"},
		{ t("◴") }
	),
	s(
		{trig="unique", dscr="Get a mask of first occurrences of items in an array"},
		{ t("◰") }
	),
	s(
		{trig="box", dscr="Turn an array into a box"},
		{ t("□") }
	),
	s(
		{trig="parse", dscr="Parse a string as a number"},
		{ t("⋕") }
	),
	-- Dyadic Functions
	s(
		{trig="match", dscr="Check if two arrays are exactly the same"},
		{ t("≍") }
	),
	s(
		{trig="couple", dscr="Combine two arrays as rows of a new array"},
		{ t("⊟") }
	),
	s(
		{trig="join", dscr="Append two arrays end-to-end"},
		{ t("⊂") }
	),
	s(
		{trig="select", dscr="Select multiple rows from an array"},
		{ t("⊏") }
	),
	s(
		{trig="pick", dscr="Index a row or elements from an array"},
		{ t("⊡") }
	),
	s(
		{trig="reshape", dscr="Change the shape of an array"},
		{ t("↯") }
	),
	s(
		{trig="rerank", dscr="Change the rank of an array's rows"},
		{ t("☇") }
	),
	s(
		{trig="take", dscr="Take the first n elements of an array"},
		{ t("↙") }
	),
	s(
		{trig="drop", dscr="Drop the first n elements of an array"},
		{ t("↘") }
	),
	s(
		{trig="rotate", dscr="Rotate the elements of an array by n"},
		{ t("↻") }
	),
	s(
		{trig="windows", dscr="The n-wise windows of an array"},
		{ t("◫") }
	),
	s(
		{trig="keep", dscr="Discard or copy some rows of an array"},
		{ t("▽") }
	),
	s(
		{trig="find", dscr="Find the occurences of one array in another"},
		{ t("⌕") }
	),
	s(
		{trig="member", dscr="Check if each row of one array exists in another"},
		{ t("∊") }
	),
	s(
		{trig="indexof", dscr="Find the first index of each row of one array in another"},
		{ t("⊗") }
	),
	-- Monadic Modifiers
	s(
		{trig="reduce", dscr="Apply a reducing function to an array"},
		{ t("/") }
	),
	s(
		{trig="fold", dscr="Apply a function to aggregate arrays"},
		{ t("∧") }
	),
	s(
		{trig="scan", dscr="Reduce, but keep intermediate values"},
		{ t("\\") }
	),
	s(
		{trig="each", dscr="Apply a function to each element of an array or arrays."},
		{ t("∵") }
	),
	s(
		{trig="rows", dscr="Apply a function to each row of an array or arrays"},
		{ t("≡") }
	),
	s(
		{trig="table", dscr="Apply a function to each combination of rows of two arrays"},
		{ t("⊞") }
	),
	s(
		{trig="inv", dscr="Apply a function to each unboxed item of an array and re-box the results"},
		{ t("⍚") }
	),
	s(
		{trig="inventory", dscr="Apply a function to each unboxed item of an array and re-box the results"},
		{ t("⍚") }
	),
	s(
		{trig="repeat", dscr="Repeat a function a number of times"},
		{ t("⍥") }
	),
	s(
		{trig="group", dscr="Group elements of an array into buckets by index"},
		{ t("⊕") }
	),
	s(
		{trig="partition", dscr="Group sequential sections of an array"},
		{ t("⊜") }
	),
	s(
		{trig="content", dscr="Unbox the arguments to a function before calling it"},
		{ t("◇") }
	),
	s(
		{trig="gap", dscr="Discard the top stack value then call a function"},
		{ t("⋅") }
	),
	s(
		{trig="dip", dscr="Temporarily pop the top value off the stack and call a function"},
		{ t("⊙") }
	),
	s(
		{trig="on", dscr="Call a function but keep its first argument on the top of the stack"},
		{ t("⟜") }
	),
	s(
		{trig="both", dscr="Call a function on two sets of values"},
		{ t("∩") }
	),
	s(
		{trig="un", dscr="Invert the behavior of a function"},
		{ t("°") }
	),
	-- Dyadic Modifiers
	s(
		{trig="under", dscr="Apply a function under another"},
		{ t("⍜") }
	),
	s(
		{trig="fork", dscr="Call two functions on the same values"},
		{ t("⊃") }
	),
	s(
		{trig="bracket", dscr="Call two functions on two distinct sets of values"},
		{ t("⊓") }
	),
	s(
		{trig="do", dscr="Repeat a function while a condition holds"},
		{ t("⍢") }
	),
	s(
		{trig="fill", dscr="Set the fill value for a function"},
		{ t("⬚") }
	),
	s(
		{trig="try", dscr="Call a function and catch errors"},
		{ t("⍣") }
	),
	-- Dyadic 0-output Functions
	s(
		{trig="assert", dscr="Throw an error if a condition is not met"},
		{ t("⍤") }
	),
	-- Noadic Functions
	s(
		{trig="rnd", dscr="Generate a random number in the range [0, 1)"},
		{ t("⚂") }
	),
	s(
		{trig="random", dscr="Generate a random number in the range [0, 1)"},
		{ t("⚂") }
	),
	-- Constants
	s(
		{trig="eta", dscr="The number of radians in a quarter circle"},
		{ t("η") }
	),
	s(
		{trig="pi", dscr="The ratio of a circle's circumference to its diameter"},
		{ t("π") }
	),
	s(
		{trig="tau", dscr="The ratio of a circle's circumference to its radius"},
		{ t("τ") }
	),
	s(
		{trig="inf", dscr="The biggest number"},
		{ t("∞") }
	),
	s(
		{trig="infinity", dscr="The biggest number"},
		{ t("∞") }
	),
	-- Noadic 0-output Functions
	s(
		{trig="stack", dscr="Debug print all stack values without popping them"},
		{ t("?") }
	),
	-- Monadic Functions
	s(
		{trig="trace", dscr="Debug print the top value on the stack without popping it"},
		{ t("⸮") }
	),
	-- Pairs
	s(
		{trig="arr", dscr="An array"},
		fmta("[<>]", { i(1) })
	),
	s(
		{trig="boxarr", dscr="A boxed array"},
		fmta("{<>}", { i(1) })
	),
	s(
		{trig="func", dscr="A function"},
		fmta("(<>)", { i(1) })
	),
	s(
		{trig="switchfunc", dscr="A switch function"},
		fmta("⟨<>⟩", { i(1) })
	),
	-- Types
	s(
		{trig="character", dscr="A single char"},
		{ t("@") }
	),
	s(
		{trig="str", dscr="A string"},
		fmta("\"<>\"", { i(1) })
	),
	s(
		{trig="fmtstr", dscr="A format string"},
		fmta("$\"<>\"", { i(1) })
	),
	s(
		{trig="macro", dscr="A macro"},
		fmta("<><> ← ^!",
		{
			i(1, "MacroName"),
			i(2, "![!!...]")
		})
	),
	s(
		{trig="bind", dscr="Bind an element to a variable"},
		{ t("←") }
	),
	s(
		{trig="binding", dscr="Bind an element to a variable"},
		{ t("←") }
	),
}
