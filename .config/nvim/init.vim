set nocompatible
filetype on
filetype off

let mapleader = ";"
let g:loaded_clipboard_provider = 1
let g:ale_emit_conflict_warnings = 0

"call plug#begin('~/.local/share/nvim/plugged')
call plug#begin('~/.config/nvim')
Plug 'gmarik/Vundle.vim'
" Prettify
Plug 'tomasr/molokai'
" File Management
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" tpope
Plug 'tpope/vim-fugitive'
Plug 'tpope/rails.vim'
" Syntax
Plug 'neomake/neomake'
call plug#end()

autocmd! BufReadPost,BufWritePost * Neomake
