function! GetPythonFold(lnum)
	if getline(a:lnum) =~# '^\s*class\s'
		return '>1'
	elseif getline(a:lnum) =~# '^\s*def\s'
		return '>2'
	else
		return '='
	endif
endfunction

function! GetARMFold(lnum)
	if getline(a:lnum) =~# '^\s*"parameters":'
		return '>1'
	elseif getline(a:lnum) =~# '^\s*"variables":'
		return '>1'
	elseif getline(a:lnum) =~# '^\s*"resources":'
		return '>1'
	elseif getline(a:lnum) =~# '^\s*{\s*' && ( getline(a:lnum - 1) =~# '^\s*},' || getline(a:lnum - 1) =~# '^\s*"resources":' )
		return '>2'
	else
		return '='
	endif
endfunction

function! ARMFoldText()
	" Between foldstart and foldend, return the line that has the name
	let i = v:foldstart + 1
	while i < v:foldend
		let foldName = getline(i)
		if foldName =~# '^\s*"name":'
			break
		endif
		let i += 1
	endwhile
	"if foldlevel = 2 return foldName else return foldtext
	if foldlevel(v:foldstart) == 2
		return foldName
	else
		return foldtext()
	endif
endfunction
