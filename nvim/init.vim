
call plug#begin('~/.config/nvim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
Plug 'gabrielelana/vim-markdown'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

colorscheme peachpuff

set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
syntax on
set t_Co=256              " enable 256-color mode.
"filetype indent on        " activates indenting for files
filetype plugin indent on
set autoindent
set copyindent
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set smartcase
set ruler                 " Always show info along bottom.
set history=1000
set tabstop=4             " tab spacing
set shiftwidth=4
set expandtab
set matchpairs+=<:>
set smarttab
set pastetoggle=<F2>
set number


" Theme stuff stolen from codedark theme
fun! <sid>hi(group, fg, bg, attr, sp)
  if !empty(a:fg)
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" . a:fg.cterm256
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" . a:bg.cterm256
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if !empty(a:sp)
    exec "hi " . a:group . " guisp=" . a:sp.gui
  endif
endfun

let s:cdBack = {'gui': '#1E1E1E', 'cterm256': '234'}
let s:cdLineNumber = {'gui': '#5A5A5A', 'cterm256': '240'}
call <sid>hi('LineNr', s:cdLineNumber, s:cdBack, 'none', {})


let NERDTreeShowHidden=1
highlight link NERDTreeExecFile Normal


nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

:map <C-l> <C-w>l
:map <C-j> <C-w>j
:map <C-k> <C-w>k
:map <C-h> <C-w>h

let g:terraform_fmt_on_save=1


" CoC Config
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
