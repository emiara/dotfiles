
" Creates a session
function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:sessionfile = b:sessiondir . '/session.vim'
  exe "mksession! " . b:sessionfile
endfunction

" Updates a session, BUT ONLY IF IT ALREADY EXISTS
function! UpdateSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe "mksession! " . b:sessionfile
    echo "updating session"
  endif
endfunction

" Loads a session if it exists
function! LoadSession()
  if argc() == 0
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
      exe 'source ' b:sessionfile
    else
      echo "No session loaded."
    endif
  else
    let b:sessionfile = ""
    let b:sessiondir = ""
  endif
endfunction

au VimEnter * nested :call LoadSession()
au VimLeave * :call UpdateSession()

map <C-c> :NERDTreeToggle<CR>



autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

autocmd FileType php map <buffer> <F9> :w<CR>:exec '!php5.6' shellescape(@%, 1)<CR>
autocmd FileType php imap <buffer> <F9> <esc>:w<CR>:exec '!php5.6' shellescape(@%, 1)<CR>

autocmd FileType javascript map <buffer> <F9> :w<CR>:exec '!node' shellescape(@%, 1)<CR>
autocmd FileType javascript imap <buffer> <F9> <esc>:w<CR>:exec '!node' shellescape(@%, 1)<CR>


"!- COC configuration
let g:coc_node_path="/usr/bin/node"



nmap <buffer> <F2> :set paste<CR>"+p:set nopaste<CR>
imap <buffer> <F2> :set paste<CR>"+p<ESC>:set nopaste<CR>




"!- SyntasticLocListToggle()
let g:loclist_open = 0
function! SyntasticLocListToggle()
    if g:loclist_open
       call SyntasticLoclistHide()
       let g:loclist_open = 0 
   else 
        call SyntasticCheck()
        let g:loclist_open = 1
    endif
endfunction



nmap <buffer> 0 ^^
nmap <buffer> ^ g0


"!- Disable themes when in vimdiff. Because the colorscheme becomes
"uncreadable for some reason

if &diff
    colorscheme ron
endif
