" Maintainer: cocopon <cocopon@me.com>
" License:    MIT License


let s:save_cpo = &cpo
set cpo&vim


let s:short_names = {
			\ 	'fenc': 'fileencoding',
			\ 	'ff': 'fileformat',
			\ 	'fname': 'filename',
			\ 	'ft': 'filetype',
			\ 	'mod': 'modified',
			\ }


function! shadeline#preset#function_name(name) abort
	let name = get(s:short_names, a:name, a:name)
	return printf('shadeline#preset#%s', name)
endfunction


function! shadeline#preset#fan() abort
	return {
				\ 	'type': 'function',
				\ 	'value': 'shadeline#functions#fan',
				\ }
endfunction


function! shadeline#preset#fileencoding() abort
	return {
				\ 	'type': 'function',
				\ 	'value': 'shadeline#functions#fileencoding',
				\ }
endfunction


function! shadeline#preset#fileformat() abort
	return {
				\ 	'type': 'function',
				\ 	'value': 'shadeline#functions#fileformat',
				\ }
endfunction


function! shadeline#preset#filename() abort
	return {
				\ 	'type': 'raw',
				\ 	'value': '%t',
				\ }
endfunction


function! shadeline#preset#filetype() abort
	return {
				\ 	'type': 'function',
				\ 	'value': 'shadeline#functions#filetype',
				\ }
endfunction


function! shadeline#preset#flags() abort
	return {
				\ 	'type': 'group',
				\ 	'separator': '',
				\ 	'items': [
				\ 		'%h',
				\ 		'%w',
				\ 		'modified',
				\ 		'%r',
				\ 	]
				\ }
endfunction


function! shadeline#preset#mode() abort
	return {
				\ 	'type': 'function',
				\ 	'value': 'shadeline#functions#mode',
				\ }
endfunction


function! shadeline#preset#modified() abort
	return {
				\ 	'type': 'function',
				\ 	'value': 'shadeline#functions#modified',
				\ }
endfunction


function! shadeline#preset#ruler() abort
	return {
				\ 	'type': 'raw',
				\ 	'value': '%3p%%:%-2v',
				\ }
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
