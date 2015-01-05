" Maintainer: cocopon <cocopon@me.com>
" License:    MIT License


let s:save_cpo = &cpo
set cpo&vim


function!shadeline#builder#function#value(config) abort
	let value = '%'
	let value .= shadeline#builder#format_fields(a:config)
	let value .= printf('{%s()}', a:config.value)

	return value
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
