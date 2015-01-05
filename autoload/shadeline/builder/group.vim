" Maintainer: cocopon <cocopon@me.com>
" License:    MIT License


let s:save_cpo = &cpo
set cpo&vim


function! shadeline#builder#group#value(config) abort
	let items = []
	for item_config in a:config.items
		let item = shadeline#builder#build_item(item_config)
		if !empty(item)
			call add(items, item)
		endif
		unlet item_config
	endfor

	let value = '%'
	let value .= shadeline#builder#format_fields(a:config)
	let value .= printf('(%s%%)',
				\ join(items, a:config.separator))
	return value
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
