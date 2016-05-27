:set foldmethod=expr
:set foldexpr=GetCFold(v:lnum)

function! GetCFFold(lnum)
	if getline(a:lnum) =~# '^\s*"Parameters":'
		return '>1'
	elseif getline(a:lnum) =~# '^\s*"Mappings":'
		return '>1'
	elseif getline(a:lnum) =~# '^\s*"Resources":'
		return '>1'
	elseif getline(a:lnum) =~# '^\s*{\s*' && ( getline(a:lnum - 1) =~# '^\s*},' || getline(a:lnum - 1) =~# '^\s*"resources":' )
		return '>2'
	else
		return '='
	endif
endfunction
