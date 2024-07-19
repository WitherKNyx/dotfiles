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
local fmta = require("luasnip.extras.fmt").fmta

return {
s({trig='allow'},
	fmta('#![allow(<>)]',
	{
		i(1)
	})
),
s({trig='deny'},
	fmta('#![deny(<>)]',
	{
		i(1)
	})
),
s({trig='warn'},
	fmta('#![warn(<>)]',
	{
		i(1)
	})
),
s({trig='no_std'},
	t('#![no_std]')
),
s({trig='no_core'},
	t('#![no_core]')
),
s({trig='feature'},
	fmta('#![feature(<>)]',
	{
		i(1)
	})
),
s({trig='macro_use'},
	fmta('#![macro_use(<>)]',
	{
		i(1)
	})
),
s({trig='repr'},
	fmta('#![repr(<>)]',
	{
		i(1)
	})
),
s({trig='cfg'},
	fmta('#![cfg(<>)]',
	{
		i(1)
	})
),
s({trig='cfg_attr'},
	fmta('#![cfg_attr(<>, <>)]',
	{
		i(1),
		i(2)
	})
),
s({trig='cfg!'},
	fmta('cfg!(<>)',
	{
		i(1)
	})
),
s({trig='column'},
	t('column!(<>)')
),
s({trig='concat'},
	fmta('concat!(<>)',
	{
		i(1)
	})
),
s({trig='concat_idents'},
	fmta('concat_idents!(<>)',
	{
		i(1)
	})
),
s({trig='debug_assert'},
	fmta('debug_assert!(<>)',
	{
		i(1)
	})
),
s({trig='debug_assert_eq'},
	fmta('debug_assert_eq!(<>, <>)',
	{
		i(1),
		i(2)
	})
),
s({trig='env'},
	fmta('env!("<>")',
	{
		i(1)
	})
),
s({trig='file'},
	t('file!()')
),
s({trig='format'},
	fmta('format!("<>")',
	{
		i(1)
	})
),
s({trig='format_args'},
	fmta('format_args!("<>")',
	{
		i(1)
	})
),
s({trig='include'},
	fmta('include!("<>")',
	{
		i(1)
	})
),
s({trig='include_bytes'},
	fmta('include_bytes!("<>")',
	{
		i(1)
	})
),
s({trig='include_str'},
	fmta('include_str!("<>")',
	{
		i(1)
	})
),
s({trig='line'},
	t('line!()')
),
s({trig='module_path'},
	t('module_path!()')
),
s({trig='option_env'},
	fmta('option_env!("<>")',
	{
		i(1)
	})
),
s({trig='panic'},
	fmta('panic!("<>")',
	{
		i(1)
	})
),
s({trig='print'},
	fmta('print!("<>")',
	{
		i(1)
	})
),
s({trig='println'},
	fmta('println!("<>")',
	{
		i(1)
	})
),
s({trig='stringify'},
	fmta('stringify!(<>)',
	{
		i(1)
	})
),
s({trig='thread_local'},
	fmta('thread_local!(static <>: <> = <>);',
	{
		i(1, "name"),
		i(2, "type"),
		i(3, "init")
	})
),
s({trig='try'},
	fmta('try!(<>)',
	{
		i(1)
	})
),
s({trig='unimplemented'},
	t('unimplemented!()')
),
s({trig='unreachable'},
	fmta('unreachable!(<>)',
	{
		i(1)
	})
),
s({trig='vec'},
	fmta('vec![<>]',
	{
		i(1)
	})
),
s({trig='write'},
	fmta('write!(<>, "<>")',
	{
		i(1),
		i(2)
	})
),
s({trig='writeln'},
	fmta('writeln!(<>, "<>")',
	{
		i(1),
		i(2)
	})
),
s({trig='assert'},
	fmta('assert!(<>)',
	{
		i(1)
	})
),
s({trig='assert_eq'},
	fmta('assert_eq!(<>, <>)',
	{
		i(1),
		i(2)
	})
),
s({trig='bench'},
	fmta([[
		#[bench]
		fn <>(b: &mut test::Bencher) {
			b.iter(|| <>)
		}
	]],
	{
		i(1, 'name'),
		i(2, 'todo!();')
	})
),
s({trig='const'},
	fmta('const <>: <> = <>',
	{
		i(1, 'name'),
		i(2, 'type'),
		i(3, 'init')
	})
),
s({trig='derive'},
	fmta('#[derive(<>)]',
	{
		i(1)
	})
),
s({trig='enum'},
	fmta([[
		#[derive(Debug)]
		enum <> {
			<>,
			<>,
		}
	]],
	{
		i(1, 'name'),
		i(2, 'type1'),
		i(3, 'type2')
	})
),
s({trig='extern-crate'},
	fmta('extern crate <>;',
	{
		i(1)
	})
),
s({trig='extern-fn'},
	fmt([[
		extern "C" fn []([]: []) -> [] {
			[]
		}
	]],
	{
		i(1, 'name'),
		i(2, 'arg'),
		i(3, 'type'),
		i(4, 'retType'),
		i(5, 'todo!();')
	},
	{
		delimiters = '[]'
	})
),
s({trig='extern-mod'},
	fmta([[
		extern "C" {
			<>
		}
	]],
	{
		i(1, 'todo!();')
	})
),
s({trig='pfn'},
	fmt([[
		pub fn []([]: []) -> [] {
			[]
		}
	]],
	{
		i(1, 'name'),
		i(2, 'arg'),
		i(3, 'type'),
		i(4, 'retType'),
		i(5, 'todo!();')
	},
	{
		delimiters = '[]'
	})
),
s({trig='fn'},
	fmt([[
		fn []([]: []) -> [] {
			[]
		}
	]],
	{
		i(1, 'name'),
		i(2, 'arg'),
		i(3, 'type'),
		i(4, 'retType'),
		i(5, 'todo!();')
	},
	{
		delimiters = '[]'
	})
),
s({trig='for'},
	fmta([[
		for <> in <> {
			<>
		}
	]],
	{
		i(1, 'pat'),
		i(2, 'expr'),
		i(3, 'todo!();')
	})
),
s({trig='if-let'},
	fmta([[
		if let <> = <> {
			<>
		}
	]],
	{
		i(1, 'Some(pat)'),
		i(2, 'expr'),
		i(3, 'todo!();')
	})
),
s({trig='if'},
	fmta([[
		if <> {
			<>
		}
	]],
	{
		i(1, 'cond'),
		i(2, 'todo!();')
	})
),
s({trig='imp-trait'},
	fmta([[
		impl <> for <> {
			<>
		}
	]],
	{
		i(1, 'trait'),
		i(2, 'type'),
		i(3, 'todo!();')
	})
),
s({trig='inline-fn'},
	fmta([[
		#[inline]
		pub fn <>() {
			<>
		}
	]],
	{
		i(1, 'name'),
		i(2, 'todo!();')
	})
),
s({trig='macro_rules'},
	fmt([[
		macro_rules! [] {
			([]) => ([])
		}
	]],
	{
		i(1, 'name'),
		i(2),
		i(3)
	},
	{
		delimiters = '[]'
	})
),
s({trig='main'},
	fmta([[
		fn main() {
			<>
		}
	]],
	{
		i(1, 'todo!();')
	})
),
s({trig='match'},
	fmta('match <> {<>}',
	{
		i(1, 'expr'),
		i(0)
	})
),
s({trig='mod-block'},
	fmta([[
		mod <> {
			<>
		}
	]],
	{
		i(1, 'name'),
		i(2, 'todo!();')
	})
),
s({trig='static'},
	fmta('static <>: <> = <>',
	{
		i(1, "name"),
		i(2, "type"),
		i(3, "init")
	})
),
s({trig='struct-tuple'},
	fmta('struct <>(<>);',
	{
		i(1, 'name'),
		i(2, 'type')
	})
),
s({trig='struct-unit'},
	fmta('struct <>;',
	{
		i(1, 'name')
	})
),
s({trig='struct'},
	fmta([[
		#[derive(Debug)]
		struct <> {
			<>: <>
		}
	]],
	{
		i(1, 'name'),
		i(2, 'field'),
		i(3, 'type')
	})
),
s({trig='modtest'},
	fmta([[
		#[cfg(test)]
		mod test {
			#[test]
			fn <>() {
				<>
			}
		}
	]],
	{
		i(1, 'name'),
		i(2, 'todo!();')
	})
),
s({trig='test'},
	fmta([[
		#[test]
		fn <>() {
			<>
		}
	]],
	{
		i(1, 'name'),
		i(2, 'todo!();')
	})
),
s({trig='trait'},
	fmta([[
		trait <> {
			<>
		}
	]],
	{
		i(1, 'name'),
		i(2, 'todo!();')
	})
),
s({trig='type'},
	fmta('type <> = <>;',
	{
		i(1, 'alias'),
		i(2, 'type')
	})
),
s({trig='while-let'},
	fmta([[
		while let <> = <> {
			<>
		}
	]],
	{
		i(1, 'Some(pat)'),
		i(2, 'expr'),
		i(3, 'todo!();')
	})
),
s({trig='while'},
	fmta([[
		while <> {
			<>
		}
	]],
	{
		i(1, 'cond'),
		i(2, 'todo!();')
	})
),
s({trig='///'},
	fmta([[
		/// <>
		///
		/// # Arguments
		/// * <> - <>
		///
		/// # Returns
		/// <>
		///
		/// # Examples
		/// ```rust
		/// <>
		/// ```
	]],
	{
		i(1, 'Description'),
		i(3, 'Arg Name'),
		i(4, 'Arg Type and Description'),
		i(2, 'Type and Description of Ret Obj'),
		i(5, 'Write Later')
	})
),
}
