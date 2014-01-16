" Maintainer: cocopon <cocopon@me.com>
" License:    MIT License


let s:save_cpo = &cpo
set cpo&vim


let s:def_line_item_separator = ' '
let s:def_group_item_separator = ' | '


function! shadeline#expander#expand(config)
	for activity in ['active', 'inactive']
		if !has_key(a:config, activity)
			let a:config[activity] = {}
		endif
		call s:expand_line(a:config[activity])
	endfor
endfunction


function! s:expand_line(line_config)
	for side in ['left', 'right']
		if !has_key(a:line_config, side)
			let a:line_config[side] = []
		endif
		call map(a:line_config[side], 's:expand_item_data(v:val)')
	endfor

	let a:line_config.prefix = shadeline#util#escape(
				\ get(a:line_config, 'prefix', ''))
	let a:line_config.postfix = shadeline#util#escape(
				\ get(a:line_config, 'postfix', ''))
	let a:line_config.separator = shadeline#util#escape(
				\ get(a:line_config, 'separator', s:def_line_item_separator))
endfunction


function! s:expand_item_data(data)
	if type(a:data) == type({})
		return s:expand_item_config(a:data)
	endif

	if type(a:data) == type([])
		let config = {
					\ 	'type': 'group',
					\ 	'items': a:data
					\ }
		return s:expand_item_config(config)
	endif

	if type(a:data) == type('')
		let config = s:str2config(a:data)
		return s:expand_item_config(config)
	endif

	throw printf('Invalid item type: %s',
				\ string(a:data))
endfunction


function! s:expand_item_config(config)
	let config = copy(a:config)

	if config.type ==# 'group'
		call map(config.items, 's:expand_item_data(v:val)')
		let config.separator = shadeline#util#escape(
					\ get(config, 'separator', s:def_group_item_separator))
	endif

	let config.prefix = shadeline#util#escape(
				\ get(config, 'prefix', ''))
	let config.postfix = shadeline#util#escape(
				\ get(config, 'postfix', ''))

	return config
endfunction


function! s:str2config(str)
	if a:str == '<'
		" Truncation mark
		return {
					\ 	'type': 'raw',
					\ 	'value': '%<'
					\ }
	endif

	if match(a:str, '^%') == 0
		" Raw value
		return {
					\ 	'type': 'raw',
					\ 	'value': a:str,
					\ }
	endif

	if match(a:str, '^[a-z]\+$\C') == 0
		" Preset
		let preset = shadeline#preset#function_name(a:str)
		return function(preset)()
	endif

	if match(a:str, '^[A-Z]\w*$\C') == 0
		" Function
		return {
					\ 	'type': 'function',
					\ 	'value': a:str,
					\ }
	endif

	" Text
	return {
				\ 	'type': 'raw',
				\ 	'value': shadeline#util#escape(a:str),
				\ }
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
