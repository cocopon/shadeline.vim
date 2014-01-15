" Maintainer: cocopon <cocopon@me.com>
" License:    MIT License


let s:save_cpo = &cpo
set cpo&vim


let s:mode_map = {
			\ 	'n': 'NORMAL',
			\ 	'i': 'INSERT',
			\ 	'R': 'REPLACE',
			\ 	'v': 'VISUAL',
			\ 	'V': 'V-LINE',
			\ 	"\<C-v>": 'V-BLOCK',
			\ 	'c': 'COMMAND',
			\ 	's': 'SELECT',
			\ 	'S': 'S-LINE',
			\ 	"\<C-s>": 'S-BLOCK',
			\ }


function! shadeline#functions#fileencoding()
	let fenc = &fileencoding
	return empty(fenc) ? &enc : fenc
endfunction


function! shadeline#functions#fileformat()
	return &fileformat
endfunction


function! shadeline#functions#filetype()
	let ft = &filetype
	return empty(ft) ? 'none' : ft
endfunction


function! shadeline#functions#mode()
	return get(s:mode_map, mode(), '')
endfunction


function! shadeline#functions#modified()
	return &modified ? '[+]' : ''
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
