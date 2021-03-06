"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

" Vundle : Extension manager for VIM

" Compatibility to venerable old vi.
    set nocompatible        " required
    set hlsearch
" Turn filetype detection off
    filetype off            " required
""" set the runtime path to include Vundle and initialize
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
    set rtp+=~/.vim/bundle/Vundle.vim

" <---- VUNDLE PLUGIN
call vundle#begin()

" Required let Vundle manage Vundle, require
Plugin 'gmarik/Vundle.vim' "required

""" Please ADD ALL CUSTOM PLUGINS HERE!

" Vim to go!
    Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Find file in vim;
    Plugin 'ctrlpvim/ctrlp.vim'
" Indent line
    Plugin 'nathanaelkane/vim-indent-guides'
" AutoComplete
    " https://vimawesome.com/plugin/youcompleteme#general-usage
    " Plugin 'valloric/youcompleteme'
    Plugin 'Shougo/neocomplcache.vim'
    "Plugin 'altercation/vim-colors-solarized'
    Plugin 'chriskempson/tomorrow-theme'
" VIM AIRLINE FAMILIES ----------
" Lean & mean status/tabline for vim that's light as air.
    Plugin 'bling/vim-airline'
    Plugin 'airblade/vim-gitgutter'
" Git Integration plugin
" want to perform basic git commands without leaving the VIM
    Plugin 'tpope/vim-fugitive' "required
" More syntax highlighting
    Plugin 'scrooloose/syntastic'
" TAGBAR, A CLASS OUTLINE VIEWER FOR VIM
    " Plugin 'majutsushi/tagbar'
    Plugin 'The-NERD-tree'

call vundle#end()
filetype plugin indent on
" VUNDLE PLUGIN --------->


"""Plugin tagbar settings
    "nmap <F8> :TagbarToggle<CR>
"""Pluin neocomplcache setting
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
    " Enable heavy features.
    " Use camel case completion.
    let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    let g:neocomplcache_enable_underbar_completion = 1
    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }
    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
    " Plugin key-mappings.
    inoremap <expr><C-g> neocomplcache#undo_completion()
    inoremap <expr><C-l> neocomplcache#complete_common_string()
    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return neocomplcache#smart_close_popup() . "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    "inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y> neocomplcache#close_popup()
    inoremap <expr><C-e> neocomplcache#cancel_popup()

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_force_omni_patterns')
        let g:neocomplcache_force_omni_patterns = {}
    endif
    let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_force_omni_patterns.c =  '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Enable autocompletion:
	set wildmode=longest,list,full
" turn filetype detection on
    filetype on
" basic stuffs
    set encoding=utf-8
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set textwidth=79
    set expandtab
    set autoindent
" enable syntax higlighting
    syntax enable
    syntax on
" show line numbers
    set number
    "set number relativenumber
" show a visual line under the cursor's current line
    set cursorline
" show the matching part of the pair for [] {} and ()
    set showmatch
" disable beeping
    set noerrorbells
    set visualbell
    set vb t_vb=
" set colorscheme
    set background=dark
    set t_Co=256
    colorscheme Tomorrow-Night-Eighties

"""Highlighting trailing whitespace in red
" have this highlighting not appear whilst you are typing in insert mode
" have this highlighting of whitespace apply when you open new buffers
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
"""Python indentation - PEP8
    au BufNewFile,BufRead *.py
        \ set tabstop=4         "set tabs to have 4 spaces
        \ set softtabstop=4
        \ set shiftwidth=4      "when using the >> or << commands, shift lines by 4spaces
        \ set textwidth=79
        \ set expandtab         "expand tabs into spaces
        \ set autoindent        "indent when moving to the next line while writing code
        \ set fileformat=unix
        \ let python_highlight_all = 1 "enable all python syntax highlighting features
"""For Full stack development
    au BufNewFile,BufRead *.js, *.html, *.css
        \ set tabstop=2
        \ set softtabstop=2
        \ set shiftwidth=2
"""BackSpace and Delete http://vim.wikia.com/wiki/Backspace_and_delete_problems
    func Backspace()
      if col('.') == 1
        if line('.')  != 1
          return  "\<ESC>kA\<Del>"
        else
          return ""
        endif
      else
        return "\<Left>\<Del>"
      endif
    endfunc
    inoremap <BS> <c-r>=Backspace()<CR>
"""Pluings
    let g:airline_powerline_fonts = 1
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
      \ 'file': '\v\.(exe|so|dll)$'
    \ }
"""Plugin Nerd Tree
    map <F2> :NERDTreeToggle<CR>
    let NERDTreeShowHidden=1
"""Shortcut for Copy and Paste
    noremap <C-c> :w !pbcopy<CR><CR>
    "noremap <C-v> :r !pbpaste<CR><CR>
"""Shorcut for split navigation
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
"""Shortcut for tab navigation
    nnoremap tk  :tabnext<CR>
    nnoremap tj  :tabprev<CR>
