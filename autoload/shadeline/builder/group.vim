" Maintainer: cocopon <cocopon@me.com>
" License:    MIT License


let s:save_cpo = &cpo
set cpo&vim


function! shadeline#builder#group#build(config)
	let config = copy(a:config)

	let items = []
	for item_config in config.items
		let item = shadeline#builder#build_item(item_config)
		if !empty(item)
			call add(items, item)
		endif
		unlet item_config
	endfor
	unlet config.items

	let config.value = printf('(%s%%)',
				\ join(items, config.separator))

	return shadeline#builder#item#build(config)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
