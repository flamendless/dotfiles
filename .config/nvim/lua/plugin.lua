function OnSetText(uri, text)
	if text:sub(1, 4) ~= '--##' then
		return nil
	end

	local diffs = {}
	diffs[#diffs+1] = {
		start  = 1,
		finish = 4,
		text   = '',
	}

	for localPos, colonPos, typeName, finish in text:gmatch '()local%s+[%w_]+()%s*%:%s*([%w_]+)()' do
		diffs[#diffs+1] = {
			start  = localPos,
			finish = localPos - 1,
			text   = ('---@type %s\n'):format(typeName),
		}
		diffs[#diffs+1] = {
			start  = colonPos,
			finish = finish - 1,
			text   = '',
		}
	end

	return diffs
end
