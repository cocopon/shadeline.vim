" Maintainer: cocopon <cocopon@me.com>
" License:    MIT License


let s:save_cpo = &cpo
set cpo&vim


function! shadeline#builder#item#build(config)
	let result = ''

	let prefix = get(a:config, 'prefix', '')
	if !empty(prefix)
		let result .= shadeline#util#escape(prefix)
	endif

	let result .= '%'

	if get(a:config, 'min_width', -1) > 0
		let result .= string(a:config.min_width)
	endif
	if get(a:config, 'max_width', -1) > 0
		let result .= '.' . string(a:config.max_width)
	endif

	let result .= a:config.value

	let postfix = get(a:config, 'postfix', '')
	if !empty(postfix)
		let result .= shadeline#util#escape(postfix)
	endif

	return result
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
