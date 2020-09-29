syntax on
colorscheme kalahari

set relativenumber
set hlsearch
set nu rnu
set background=dark
set ruler
set tabstop=4
set autoindent

nmap <F2> :NERDTree<CR>

nmap ; <C-t>
nmap ' <C-]>

nmap ] :tabn<CR>
nmap <Tab> :tabn<CR>
nmap <C-n> :tabnew 

nmap <Tab> <C-w><C-w>
nmap <S-Tab> <C-w>h

nmap <S-k> 5k
nmap <S-j> 5j
nmap <S-h> 5h
nmap <S-l> 5l

nmap c" ciw"<Esc>pa"<Esc>
nmap c' ciw'<Esc>pa'<Esc>

execute pathogen#infect()
call pathogen#helptags()
