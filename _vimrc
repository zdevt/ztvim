"
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
  Plugin 'Valloric/YouCompleteMe'
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

  "Plugin 'mileszs/ack.vim'
  "Plugin 'vim-airline/vim-airline'
  "Plugin 'powerline/fonts'

  Plugin 'vim-scripts/indentpython.vim'
  Plugin 'godlygeek/tabular'
  Plugin 'plasticboy/vim-markdown'
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'
  Plugin 'honza/vim-snippets'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'vim-scripts/OmniCppComplete'
  Plugin 'Shougo/neocomplete.vim'
  Plugin 'vim-syntastic/syntastic'
  Plugin 'tpope/vim-fugitive'
  Plugin 'scrooloose/nerdtree'

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
  map <F7> :call CompileRun()<CR>

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
  "nmap F :!astyle_sh -cs2CSKNwYMm2pPDHk1n % >/dev/null <CR>
  nmap F :!~/.vim/astyle_sh % <CR>
"}

"UndoTree 
"{
  if isdirectory(expand("~/.vim/bundle/undotree/"))
    nnoremap <Leader>u :UndotreeToggle<CR>
    "If undotree is opened, it is likely one wants to interact with it.
    let g:undotree_SetFocusWhenToggle=1
  endif
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
  set completeopt=longest,menu 
  "离开插入模式后自动关闭预览窗口
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif
  "回车即选中当前项
  inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
  "上下左右键的行为 会显示其他信息
  inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
  inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
  inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
  inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
  "youcompleteme  默认tab  s-tab 和自动补全冲突
  "let g:ycm_key_list_select_completion = ['<Down>']
  "let g:ycm_key_list_previous_completion = ['<Up>']
  "关闭加载.ycm_extra_conf.py提示
  let g:ycm_confirm_extra_conf=0
  "开启 YCM 基于标签引擎
  let g:ycm_collect_identifiers_from_tags_files=1
  "从第2个键入字符就开始罗列匹配项
  let g:ycm_min_num_of_chars_for_completion=2
  "禁止缓存匹配项,每次都重新生成匹配项
  let g:ycm_cache_omnifunc=0
  "语法关键字补全
  let g:ycm_seed_identifiers_with_syntax=1
  "force recomile with syntastic
  "nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
  "open locationlist
  "nnoremap <leader>lo :lopen<CR>
  "close locationlist
  "nnoremap <leader>lc :lclose<CR>
  inoremap <leader><leader> <C-x><C-o>
  "在注释输入中也能补全
  let g:ycm_complete_in_comments = 1
  "在字符串输入中也能补全
  let g:ycm_complete_in_strings = 1
  "注释和字符串中的文字也会被收入补全
  let g:ycm_collect_identifiers_from_comments_and_strings = 0

  nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"}

"TagBar 
"{
  if isdirectory(expand("~/.vim/bundle/tagbar/"))
    nnoremap <silent> <leader>tt :TagbarToggle<CR>
  endif
"}


"ctags cscope
"{
  "Ctrl-] 跳转光标所在定义， Ctrl+t 回到上次跳转前的位置
  "生成ctags cscope文件
  let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
  map <silent> <leader>cts :call GenTags()<CR>
  func! GenTags()
  exec "w"
  exec "!find . -name \"*.h\" -o -name \"*.c\" -o -name \"*.hpp\" -o -name \"*.cpp\" -o -name \"*.cc\" > cscope.files"
  exec "!cscope -Rbq -i cscope.files"
  exec "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
  exec "cs kill -1"
  exec "cs add cscope.out"
  endfunc

  set cscopequickfix=s-,c-,d-,i-,t-,e-
"}


"auto add source code header --start  
"{
  let python_highlight_all=1

  autocmd BufNewFile *.py,*.c,*.cpp,*.h,*.sh exec ":call SetTitle()"

  func SetCommitC()
    call setline(1,          "/*")
    call append(line("."),   " * ====================================================================================")
    call append(line(".")+1, " *")
    call append(line(".")+2, " *       FileName:".expand("%:t"))
    call append(line(".")+3, " *")
    call append(line(".")+4, " *    Description:")
    call append(line(".")+5, " *")
    call append(line(".")+6, " *        Version:  1.0")
    call append(line(".")+7, " *        Created:".strftime("%Y-%m-%d %T"))
    call append(line(".")+8, " *  Last Modified:")
    call append(line(".")+9, " *       Revision:  none")
    call append(line(".")+10," *       Compiler:  gcc")
    call append(line(".")+11," *")
    call append(line(".")+12," *         Author:  zt ()")
    call append(line(".")+13," *   Organization:")
    call append(line(".")+14," *")
    call append(line(".")+15," * =====================================================================================")
    call append(line(".")+16," */")
  endfunc

  func SetTitle()
    if &filetype == 'c' 
      call SetCommitC()
    endif
  endfunc 

"}
"auto add source code header --end  

