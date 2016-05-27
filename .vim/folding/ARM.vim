" Folding for Azure Resource Manager templates
" 
" To use this add the following to your vimrc
" :autocmd BufRead,BufNewFile azuredeploy.json source ~/.vim/folding/ARM.vim
"

set foldmethod=expr
set foldexpr=GetARMFold(v:lnum)
set foldtext=ARMFoldText()

function! GetARMFold(lnum)
	if getline(a:lnum) =~# '^\s*"parameters":'
		return '>1'
	elseif getline(a:lnum) =~# '^\s*"variables":'
		return '>1'
	elseif getline(a:lnum) =~# '^\s*"resources":'
		return '>1'
	elseif getline(a:lnum) =~# '^\s*{\s*' && ( getline(a:lnum - 1) =~# '^\s*},' || getline(a:lnum - 1) =~# '^\s*"resources":' ) || getline(a:lnum - 1) =~# '^\s*"subnets":' 
		return '>2'
	"elseif 'apiVersion exists between the opening and closing brackets of the
	"block
	"	elseif getline(a:lnum) =~# '^\s*{'
	"	let n = a:lnum + 1
	"	while getline(n) !~# '^.*{'
	"		if getline(n) =~# '^\s*"apiVersion":'
	"			return '>2'
	"		else
	"			return '='
	"		endif
	"		let n += 1
	"	endwhile
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
