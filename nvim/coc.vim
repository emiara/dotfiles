" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup


nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
