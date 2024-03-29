-- ~/.config/nvim/lua/luasnip-helper-funcs.lua
local M = {}

-- Be sure to explicitly define these LuaSnip node abbreviations!

local sn = ls.snippet_node
local i = ls.insert_node

function M.get_visual(_, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ''))
  end
end

M.in_mathzone = function()
	return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

M.in_text = function()
	return not M.in_mathzone()
end

M.in_comment = function()
	return vim.fn['vimtex#syntax#in_comment']() == 1
end

M.in_env = function(name)
	local is_inside = vim.fn['vimtex#env#is_inside'](name)
	return (is_inside[1] > 0 and is_inside[2] > 0)
end

M.in_equation = function()
	return M.in_env('equation')
end

M.in_itemize = function()
	return M.in_env('itemize')
end

M.in_enumerate = function()
	return M.in_env('enumerate')
end

M.in_items = function()
	return (M.in_itemize() or M.in_enumerate())
end

return M
