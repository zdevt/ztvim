" vim config
"{
  set nocompatible
  filetype off

  let mapleader="," 

  set autochdir
  set autoread
  set autowriteall

  set ruler
  set fileencodings=utf8,gb2312,big5,euc-cn
  set formatoptions=rotcql
  "set ic	"ignore case
  set ignorecase smartcase
  "set incsearch
  set cc=100
  set wildmenu
  set showcmd

  set mouse=a
  set mousehide

  "colo evening
  colo desert
  "set background=light
  set nu
  set foldmethod=indent
  set foldlevel=99
"}

"code format
"{
  set smarttab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
  "set cindent
  set autoindent
  set backspace=indent,eol,start
  set cino=j1
  syntax on
"}

"vbundle
"{
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  "<leader>u
  Plugin 'mbbill/undotree'
  "<c-p>
  Plugin 'kien/ctrlp.vim'
  "complete code
  Plugin 'Valloric/YouCompleteMe'
  "<leader>y
  Plugin 'rdnetto/YCM-Generator'
  "<leader><leader>w
  Plugin 'easymotion/vim-easymotion'
  "L H
  Plugin 'fholgado/minibufexpl.vim'
  "<leader>tt
  Plugin 'majutsushi/tagbar'
  "exp:cs[{; ds"; ysW(
  Plugin 'tpope/vim-surround'
  "<leader>c<space>
  Plugin 'scrooloose/nerdcommenter'
  "<leader>e
  Plugin 'scrooloose/nerdtree'
  "TimeStamp Last Modified
  Plugin 'TimeStamp.vim'
  "StatusBar
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  "<leader>a=
  Plugin 'godlygeek/tabular'
  "check c code
  Plugin 'vim-syntastic/syntastic'
  "Plugin 'vim-scripts/DoxygenToolkit.vim'
  Plugin 'octol/vim-cpp-enhanced-highlight'
  Plugin 'xolox/vim-misc'
  Plugin 'xolox/vim-lua-ftplugin'

  "Plugin 'terryma/vim-multiple-cursors'
  "Plugin 'mileszs/ack.vim'
  "Plugin 'python.vim'
  "Plugin 'powerline/fonts'
  "Plugin 'powerline/powerline'

  Plugin 'vim-scripts/indentpython.vim'
  Plugin 'plasticboy/vim-markdown'
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'
  Plugin 'honza/vim-snippets'

  Plugin 'vim-scripts/OmniCppComplete'
  Plugin 'Shougo/neocomplete.vim'
  Plugin 'tpope/vim-fugitive'

  call vundle#end()
  filetype plugin indent on
"}

"minibuffer
"{
  let g:miniBufExplMapWindowNavVim = 1   
  let g:miniBufExplMapWindowNavArrows = 1  
  let g:miniBufExplMapCTabSwitchBufs = 1 
  let g:miniBufExplModSelTarget = 1  
  let g:miniBufExplMoreThanOne=0  
  "bn下一个文件，bp前一个文件
  nmap L :bn<CR>
  nmap H :bp<CR>
"}

"run
"{
  "make
  nmap M :make<CR>
  nnoremap <leader>r :call CompileRun()<CR>

  func! CompileRun()
    exec "w"
    if &filetype == 'c'
      exec "!time g++ % -g -o %< -std=c++11 -ldl -lrt -lpthread"
    elseif &filetype == 'cpp'
      exec "!time g++ % -g -o %< -std=c++11 -ldl -lrt -lpthread"
    elseif &filetype == 'python'
      exec "!time python3 %"
    endif
  endfunc
"}

"format code
"{
  nmap F :!~/.vim/astyle_sh % <CR>
"}

"UndoTree 
"{
  nnoremap <Leader>u :UndotreeToggle<CR>
  let g:undotree_SetFocusWhenToggle=1
"}

"git
"{
  "git config --global merge.tool vimdiff
  "git config --global mergetool.prompt false
"}


"ctrlp
"{
  let g:ctrlp_map='<c-p>'
  let g:ctrlp_cmd='CtrlP'
  let g:ctrlp_working_path_mode='ra'
  let g:ctrlp_show_hidden=1
  let g:ctrlp_custom_ignore={
    \'dir':  '\.git$\|\.hg$\|\.svn$',
    \'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$'}
"}

"YouCompleteMe
"{
  let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
  let g:ycm_auto_trigger=1
  let g:ycm_confirm_extra_conf=0
  let g:ycm_collect_identifiers_from_tags_files=1
  let g:ycm_collect_identifiers_from_comments_and_strings=0 
  let g:ycm_cache_omnifunc=0
  let g:ycm_complete_in_comments=1
  let g:ycm_complete_in_strings=1
  let g:ycm_min_num_of_chars_for_completion=2
  let g:ycm_seed_identifiers_with_syntax=1
  "let g:ycm_show_diagnostics_ui = 0

  set completeopt=longest,menu 

  autocmd InsertLeave * if pumvisible() == 0|pclose|endif

  inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
  inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
  inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
  inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
  inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
  
  nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
  nnoremap <leader>jf :YcmCompleter GoToInclude<CR>
"}

"TagBar 
"{
  nnoremap <silent> <leader>tt :TagbarToggle<CR>
"}


"ctags cscope
"{
  "Ctrl-] 跳转光标所在定义， Ctrl+t 回到上次跳转前的位置
  let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
  map <silent> <leader>ct :call GenTags()<CR>
  func! GenTags()
    exec "w"
    exec "!find . -name \"*.h\" -o -name \"*.c\" -o -name \"*.hpp\" -o -name \"*.cpp\" -o -name \"*.cc\" > cscope.files"
    exec "!cscope -Rbq -i cscope.files"
    exec "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    exec "cs kill -1"
    exec "cs add cscope.out"
  endfunc

  "查找本c符号，跳过注释
  "nmap cfs :cs find s <C-R>=expand("<cword>")<CR><CR>
  "查找本定义
  "nmap cfg :cs find g <C-R>=expand("<cword>")<CR><CR>
  "查找本函数调用的函数
  "nmap cfd :cs find d <C-R>=expand("<cword>")<CR><CR>
  "查找调用本函数的函数
  "nmap cfc :cs find c <C-R>=expand("<cword>")<CR><CR>
  "查找本字符串
  "nmap cft :cs find t <C-R>=expand("<cword>")<CR><CR>
  "查找本egrep模式
  "nmap cfe :cs find e <C-R>=expand("<cword>")<CR><CR>
  "查找本文件
  "nmap cff :cs find f <C-R>=expand("<cfile>")<CR><CR>  
  "查找包含本文件的文件
  "nmap cfi :cs find i <C-R>=expand("<cword>")<CR><CR>  
  "

  set cscopequickfix=s-,c-,d-,i-,t-,e-
"}

" NerdTree 
"{
  noremap<leader>e :NERDTreeFind<CR>
  let NERDTreeShowBookmarks=1
  let NERDTreeIgnore=['\.py[cd]$','\~$','\.swp$','^\.git$','^\.hg$','^\.svn$','\.bzr$']
  let NERDTreeChDirMode=0
  let NERDTreeQuitOnOpen=1
  let NERDTreeMouseMode=2
  let NERDTreeShowHidden=1
  let NERDTreeKeepTreeInNewTab=1
"}

" TimeStamp.vim
"{
  let timestamp_regexp = '\v\C%(<Last %([cC]hanged?|[Mm]odified):\s+)@<=.*$'
  set modelines=20
  let g:timestamp_rep = ' %Y-%m-%d %T'
"}

" powerline
"{
  "set guifont=PowerlineSymbols\ for\ Powerline 
  "set nocompatible
  "set t_Co=256
  "let g:Powerline_symbols='fancy'
"}

" vim-airline
"{
  "let g:airline_powerline_fonts=1
  let g:airline_theme='simple'
"}

" tabular
"{
  nmap <leader>a= :Tabularize /=<CR>
  vmap <leader>a= :Tabularize /=<CR>
  "nmap <leader>a: :Tabularize /:\zs<CR>
  "vmap <leader>a: :Tabularize /:\zs<CR>
"}

" syntastic
"{
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_cpp_compiler='clang++'
  let g:syntastic_cpp_compiler_options=' -std=c++11 -stdlib=libc++'

  let g:syntastic_error_symbol='X'
  let g:syntastic_warning_symbol='!'

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
"}

" vim-lua-ftplugin'
"{
  let g:lua_compiler_name = '/usr/local/bin/luac' 
"}

"DoxygenToolkit
"{
  
"}

" YCM-Generator
"{
  nnoremap <Leader>y :YcmGenerateConfig<CR>
"}

"auto add source code header --start  
"{
  let python_highlight_all=1

  autocmd BufNewFile *.py,*.c,*.cpp,*.h,*.sh,*.lua exec ":call SetTitle()"

  func SetFileHeader()
    call append(line("$"),"/*")
    call append(line("$")," * =========================================================================")
    call append(line("$")," *")
    call append(line("$")," *       FileName:  ".expand("%:t"))
    call append(line("$")," *")
    call append(line("$")," *    Description:")
    call append(line("$")," *")
    call append(line("$")," *        Version:  1.0")
    call append(line("$")," *        Created:  ".strftime("%Y-%m-%d %T"))
    call append(line("$")," *  Last Modified:  TIMESTAMP")
    call append(line("$")," *       Revision:  none")
    call append(line("$")," *       Compiler:  gcc")
    call append(line("$")," *")
    call append(line("$")," *         Author:  zt ()")
    call append(line("$")," *   Organization:")
    call append(line("$")," *")
    call append(line("$")," * =========================================================================")
    call append(line("$")," */")
    call append(line("$"),"")
  endfunc

  func SetCommitSh()
    call append(line("$"),"#       FileName:  ".expand("%:t"))
    call append(line("$"),"#")
    call append(line("$"),"#    Description:")
    call append(line("$"),"#")
    call append(line("$"),"#        Version:  1.0")
    call append(line("$"),"#        Created:  ".strftime("%Y-%m-%d %T"))
    call append(line("$"),"#  Last Modified:  TIMESTAMP")
    call append(line("$"),"#       Revision:  none")
    call append(line("$"),"#       Compiler:  gcc")
    call append(line("$"),"#")
    call append(line("$"),"#         Author:  zt ()")
    call append(line("$"),"#   Organization:")
    call append(line("$"),"")
  endfunc

  func SetCMain()
    call append(line("$"),"")
    call append(line("$"),"")
    call append(line("$"),"int main(int argc, char* argv[])")
    call append(line("$"),"{")
    call append(line("$"),"  (void)argc;")
    call append(line("$"),"  (void)argv;")
    call append(line("$"),"")
    call append(line("$"),"")
    call append(line("$"),"  return 0;")
    call append(line("$"),"}")
    call append(line("$"),"")
  endfunc

  func SetInclude()
    call append(line("$"),"#include <stdio.h>")
    call append(line("$"),"#include <stdlib.h>")
    call append(line("$"),"#include <stdint.h>")
    call append(line("$"),"#include <stddef.h>")
    call append(line("$"),"#include <errno.h>")
    call append(line("$"),"#include <unistd.h>")
  endfunc

  func SetCppInclude()
    call append(line("$"),"")
    call append(line("$"),"#include <iostream>")
    call append(line("$"),"#include <memory>")
    call append(line("$"),"#include <algorithm>")
    call append(line("$"),"#include <vector>")
    call append(line("$"),"#include <map>")
    call append(line("$"),"#include <string>")
  endfunc

  func SetIncludeFileBody()
    call append(line("$"),"")
    call append(line("$"),"#ifndef ".toupper(expand("%:t:r"))."_INC" )
    call append(line("$"),"#define ".toupper(expand("%:t:r"))."_INC" )
    call append(line("$"),"")
    call append(line("$"),"")
    call append(line("$"),"class ".expand("%:t:r"))
    call append(line("$"),"{")
    call append(line("$"),"public:")
    call append(line("$"),"  ".expand("%:t:r")."();")
    call append(line("$"),"  virtual ~".expand("%:t:r")."();")
    call append(line("$"),"")
    call append(line("$"),"private:")
    call append(line("$"),"")
    call append(line("$"),"};")
    call append(line("$"),"")
    call append(line("$"),"#endif /*  ".toupper(expand("%:t:r"))."_INC  */" )
    call append(line("$"),"")
  endfunc

  func SetCommitLua()
    call append(line("$"),"--       FileName:  ".expand("%:t"))
    call append(line("$"),"--")
    call append(line("$"),"--    Description:")
    call append(line("$"),"--")
    call append(line("$"),"--        Version:  1.0")
    call append(line("$"),"--        Created:  ".strftime("%Y-%m-%d %T"))
    call append(line("$"),"--  Last Modified:  TIMESTAMP")
    call append(line("$"),"--       Revision:  none")
    call append(line("$"),"--       Compiler:  gcc")
    call append(line("$"),"--")
    call append(line("$"),"--         Author:  zt ()")
    call append(line("$"),"--   Organization:")
    call append(line("$"),"")
  endfunc

  func SetTitle()
    if expand("%:e") == 'c' 
      call SetFileHeader()
      call SetInclude()
      call SetCMain()
    elseif expand("%:e") == 'sh'
      call setline(1,"#!/bin/sh")
      call SetCommitSh()
    elseif expand("%:e") == 'py'
      call setline(1,"#!/usr/bin/env python")
      call append(line("$"),"#-*- coding:utf-8 -*-")
      call SetCommitSh()
    elseif expand("%:e") == 'cpp'
      call SetFileHeader()
      call SetInclude()
      call SetCppInclude()
      call SetCMain()
    elseif expand("%:e") == 'h'
      call SetFileHeader()
      call SetIncludeFileBody()
    elseif expand("%:e") == 'lua'
      call setline(1,"#!/usr/local/bin/lua")
      call SetCommitLua()
    endif
  endfunc 

"}
"auto add source code header --end  

