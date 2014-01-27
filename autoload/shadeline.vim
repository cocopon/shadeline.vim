" Maintainer: cocopon <cocopon@me.com>
" License:    MIT License


let s:save_cpo = &cpo
set cpo&vim


let s:def_config = {
			\ 	'active': {
			\ 		'left': ['fname', ' ', 'flags'],
			\ 		'right': ['<', ['ff', 'fenc', 'ft'], ' ', 'ruler'],
			\ 	},
			\ 	'inactive': {
			\ 		'left': ['fname', ' ', 'flags'],
			\ 	}
			\ }


function! shadeline#init()
	if !has_key(g:, 'shadeline')
		let g:shadeline = deepcopy(s:def_config)
	endif
	call shadeline#expander#expand(g:shadeline)
	let g:shadeline.initialized_ = 1

	call shadeline#enable()
endfunction


function! shadeline#enable()
	augroup Shadeline
		autocmd!
		autocmd BufWinEnter,WinEnter * call shadeline#update_all()
	augroup END

	call shadeline#update_all()
endfunction


function! shadeline#disable()
	augroup Shadeline
		autocmd!
	augroup END

	let last_i = winnr('$')
	let i = 1

	while i <= last_i
		call setwinvar(i, '&stl', '')
		let i += 1
	endwhile
endfunction


function! shadeline#update_all()
	if !has_key(g:, 'shadeline')
				\ || !get(g:shadeline, 'initialized_', 0)
		call shadeline#init()
		return
	endif

	let last_i = winnr('$')
	let i = 1

	while i <= last_i
		call shadeline#update(i)
		let i += 1
	endwhile
endfunction


function! shadeline#update(winnr)
	let stl = shadeline#builder#build(g:shadeline, a:winnr)
	call setwinvar(a:winnr, '&stl', stl)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
