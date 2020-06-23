syntax on


set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nu rnu
set nowrap
set smartcase
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

let mapleader = " "


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin(stdpath('data') . '/plugged')
Plug 'ycm-core/YouCompleteMe'
Plug 'gruvbox-community/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'kien/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'camspiers/lens.vim'
call plug#end()

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

if executable('rg')
	let g:rg_derive_root='true'
endif


colorscheme gruvbox
set background=dark

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


"!- Lightline Configuration
set noshowmode



nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd h<CR>
nnoremap <leader>u :UndotreeToggle<CR>

nnoremap <leader>ps :Rg<SPACE>


"!- NERDTREE
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <C-c> :NERDTreeToggle<CR>

"!- COC CONFIG FILE FROM GITHUB

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
"!- COC CONFIG FILE FROM GITHUB                     END


let g:loaded_youcompleteme = 1

fun! GoYCM()
"	<buffer> <silent> call CocDisable()
	let g:loaded_youcompleteme = 0

	call plug#begin(stdpath('data') . '/plugged')
	Plug 'ycm-core/YouCompleteMe'
	call plug#end()

	nnoremap <buffer> <silent> <leader>gd :YcmComleter GoTo<CR>
	nnoremap <buffer> <silent> <leader>gr :YcmComleter GoReferences<CR>
	nnoremap <buffer> <silent> <leader>rr :YcmComleter RefactorRename<CR>
endfun


fun! GoCoc()
	inoremap <buffer> <silent><expr> <TAB>
		  \ pumvisible() ? "\<C-n>" :
		  \ <SID>check_back_space() ? "\<TAB>" :
		  \ coc#refresh()
	inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	set statusline^=%{coc#status()}

	nmap <buffer> <leader>gd <Plug>(coc-definition)
	nmap <buffer> <leader>gy <Plug>(coc-type-definition)
	nmap <buffer> <leader>gi <Plug>(coc-implementation)
	nmap <buffer> <leader>gr <Plug>(coc-references)
	nmap <buffer> <silent> K :call <SID>show_documentation()<CR>
	nnoremap <buffer> <leader>cr :CocRestart
endfun

fun! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun


autocmd BufWritePre * :call TrimWhitespace()
autocmd FileType typescript,javascript :call GoYCM()
autocmd FileType cpp,cxx,h,hpp,c,php,python,html :call GoCoc()


nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>ps :Rg<SPACE>


set scrolloff=5



