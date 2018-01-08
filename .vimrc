set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' 
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline' "이쁜 상태창
Plugin 'scrooloose/nerdtree' "파일검색 플러그인
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim' "파일 검색 플러그인
Plugin 'valloric/youcompleteme' "자동완성 플러그인
Plugin 'tomasr/molokai'

call vundle#end()            " required
filetype plugin indent on    " required

let g:airline#extensions#tabline#enabled = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nu " 줄번호
set ruler " 현재 커서 위치 표시
set showmatch " 일치하는 괄호 하이라이팅
set laststatus=2 " 상태바 표시 항상

set scrolloff=2
set sw=1 " 스크롤바 너비
set wildmode=list:longest,full
set bs=eol,start,indent

set autowrite " 다른 파일로 넘어갈 때 자동 저장
set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴

set history=512
set paste " 붙여넣기 계단현상 없애기

"검색
set smartcase " 검색시 대소문자 구별
set incsearch
set hlsearch " 검색어 하이라이팅

"들여쓰기
set cindent " C언어 자동 들여쓰기
set shiftwidth=4 " 자동 들여쓰기 너비 설정
set smarttab
set smartindent
set ts=4 
set sts=4 
set autoindent " 자동 들여쓰기

" 구문 강조 사용
if has("syntax")
 syntax on
endif

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" 파일 인코딩을 한국어로
set fileencodings=utf8,euc-kr

"색상
color molokai
let g:molokai_original = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"key mapping

let mapleader=","
nnoremap <leader>h :noh<return><esc>

inoremap jk <esc>

"마우스 사용
map <F7> <ESC>:set mouse=a<CR>
map <F8> <ESC>:set mouse-=a<CR>

"클립보드 복사
noremap <leader>v "+p
noremap <leader>c "+y

"vimrc 
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"CPP 빌드관련

"컴파일 뒤 실행, 실행파일은 후에 삭제
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' --std=c++14 && ./'.shellescape('%:r').' && rm '.shellescape('%:r')<CR>
"컴파일 뒤 input을 매개변수로 실행
autocmd filetype cpp nnoremap <F3> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' --std=c++14 && cat input.txt <bar> ./'.shellescape('%:r').' && rm '.shellescape('%:r')<CR>
"컴파일
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' --std=c++14'<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

function! NERDTreeCustomIgnoreFilter(path)
    return a:path.isExecutable
endfunction

autocmd VimEnter * call StartUp()
map <C-n> :NERDTreeToggle<CR>

set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
