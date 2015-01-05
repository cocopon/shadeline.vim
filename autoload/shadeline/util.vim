" Maintainer: cocopon <cocopon@me.com>
" License:    MIT License


let s:save_cpo = &cpo
set cpo&vim


let s:escape_patterns = [
			\ 	['%', '%%'],
			\ ]


function! shadeline#util#escape(text) abort
	let result = a:text
	for pair in s:escape_patterns
		let result = substitute(result, pair[0], pair[1], 'g')
	endfor
	return result
endfunction


function! shadeline#util#setup_methods(instance, namespace, methods) abort
	for method in a:methods
		let a:instance[method] = function(join([a:namespace, method], '#'))
	endfor
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
