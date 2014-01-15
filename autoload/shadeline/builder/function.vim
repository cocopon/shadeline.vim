" Maintainer: cocopon <cocopon@me.com>
" License:    MIT License


let s:save_cpo = &cpo
set cpo&vim


function!shadeline#builder#function#build(config)
	let config = copy(a:config)
	let config.value = printf('{%s()}', config.value)
	return shadeline#builder#item#build(config)

	return shadeline#builder#item#build(value)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
