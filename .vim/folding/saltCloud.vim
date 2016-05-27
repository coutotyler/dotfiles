" Folding for Azure Resource Manager templates
" 
" To use this add the following to your vimrc
" :autocmd BufRead,BufNewFile azuredeploy.json source ~/.vim/folding/ARM.vim
"

set foldmethod=expr
set foldexpr=GetSaltCloudFold(v:lnum)

function! GetSaltCloudFold(lnum)
	if getline(a:lnum) =~# '^[a-zA-Z0-9]'
		return '>1'
	else
		return '='
	endif
endfunction
