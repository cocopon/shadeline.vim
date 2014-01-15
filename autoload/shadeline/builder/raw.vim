" Maintainer: cocopon <cocopon@me.com>
" License:    MIT License


let s:save_cpo = &cpo
set cpo&vim


function! shadeline#builder#raw#build(config)
	return a:config.value
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
