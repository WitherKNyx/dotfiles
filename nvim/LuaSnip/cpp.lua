local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local rep = require('luasnip.extras').rep
local fmt = require("luasnip.extras.fmt").fmt

return {
s({trig='for', dscr='Code snippet for \'for\' loop'},
	c(1, {
		fmt([[
			for ([] [] = []; [] < []; []++) {
				[]
			}
			]],
		{
			i(1, 'size_t'),
			i(2, 'i'),
			i(3, '0'),
			rep(1),
			i(4, 'length'),
			rep(1),
			i(0),
		}, {
			delimiters = '[]'
		}),
		fmt([[
			for ([] [] = []; [] >= []; []--) {
				[]
			}
			]],
		{
			i(1, 'size_t'),
			i(2, 'i'),
			i(3, 'length'),
			rep(1),
			i(4, '0'),
			rep(1),
			i(0),
		}, {
			delimiters = '[]'
		}),
	})
),
s({trig='while', dscr='Code snippet for \'while\' loop'},
	fmt([[
		while ([]) {
			[]
		}
	]],
	{
		i(1, 'true'),
		i(0)
	},
	{
		delimiters = '[]'
	})
),
s({trig='do', dscr='Code snippet for \'do while\' loop'},
	fmt([[
		do {
			[]
		} while ([]);
	]],
	{
		i(0),
		i(1, 'true')
	},
	{
		delimiters = '[]'
	})
),
s({trig='foreach', dscr='Code snippet for \'foreach\' loop'},
	fmt([[
		for ([] [] : []) {
			[]
		}
	]],
	{
		i(1, 'auto'),
		i(2, 'elem'),
		i(3, 'collection'),
		i(0)
	},
	{
		delimiters = '[]'
	})
),
s({trig='if', dscr='Code snippet for \'if\' statement'},
	fmt([[
		if ([]) {
			[]
		} []
	]],
	{
		i(1, 'true'),
		i(0),
		c(2, {
			t(''),
			t([[
			else {

			}
			]])
		})
	},
	{
		delimiters = '[]'
	})
),
s({trig='class', dscr='Code snippet for a class'},
	c(1, {
		fmt([[
			class [] {
			public:
				[]();
				[]([]&&) = default;
				[](const []&) = default;
				[]& operator=([]&&) = default;
				[]& operator=(const []&) = default;
				~[]();

			private:
				[]
			};
		]],
		{
			i(1, 'ClassName'),
			rep(1),
			rep(1),
			rep(1),
			rep(1),
			rep(1),
			rep(1),
			rep(1),
			rep(1),
			rep(1),
			rep(1),
			i(2, 'variables')
		},
		{
			delimiters = '[]'
		}),
		fmt([[
			class [] {
			public:
				[]

			private:
				[]
			};
		]],
		{
			i(1, 'ClassName'),
			i(3, 'functions'),
			i(2, 'variables')
		},
		{
			delimiters = '[]'
		})
	})
),
s({trig='namespace', dscr='Code snippet for a namespace'},
	fmt([[
		namespace [] {
			[]
		}
	]],
	{
		i(1, 'Name'),
		i(0)
	},
	{
		delimiters = '[]'
	})
),
s({trig='switch', dscr='Code snippet for switch statement'},
	fmt([[
		switch([]) {
			default:
				[]
				break;
		}
	]],
	{
		i(1, 'switch variable'),
		i(0)
	},
	{
		delimiters = '[]'
	})
),
s({trig='struct', dscr='Code snippet for a struct'},
	fmt([[
		struct [] {
			[]
		};
	]],
	{
		i(1, 'StructName'),
		i(0)
	},
	{
		delimiters = '[]'
	})
),
s({trig='union', dscr='Code snippet for a union'},
	fmt([[
		union [] {
			[]
		};
	]],
	{
		i(1, 'UnionName'),
		i(0)
	},
	{
		delimiters = '[]'
	})
),
s({trig='try', dscr='Code snipper for try catch blocks'},
	fmt([[
		try {
			[]
		} catch ([]) {
		}
	]],
	{
		i(2),
		i(1, 'const std::exception&')
	},
	{
		delimiters = '[]'
	})
),
s({trig='sca', dscr='static cast'},
	fmt('static_cast<[]>([])[]',
	{
		i(1, 'type'),
		i(2, 'expression'),
		i(3)
	},
	{
		delimiters = '[]'
	})
),
s({trig='dca', dscr='dynamic cast'},
	fmt('dynamic_cast<[]>([])[]',
	{
		i(1, 'type'),
		i(2, 'expression'),
		i(3)
	},
	{
		delimiters = '[]'
	})
),
s({trig='rca', dscr='reinterpret cast'},
	fmt('reinterpret_cast<[]>([])[]',
	{
		i(1, 'type'),
		i(2, 'expression'),
		i(3)
	},
	{
		delimiters = '[]'
	})
),
s({trig='cca', dscr='const cast'},
	fmt('const_cast<[]>([])[]',
	{
		i(1, 'type'),
		i(2, 'expression'),
		i(3)
	},
	{
		delimiters = '[]'
	})
),
}
