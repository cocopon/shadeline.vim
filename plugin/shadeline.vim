" Maintainer: cocopon <cocopon@me.com>
" License:    MIT License


let s:save_cpo = &cpo
set cpo&vim


if exists('g:loaded_shadeline') && g:loaded_shadeline
	finish
endif


command! -nargs=0 ShadelineEnable call shadeline#enable()
command! -nargs=0 ShadelineDisable call shadeline#disable()
command! -nargs=0 ShadelineUpdate call shadeline#update_all()


if has('vim_starting')
  augroup Shadeline
    autocmd!
    autocmd VimEnter * call shadeline#init()
  augroup END
else
  call shadeline#init()
endif


let g:loaded_shadeline = 1


let &cpo = s:save_cpo
unlet s:save_cpo
