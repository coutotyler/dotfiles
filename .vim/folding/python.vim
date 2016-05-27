:set foldmethod=expr
:set foldexpr=GetPythonFold(v:lnum)
nnoremap <buffer><localleader>c I#@ <esc>

function! GetPythonFold(lnum)
	if getline(a:lnum) =~# '^\s*class\s'
		return '>1'
	elseif getline(a:lnum) =~# '^\s*def\s'
		return '>2'
	else
		return '='
	endif
endfunction
