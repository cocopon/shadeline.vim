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


function! shadeline#functions#fan() abort
	if !exists('b:shadeline_fan_count')
				\ || b:shadeline_fan_count >= 3
		let b:shadeline_fan_count = -1
	endif

	let b:shadeline_fan_count += 1

	return ['-', '\', '|', '/'][b:shadeline_fan_count]
endfunction


function! shadeline#functions#fileencoding() abort
	let fenc = &fileencoding
	return empty(fenc) ? &enc : fenc
endfunction


function! shadeline#functions#fileformat() abort
	return &fileformat
endfunction


function! shadeline#functions#filetype() abort
	let ft = &filetype
	return empty(ft) ? 'none' : ft
endfunction


function! shadeline#functions#mode() abort
	return get(s:mode_map, mode(), '')
endfunction


function! shadeline#functions#modified() abort
	return &modified ? '[+]' : ''
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
