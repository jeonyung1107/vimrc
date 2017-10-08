"set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' 
Plugin 'vim-airline/vim-airline' "이쁜 상태창
Plugin 'scrooloose/nerdtree' "파일검색 플러그인
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim' "파일 검색 플러그인
Plugin 'valloric/youcompleteme' "자동완성 플러그인
Plugin 'tomasr/molokai'

call vundle#end()            " required
filetype plugin indent on    " required

set hlsearch " 검색어 하이라이팅
set nu " 줄번호
set autoindent " 자동 들여쓰기
set scrolloff=2
set wildmode=longest,list
set ts=4 "tag select
set sts=4 "st select
set sw=1 " 스크롤바 너비
set autowrite " 다른 파일로 넘어갈 때 자동 저장
set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
set cindent " C언어 자동 들여쓰기
set bs=eol,start,indent
set history=256
set laststatus=2 " 상태바 표시 항상
"set paste " 붙여넣기 계단현상 없애기
set shiftwidth=4 " 자동 들여쓰기 너비 설정
set showmatch " 일치하는 괄호 하이라이팅
set smartcase " 검색시 대소문자 구별
set smarttab
set smartindent
set softtabstop=4
set tabstop=4
set ruler " 현재 커서 위치 표시
set incsearch
"esc누르면 하이라이트 제거
nnoremap <esc> :noh<return><esc>
" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif
" 파일 인코딩을 한국어로
set fileencodings=utf8,euc-kr
" 구문 강조 사용
if has("syntax")
 syntax on
endif
"색상
color molokai
let g:molokai_original = 1


