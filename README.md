Shadeline
=========
Shadeline provides a very simple way to customize your status line.


Why Shadeline?
--------------
- Simple configuration

	```vim
	let g:shadeline = {}
	let g:shadeline.active = {
	      \   'left':  ['fname', 'flags'],
	      \   'right': ['ruler']
	      \ }
	let g:shadeline.inactive = {
	      \   'left':  ['fname', 'flags']
	      \ }
	```

	That's all. Very simple.

- No extra color scheme

	It's peaceful, doesn't require a separate color scheme like other plugin.
	You can enjoy status line customization with your favorite color scheme!


License
-------
MIT License. See `LICENSE.txt` for more information.
