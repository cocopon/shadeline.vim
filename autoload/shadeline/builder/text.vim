" Maintainer: cocopon <cocopon@me.com>
" License:    MIT License


let s:save_cpo = &cpo
set cpo&vim


function! shadeline#builder#text#value(config)
	return shadeline#util#escape(a:config.value)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
