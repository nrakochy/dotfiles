execute pathogen#infect()
set swapfile
set clipboard=unnamed,unnamedplus
set paste
set nu 
syntax on
filetype plugin indent on

function! TestToplevel() abort  
    "Eval the toplevel clojure form (a deftest) and then test-var the result."
    normal! ^
    let line1 = searchpair('(','',')', 'bcrn', g:fireplace#skip)
    let line2 = searchpair('(','',')', 'rn', g:fireplace#skip)
    let expr = join(getline(line1, line2), "\n")
    let var = fireplace#session_eval(expr)
    let result = fireplace#echo_session_eval("(clojure.test/test-var " . var . ")")
    return result
endfunction  

au Filetype clojure nmap <c-c><c-t> :call TestToplevel()<cr>  

"Reload the changes into the current JVM with CTRL-C + CTRL-K.
au Filetype clojure nmap <c-c><c-k> :Require<cr>  
