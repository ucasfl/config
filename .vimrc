runtime! debian.vim
" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible
" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
" Source a global configuration file if available
if filereadable("/etcimimrc.local")
  source /etcimimrc.local
endif 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set cinoptions={0,1s,t0,n-2,p2s,(03s,=,5s,>1s,=1s,:1s
set nu
if &term=="xterm"
set t_Co=8
set t_Sb=^[[4%dm
set t_Sf=^[[3%dm
endif
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp836,latin1
set pastetoggle=<F7> "粘贴时保持缩进
filetype plugin on

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Yggdroot/LeaderF'
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/echodoc.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'rhysd/vim-clang-format'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Shougo/echodoc.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'zivyangll/git-blame.vim'
call plug#end()

let mapleader=","  "将nerdcommter的默认换行键改为,
set tags=./.tags;,.tags

"nnoremap <C-F> :FlyGrep<CR>
map <leader>S :call CurtineIncSw()<CR>

nmap <unique> <leader>fr <Plug>LeaderfRgPrompt
nmap <unique> <leader>fra <Plug>LeaderfRgCwordLiteralNoBoundary
nmap <unique> <leader>frb <Plug>LeaderfRgCwordLiteralBoundary
nmap <unique> <leader>frc <Plug>LeaderfRgCwordRegexNoBoundary
nmap <unique> <leader>frd <Plug>LeaderfRgCwordRegexBoundary

vmap <unique> <leader>fra <Plug>LeaderfRgVisualLiteralNoBoundary
vmap <unique> <leader>frb <Plug>LeaderfRgVisualLiteralBoundary
vmap <unique> <leader>frc <Plug>LeaderfRgVisualRegexNoBoundary
vmap <unique> <leader>frd <Plug>LeaderfRgVisualRegexBoundary

nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

let g:Lf_ShowDevIcons = 0
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
"noremap <c-f> :LeaderfFunction!<cr>
"noremap <c-b> :LeaderfBuffer<cr>
"noremap <c-m> :Leaderf! bufTag --right --all<cr>
"let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
"
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

" Or, you could use vim's popup window feature.
set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'popup'
" To use a custom highlight for the popup window,
" change Pmenu to your highlight group
highlight link EchoDocPopup Pmenu

let g:NERDCompactSexyComs = 1
"let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '// ','right': ''  }  }
let g:NERDCustomDelimiters = { 'cc': { 'left': '// ','right': ''  }  }
let g:NERDCustomDelimiters = { 'cpp': { 'left': '// ','right': ''  }  }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 0
let g:NERDToggleCheckAllLines = 1
syntax on
filetype plugin indent on
syntax enable
"
" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

"powerline
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
set encoding=utf-8
set laststatus=2
set fillchars+=stl:\ ,stlnc:\

colorscheme molokai
"colorscheme snazzyfied 
let g:rehash256 = 1

inoremap <C-d> <esc>dd
inoremap <C-W> <esc>dw

let g:clang_format#auto_format_on_insert_leave=1
let g:clang_format#auto_format=0
let g:clang_format#detect_style_file=1

inoremap jk <esc>   
nnoremap <C-a> :noh<cr>

set hlsearch

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1

"let g:ale_sign_column_always = 0
"let g:ale_sign_error = '>>'
"let g:ale_sign_warning = '--'
"let g:ale_linters_explicit = 1
"let g:ale_completion_delay = 500
"let g:ale_echo_delay = 20
"let g:ale_lint_delay = 500
"let g:ale_echo_msg_format = '[%linter%] %code: %%s'
"let g:ale_lint_on_text_changed = 'normal'
"let g:ale_lint_on_insert_leave = 1
"
"let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
"let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++17'
"let g:ale_c_cppcheck_options = ''
"let g:ale_cpp_cppcheck_options = ''
"
"let g:ale_completion_enabled = 1

"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
"let g:ale_linters = {
"\   'cpp': ['clang'],
"\   'c': ['clang'],
"\   'cc': ['clang'],
"\   'python': ['pylint'],
"\}

let g:ycm_server_python_interpreter='/home/fenglv/gentoo/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_auto_hover = ''
let g:ycm_clangd_args=['--header-insertion=never']

"let g:clang_use_library = 1
"let g:clang_library_path='/home/fenglv/gentoo/usr/lib/llvm/11/lib64/libclang.so.11'

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 1
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_always_populate_location_list = 1

nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

set completeopt=menu,menuone

noremap <c-z> <NOP>
imap <C-e> <END>
imap <C-a> <HOME>
imap <C-f> <Right>
imap <C-b> <Left>

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],}


" enable debugging
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'

let &rtp .= ',' . expand( '<sfile>:p:h' )
filetype plugin indent on


"nmap <silent> <C-k> <Plug>(ale_previous_wrap)

au BufRead,BufNewFile ./* set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab tags=tags,../tags

nmap <space> :
