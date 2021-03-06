" don't bother with vi compatibility
set nocompatible

" enable syntax highlighting
syntax enable

" configure Vundle
filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" gotags for ctags
au BufWritePost *.go silent! !ctags -R &
nmap <silent><F8> :!ctags -R --fields=+iaS --extra=+q .<CR>
" let g:tagbar_type_go = {
"     \ 'ctagstype' : 'go',
"     \ 'kinds'     : [
"         \ 'p:package',
"         \ 'i:imports:1',
"         \ 'c:constants',
"         \ 'v:variables',
"         \ 't:types',
"         \ 'n:interfaces',
"         \ 'w:fields',
"         \ 'e:embedded',
"         \ 'm:methods',
"         \ 'r:constructor',
"         \ 'f:functions'
"     \ ],
"     \ 'sro' : '.',
"     \ 'kind2scope' : {
"         \ 't' : 'ctype',
"         \ 'n' : 'ntype'
"     \ },
"     \ 'scope2kind' : {
"         \ 'ctype' : 't',
"         \ 'ntype' : 'n'
"     \ },
"     \ 'ctagsbin'  : 'gotags',
"     \ 'ctagsargs' : '-sort -silent'
"     \ }
" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
  source ~/.vimrc.bundles.local
endif

let g:tagbar_type_objc = {
  \ 'ctagstype': 'objc',
  \ 'ctagsargs': [
    \ '-f',
    \ '-',
    \ '--excmd=pattern',
    \ '--extra=',
    \ '--format=2',
    \ '--fields=nksaSmt',
    \ '--options=' . expand('~/github/maximum-awesome/ctags-options-objc'),
    \ '--objc-kinds=-N',
  \ ],
  \ 'sro': ' ',
  \ 'kinds': [
    \ 'c:constant',
    \ 'e:enum',
    \ 't:typedef',
    \ 'i:interface',
    \ 'P:protocol',
    \ 'p:property',
    \ 'I:implementation',
    \ 'M:method',
    \ 'g:pragma',
  \ ],
\ }
" add the ruby tags
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
" air line enable
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" {{{fswitcher
augroup myfiles
    au!
    au BufEnter *.h let b:fswitchdst = 'c,cpp,m,mm'
    "au BufEnter *.m let b:fswitchdst = 'h', let b:fswitchlocs = 'reg:*.h'
    "au BufEnter *.mm let b:fswitchdst = 'h', let b:fswitchlocs = 'reg:*.h'
augroup END
" }}}
noremap <silent> <Left> :bp<CR>
noremap <silent> <Right> :bn<CR>

"set tags
set showfulltag

"set tags+=~/Game/cocos2d-x/tags
"set tags+=~/Game/cocos2d-x/tools/tolua++/tags
set tags+=~/Game/zhaoqin_lua/zhaoqin/src/tags
"ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on
"" Enable folding based on syntax rules
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=0
"" Adjust the highlighting
highlight Folded guibg=grey guifg=blue

"" Map folding to Spacebar
nnoremap <Space> za

" 突出显示当前行等 不喜欢这种定位可注解
set cursorcolumn
set cursorline              " 突出显示当前行
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,eol:¬
"set listchars=tab:>- ",trail:-
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=4                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=4                                            " insert mode tab and backspace use 2 spaces
set tabstop=4                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" keyboard shortcuts
let mapleader = ','
""set error or warning signs
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"whether to show balloons
let g:syntastic_enable_balloons = 1
"}}}

" "change you complete me plugin default mappings"{{{
" ""refer to this blog post:http://0x3f.org/blog/make-youcompleteme-ultisnips-compatible/
" let g:ycm_key_list_select_completion = ['<c-tab>', '<down>']
" let g:ycm_key_list_previous_completion = ['<c-s-tab>', '<up>']
" let g:supertabdefaultcompletiontype = '<c-tab>'
" nnoremap <leader>jd :ycmcompleter gotodefinitionelsedeclaration<cr>
" let g:ycm_confirm_extra_conf = 1
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_auto_trigger = 0
" "let g:ycm_register_as_syntastic_checker=0
" let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
" let g:tern_show_argument_hints='on_hold'
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1
" "}}}

" cocos2dx lua dictionary
set dictionary+=~/github/maximum-awesome/cocoslua.dict
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>l :Align
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>nd :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <leader>c <Plug>Kwbd
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" the lua omni
let g:lua_complete_omni = 1
" the easytags
" disable it default
let g:easytags_on_cursorhold = 0
" }}
" the undo tree
" {{{
nnoremap <F5> :UndotreeToggle<CR>
if has("persistent_undo")
    set undodir=~/.undotree/
    set undofile
endif
" }}}

" the android development settings
" {{{
let g:android_sdk_path = '/Users/liyajie1209/adt-bundle-mac-x86_64/sdk'
let g:ant_path = '/usr/local/bin/ant'
" }}}

"the clang complete configure
" let g:clang_complete_auto = 0
" let g:clang_use_library = 1
" let g:clang_periodic_quickfix = 0
" let g:clang_close_preview = 1
" " for objective-c, this needs to be active, otherwise multi-parameter methods
" " won't be completed correctly
" let g:clang_snippets = 1
" let g:clang_snippets_engine = 'ultisnips'
" " this might change depending on your installation
" let g:clang_user_options='-stdlib=libc++ -std=c++11 -IIncludePath'
" let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

" {{{
"  auto set filetype 
"  These are file extension filetype settings
au! BufRead,BufNewFile *.esp set ft=perl
au! BufRead,BufNewFile *.mm set ft=objc
au! BufRead,BufNewFile *.mlp set ft=xml
" }}}
" in case you forgin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled=0
" let g:gitgutter_map_keys = 0
" let g:gitgutter_highlight_lines = 1

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"ruby file type
autocmd FileType ruby compiler ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

let g:solarized_termcolors=256

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
" extra rails.vim help
autocmd User Rails silent! Rnavcommand decorator      app/decorators            -glob=**/* -suffix=_decorator.rb
autocmd User Rails silent! Rnavcommand observer       app/observers             -glob=**/* -suffix=_observer.rb
autocmd User Rails silent! Rnavcommand feature        features                  -glob=**/* -suffix=.feature
autocmd User Rails silent! Rnavcommand job            app/jobs                  -glob=**/* -suffix=_job.rb
autocmd User Rails silent! Rnavcommand mediator       app/mediators             -glob=**/* -suffix=_mediator.rb
autocmd User Rails silent! Rnavcommand stepdefinition features/step_definitions -glob=**/* -suffix=_steps.rb
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

" Go crazy!
if filereadable(expand("~/.vimrc.local"))
  " In your .vimrc.local, you might like:
  "
  " set autowrite
  " set nocursorline
  " set nowritebackup
  " set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
  "
  " autocmd! bufwritepost .vimrc source ~/.vimrc
  " noremap! jj <ESC>
  source ~/.vimrc.local
endif
