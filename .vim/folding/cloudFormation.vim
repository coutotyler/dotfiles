" Folding for Azure Resource Manager templates
" 
" To use this add the following to your vimrc
" :autocmd BufRead,BufNewFile *.cf source ~/.vim/folding/cloudFormation.vim
"

set filetype=json
set foldmethod=expr
set foldexpr=GetCfFold(v:lnum)

function! GetCfFold(lnum)
	if getline(a:lnum) =~# '^\s*"Parameters":'
		return '>1'
	elseif getline(a:lnum) =~# '^\s*"Mappings":'
		return '>1'
	elseif getline(a:lnum) =~# '^\s*"Resources":'
		return '>1'
	elseif getline(a:lnum+1) =~# '^\s*"Type":' && getline(a:lnum) !~# '^\s*"Properties":'
		return '>2'
	else
		return '='
	endif
endfunction
