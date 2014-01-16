" Maintainer: cocopon <cocopon@me.com>
" License:    MIT License


let s:save_cpo = &cpo
set cpo&vim


function! shadeline#builder#build(config, winnr)
	let activity = (a:winnr == winnr()) ? 'active' : 'inactive'
	let line_config = a:config[activity]
	let context = {
				\ 	'activity': activity,
				\ }
	let results = []

	call add(results, line_config.prefix)

	let context.side = 'left'
  let items = s:build_items(line_config.left, context)
	call add(results, join(items, line_config.separator))

	call add(results, '%=')

	let context.side = 'right'
  let items = s:build_items(line_config.right, context)
	call add(results, join(items, line_config.separator))

	call add(results, line_config.postfix)

	return join(results, '')
endfunction


function! s:build_items(items, context)
	let context = {
				\ 	'index': 0,
				\ 	'items': a:items,
				\ }
	call extend(context, a:context)

	let results = []
	let i = 0

	for item_config in a:items
		" TODO: Syntax
		call add(results, shadeline#builder#build_item(item_config))

		let i += 1
		unlet item_config
	endfor

	return results
endfunction


function! shadeline#builder#build_item(item_config)
	let builder = printf('shadeline#builder#%s#build',
				\ a:item_config.type)
	return function(builder)(a:item_config)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
