:source ~/.config/nvim/plugins.vim

if has('vim_starting')
    set nocompatible               " Be iMproved
endif


"-------------visual-------------"

syntax enable
set encoding=utf8
colorscheme atom-dark-256        " Set the colorscheme
" colorscheme github                 " Set the colorscheme
set cursorline                     " Highlight the cursor line

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " makes the cursor a pipe in insert-mode, and a block in normal-mode
"
" enable 24 bit color support if supported
if (has("termguicolors"))
    set termguicolors
endif

" make comments and HTML attributes italic
highlight Comment cterm=italic gui=italic
highlight htmlArg cterm=italic gui=italic
" Quick Note : for italic comments to work on Neovim, I need to update my terminfo
" adding the following line:
"     sitm=\E[3m, ritm=\E[23m,
" Resource : https://github.com/neovim/neovim/issues/3461#issuecomment-268876998

set number                  " show line numbers
" set relativenumber        " show relative line numbers


set wrap                    " turn on line wrapping
set wrapmargin=4            " wrap lines when coming within n characters from side
set linebreak               " set soft wrapping
set showbreak=…             " show ellipsis at breaking
set noerrorbells            " No beeps.
set nojoinspaces            " Prevents inserting two spaces after punctuation on a join (J)

set laststatus=2            " Set statusline to appear all the time (default to appear only when split windows)


" Highlight cursorline unless, but not in insert mode
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

"
" Customize colors for better visual with airline themes
"
" theme: gasparin (change the iTerm Profile to Dark Gasparin Theme )
" customize the vertical split line
hi vertsplit ctermfg=234 ctermbg=127 guibg=#A55989 guifg=bg
" customize the Visual and Search mode highlights colors (better with dark theme)
hi Visual ctermfg=231 ctermbg=97 guifg=fg guibg=#605A79
hi Search ctermfg=231 ctermbg=97 guifg=fg guibg=#605A79
" disable foreground for Cursorline
hi Cursorline ctermfg=none guifg=none
"
"
"
" theme: papercolor (change the iTerm Profile to Light Gasparin Theme )
" customize the vertical split line
" hi vertsplit ctermbg=183 ctermfg=234 guibg=#dbbdd0 guifg=bg
" disable foreground for Cursorline
" hi Cursorline ctermbg=252 guibg=#d9d9d9
" hi Cursor guifg=black guibg=black

"-------------Coding-------------"

set backspace=indent,eol,start    " makes backspace behave like every other editor
set autoindent                    " automatically set indent of new line
set smartindent                   " apply indent according to some smart rules, like inside functions
set smarttab                      " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=8                     " the visible width of tabs
set softtabstop=4                 " tabs width on on insert mode (tab or backspace)
set shiftwidth=4                  " number of spaces to use for indent and unindent on normal mode ( <shift>< or > )
set expandtab                     " insert spaces rather then tabs <Tab>

" auto completions
set completeopt+=longest          " append the longest option to the completeopt.
set completeopt-=preview          " remove the preview option to the completeopt. (Do not show preview information)
set pumheight=0                   " maximum number of items to show in the popup menu for completion. 0 to max size

" code folding settings
set foldmethod=syntax       " fold based on syntax language file
set foldnestmax=10          " deepest fold is 10 levels
set nofoldenable          " don't fold by default
set foldlevel=1             " close folders with level 2 or greater by default

set cpoptions+=y                  " Add yank command can be redone with "."

"-------------Navigating------------
set nostartofline                 " Do not jump to first character with page commands.

"----------------Buffer--------------
set hidden              " Make a buffer hidden when abandoned


"--------------Splitting--------------
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.


"-------------Searching--------------"
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers

" ignored when expanding wildcards, completing file or
" directory names, and influences the result of expand(), glob() and
" globpath()
set wildignore+=.git/*,.DS_Store,.hg,.svn,.ctagsignore,.ignore,tags,.neovimsession.vim,.php_cs.cache

"------------Netrw-----------------------"
let g:netrw_hide = 1                  " Hide files from g:netrw_list_hide by default

"------------Mapping---------------------"

" set a map leader for more key combos
let mapleader = ','

" Quick write NeoVim session for the project to be restored later
nnoremap <F2> :mksession! .neovimsession.vim <cr>
" Restore NeoVim session for the project
nnoremap <F3> :source .neovimsession.vim <cr>

" shortcut for esc in insert mode
inoremap jj <esc>

" Improved match list command
noremap [I [I:let nr = input("Type the number and \<Enter\>: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Break line in insert mode
nnoremap <CR> i<cr><esc>
" " Restore <CR> mapping in quickfix and location windows
augroup cr_mapping
  autocmd BufReadPost quickfix,location nnoremap <buffer> <CR> <CR>
augroup END

" shortcut to save
nnoremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>
"
" shortcut to delete buffer
nnoremap <leader>d :bd<cr>

" switch between current and last buffer
nnoremap <leader>. <c-^>


" Quickly go forward or backward to buffer
nnoremap [b  :bprevious<cr>
nnoremap ]b  :bnext<cr>
nnoremap [B  :bfirst<cr>
nnoremap ]B  :blast<cr>

" Quickly go forward or backward to tabs
nnoremap [t  :tabprevious<cr>
nnoremap ]t  :tabnext<cr>
nnoremap [T  :tabfirst<cr>
nnoremap ]T  :tablast<cr>

" Quickly add empty lines
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" Quickly change windows size
nnoremap <left>   <c-w><
nnoremap <right>  <c-w>>
nnoremap <up>     <c-w>+
nnoremap <down>   <c-w>-

" Quick access to neovim config file
nnoremap <leader>ev :e! $MYVIMRC <cr>

" Removes simple highlight
nnoremap <Leader><space> :nohlsearch<cr>

" Don't lose selection when shifting sidewards
xnoremap <  <gv
xnoremap >  >gv

" shortcut for copy/paste to system clipboard
nnoremap <M-y> "*y
nnoremap <M-Y> "*Y
nnoremap <M-p> "*p
nnoremap <M-P> "*P
xnoremap <M-y> "*y
xnoremap <M-Y> "*Y
xnoremap <M-p> "*p
xnoremap <M-P> "*P


"/
"/ Command line mapping
"/
" Remap input history to the smart arrow keys
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>


"/
"/ Terminal
"/
" remap esc in terminal mode
tnoremap <Esc> <C-\><C-n>


" remap to undo paste command into insert mode. In fact, it undo the changes since last <C-R> command.
" See i_CTRL-G_u
inoremap <C-R> <C-G>u<C-R>

"Sort PHP use statements
vmap <Leader>sl ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>


"/
"/ Laravel Specific
"/
" Open specific laravel directories
nnoremap <Leader><Leader>lrw :e routes/web.php<cr>
nnoremap <Leader><Leader>lra :e routes/api.php<cr>
nnoremap <Leader><Leader>lc :Files app/Http/Controllers<cr>
nnoremap <Leader><Leader>lp :Files app/Policies<cr>
nnoremap <Leader><Leader>lt :Files tests/<cr>
nnoremap <Leader><Leader>l, :Files config<cr>
nnoremap <Leader><Leader>ldm :Files database/migrations<cr>
nnoremap <Leader><Leader>lds :Files database/seeds<cr>
nnoremap <Leader><Leader>ldf :Files database/factories<cr>
" Salao VIP
nnoremap <Leader><Leader>lss :e app/Http/Services<cr>
" laravel artisan
nnoremap <Leader><Leader>lmm :!php artisan make:model<space>
nnoremap <Leader><Leader>lmc :!php artisan make:controller<space>
nnoremap <Leader><Leader>lmp :!php artisan make:policy<space>
nnoremap <Leader><Leader>lmr :!php artisan make:request<space>
nnoremap <Leader><Leader>lmt :!php artisan make:test<space>
nnoremap <Leader><Leader>lt :terminal php artisan tinker<cr>
"/
"/ Custom macros
"/
" let @<index>=""

"-------------Commands--------------------"

" command to refresh ctags file
function! CtagsRefresh()
    execute "!rm tags"
    execute "!ctags-update.sh"
endfunction

command! CtagsRefresh call CtagsRefresh()

" command to clear registers
function! RegistersClear()
    let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="*+'
    let i=0
    while (i<strlen(regs))
        exec 'let @'.regs[i].'=""'
        let i=i+1
    endwhile
endfunction

command! RegistersClear call RegistersClear()


"-------------Plugins--------------------"

"/
"/ Vim Cheat40
"/
let g:cheat40_use_default = 0     " disable default cheat40. Uses the cheat at ~/.config/nvim/

"/
"/ NerdTree
"/
" Toogle NerdTree
nnoremap <silent> <C-n> :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nnoremap <silent> <M-n> :NERDTreeFind<cr>

" Customize Arrow fonts
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'
" Open Netrw instead NERDTree when use :e <dir> command
let NERDTreeHijackNetrw = 0

"/
"/ Tagbar
"/
" Open the Tagbar window, jump to it and close it on tag selection
nnoremap <C-\> :TagbarOpenAutoClose<CR>


"/
"/ GitGutter
"/
let g:gitgutter_map_keys = 0  " Set up Gitgutter to not map any key


"/
"/ Airlines
"/

let g:airline#extensions#tabline#enabled = 1                " Enable tabline
let g:airline#extensions#tabline#fnamemod = ':'            " Show just the filename
let g:airline#extensions#tabline#tab_nr_type = 1            " configure how numbers are displayed in tab mode. > tab number
let g:airline#extensions#tabline#show_buffers = 0           " disable displaying buffers when there is one tab
let g:airline#extensions#tabline#show_tabs = 0              " disable displaying tabs
let g:airline#extensions#tabline#tab_min_count = 30         " configure the minimum number of tabs needed to show the tabline.
let g:airline#extensions#tabline#show_tab_type = 0          " disable displaying tab type
let airline#extensions#tabline#show_splits = 0              " Disable shoing open splits per tab
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0         " Show the buffer number
let g:airline#extensions#tabline#show_tab_nr = 0            " Show tab number
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline_powerline_fonts= 1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme='gasparin'  " dark theme
" let g:airline_theme='papercolor'  " light theme


"/
"/ Fzf (Fuzzy File Finder)
"/
" Add preview content of the file
set rtp+=/usr/local/opt/fzf                       " set fzf file to runtimepath
let g:fzf_files_options =
            \ '--preview "(highlight -s denim -O xterm256 {} || cat {}) 2> /dev/null | head -'.2*&lines.'"' .
            \ ' --bind alt-j:preview-down,alt-k:preview-up,alt-f:preview-page-down,alt-b:preview-page-up'

let g:fzf_history_dir = '~/.local/share/fzf-history'   " Enable per command history > <C-n> <C-p>

let g:fzf_tags_command = 'ctags-update'                " [Tags] Command to generate tags file
" let g:fzf_layout = { 'down': '~40%' }                " Fzf layout
let g:fzf_layout = { 'window': '-tabnew' }             " Full screen Fzf layout

" Customize the fzf colors to match the color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['bg', 'VertSplit'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'],
  \ 'border':  ['bg', 'VertSplit']}

" Customize Ag to run the Raw Ag
command! -bang -nargs=+ -complete=dir Ag call fzf#vim#ag_raw(<q-args>,
\ fzf#vim#with_preview('right:50%:hidden', '?'),
\ <bang>0)

" Customize Buffer command to show preview windows
command! -bar -bang -nargs=? -complete=buffer Buffers
  \ call fzf#vim#buffers(<q-args>, {'options':
  \ ' --preview "(highlight -s denim -O xterm256 {2..} || cat {2..}) 2> /dev/null | head -'.2*&lines.'"' .
  \ ' --bind alt-j:preview-down,alt-k:preview-up,alt-f:preview-page-down,alt-b:preview-page-up'},
  \ <bang>0)

" Customize History command to show preview windows
command! -bang -nargs=* History call fzf#vim#history(extend({},
  \ fzf#vim#with_preview('right:50%')),
  \ <bang>0)

" Open list of project files - By default, ignores dotfiles
nnoremap <C-p> :Files<CR>
" Open list of git project files  ( uses git ls-files )
nnoremap <leader>g :GFiles<CR>
" Open list of opened buffers
nnoremap <leader>l :Buffers<CR>
" Open history opened files
nnoremap <leader>h :History<CR>
" Open list fo file into contents of files of the project using Ag
nnoremap <leader>f :Ag<space>
" Open list fo file into contents of files of the project using Ag ignoring VCS dotfiles
nnoremap <leader>F :Ag<space>-U<space>
" Find in current buffer
nnoremap <leader>% :BLines<space>

"/
"/ Fzf File MRU
"/
" Add saved files to the MRU list
let g:fzf_filemru_bufwrite = 1
" disable mru color to MRU Fzf files (it is not working)
let g:fzf_filemru_colors =  {}
" Add preview file to fzf MRU result

function! s:files_mru_preview()
    let fzf_filemru_options =
            \ ' --tiebreak=index' .
            \ ' --preview "(highlight -s denim -O xterm256 {2..} || cat {2..}) 2> /dev/null | head -'.2*&lines.'"' .
            \ ' --bind alt-j:preview-down,alt-k:preview-up,alt-f:preview-page-down,alt-b:preview-page-up'
    execute ':FilesMru '. fzf_filemru_options
endfunction

command! -nargs=* FilesMruPreview call s:files_mru_preview()

" Open most recently used files
nnoremap <leader>m :FilesMruPreview<CR>


"/
"/ vim-easy-align
"/
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"/
"/ IndentLine
"/
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_color_gui = '#383838' " for dark theme
let g:indentLine_color_term = 237      " for dark theme
" let g:indentLine_color_gui = '#e5e5e5' " for light theme
" let g:indentLine_color_term = 7      " for light theme
let g:indentLine_char = '┆'
let g:indentLine_faster = 1


"/
"/ Vim Better Whitespace
"/
" Configure the background color for trailing whitespaces
highlight ExtraWhitespace ctermbg=236 guibg=#282E33
" removes trailing whitespaces when saving buffer
augroup clear_trailing_whitespace
    autocmd!
    autocmd BufEnter * EnableStripWhitespaceOnSave
augroup END

"/
"/ Vim Qf ( Searching / Search and Replate )
"
let g:qf_mapping_ack_style = 1           " Enable Ack.vim-inspired mappings in location/quickfix windows:
" Toggle the quickfix window.
nmap <leader>wq <Plug>QfCtoggle
" Toggle the current window's location window
nmap <leader>wl <Plug>QfLtoggle

" Quickly go forward and backward quickfix list and wrap around
nmap [q <Plug>(qf_qf_previous)
nmap ]q  <Plug>(qf_qf_next)

" Quickly go forward and backward location list and wrap around
nmap [l <Plug>(qf_loc_previous)
nmap ]l  <Plug>(qf_loc_next)

"/
"/ Vim Bbye (Buffer Bye)
"
:nnoremap <Leader>c :Bdelete<CR>

"/
"/ Deoplete (autocomplete)
"/
let g:deoplete#enable_at_startup = 1                " Enable it at startup
let g:deoplete#enable_smart_case = 0                 " Use smartcase
" run phpcd as deoplete source
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
" let g:deoplete#omni#input_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:deoplete#omni#input_patterns.php = '->\|::'
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni'] " disable omni source for php
let g:deoplete#tag#cache_limit_size = 600000
call deoplete#custom#set('phpcd', 'mark', '') " if you want to hide `[php]` in the popupmenu, set mark as empty.

" runs phpcd as omnifunc
" let g:deoplete#omni_patterns = {}
" let g:deoplete#omni_patterns.php = '->\|::'         " Configure deoplete to call omnifunc for php when I type -> or :: (disable deoplete features when this happen)
                                                     " lvht/phpcd omnifunc is used in these cases
let g:deoplete#disable_auto_complete = 0             " Makes auto complete start automatically


"/
"/ Vim Move
"/
let g:move_key_modifier = 'M'  " Change de move key to Meta

" Trigger Deoplete with <TAB>
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}


"/
"/ UltiSnips
"/
let g:UltiSnipsExpandTrigger="<c-space>"         " Add key to trigger UltiSnips snippets. Can not use <tab> to not conflict with shortcut for deoplete
let g:UltiSnipsJumpForwardTrigger="<c-space>"    " Map forward jump trigger for ultisnips jumps


"/
"/ pdv PHP Documenter VIM
"/
let g:pdv_template_dir = $HOME ."/.config/nvim/plugins/pdv/templates_snip"    " The path to the pdv templates
" Shortcut to add php docblocks
augroup php_docblocks
    autocmd!
    autocmd FileType php nnoremap <buffer> <leader><leader>d :call pdv#DocumentWithSnip()<CR>
augroup END

"/
"/ Vim PHP Namespace
"/
let g:php_namespace_sort_after_insert = 0               " Sort dependencies every time one is inserted
"
" Insert use statement at the top of the file
"     new Response<-- cursor here or on the name; hit <leader>u now to insert the use statement
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
" Expand the fully qualified classe name
"     new Response<-- cursor here or on the name; hit <leader>ec now to insert the use statement
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction

" Created shortcuts for php namespace only on php files
augroup php_namespace
    autocmd!
    autocmd FileType php inoremap <buffer> <Leader>uu <Esc>:call IPhpInsertUse()<CR>
    autocmd FileType php noremap <buffer> <Leader>uu :call PhpInsertUse()<CR>
    autocmd FileType php inoremap <buffer> <Leader>ec <Esc>:call IPhpExpandClass()<CR>
    autocmd FileType php noremap <buffer> <Leader>ec :call PhpExpandClass()<CR>
    " Sort php use statements
    autocmd FileType php inoremap <buffer> <Leader>su <Esc>:call PhpSortUse()<CR>
    autocmd FileType php noremap <buffer> <Leader>su :call PhpSortUse()<CR>
augroup END


"/
"/ Vim PHP CS Fixer
"/
let g:php_cs_fixer_rules = "@PSR2"        " set PSR2 rules to be used on cs fixer
let g:php_cs_fixer_default_mapping = 0    " Disable the default mapping (<leader>pcd)
" Shortcuts to apply php-cs-fixer, and after update lint with Neomake
augroup php_mappings
    autocmd!
    autocmd FileType php nnoremap <buffer> <silent> <F8> :call PhpCsFixerFixDirectory()<CR> :Neomake<CR>
    autocmd FileType php nnoremap <buffer> <silent> <F9> :call PhpCsFixerFixFile()<CR> :Neomake<CR>
augroup END

"/
"/ Vim PHP Manual
"/
let g:php_manual_online_search_shortcut = '<leader><leader>m'

"/
"/ Neomake (assyn lint framework)
"/
" let g:neomake_open_list = 2       " open the location windows with the lin errors without move the cursor
let g:neomake_php_phpmd_maker = {
    \ 'args': ['%:p', 'text', 'phpmd-ruleset.xml'],
    \ 'errorformat': '%E%f:%l%\s%m'
    \ }
"
" Run Neomake on the current file on every write:
augroup neomake_lints
    autocmd!
    autocmd BufWritePost * Neomake
augroup END

" Note : For PHP, Neomake, by default, will run php -l, phpcs and phpmd, if available.
let g:neomake_php_phpcs_args_standard="phpcs_ruleset.xml"    " set a custom ruleset to be used by phpcs when neomake runs.

" ignore phpcs lint for test classes (cause some patterns, like test function name does not follow the PS2 standard)
let g:neomake_php_phpcs_maker = {
    \ 'args': ['--standard='. expand(g:neomake_php_phpcs_args_standard), '--ignore=*/tests/*,*/database/*', '--report=csv'],
    \ 'errorformat':
            \ '%-GFile\,Line\,Column\,Type\,Message\,Source\,Severity%.%#,'.
            \ '"%f"\,%l\,%c\,%t%*[a-zA-Z]\,"%m"\,%*[a-zA-Z0-9_.-]\,%*[0-9]%.%#'
    \ }

"/
"/ Vim Test
"/
let test#strategy = "neovim"                      " Runs test commands with :terminal
let g:test#php#phpunit#file_pattern = '.php$'     " Accept test classes with no filename pattern
nnoremap <silent> <leader>tf :TestNearest<CR>
nnoremap <silent> <leader>t% :TestFile<CR>
nnoremap <silent> <leader>ta :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tg :TestVisit<CR>

"/
"/ Vim Cheat40
"/
nmap <M-?> <plug>Cheat40Open

"/
"/ Fugitive (Git)
"/
" Shortcut to open Git status windows
nmap <C-g> :Gstatus<cr>

"-------------Auto-Commands--------------"

" Automatically source the Neovim config file on save.
augroup autosourcing
    autocmd!
    autocmd BufWritePost init.vim  source %
augroup END

" Regerate all ctags, asynchronously, when every buffer is saved
augroup ctags_management
    autocmd!
    autocmd BufWritePost * call jobstart("ctags-update.sh")
augroup END
"-------------Ctags----------------------"

set tags+=tags       " set the ctag files

" ---------Notes and Tips---------------"

" Type <leader>? to open a cheat sheet menu
"
" @todo migrate remaining commands to cheat40 plugin.


"/
"/ NERDTree
"/
" Press <M-n> to search the current file in NERDTree (custom shortcut)
" Press <c-n> to toogle NERDTree (custom shortcut)
"     Press o to open or close a node. If file, opens the file into current buffer
"     Press s to open vertical split
"     Press i to open split
"     Press t to open in new tab
"     Press q to close NerdTree windows
"     Press a to toggle zoom NerdTree windows
"     Press m to open a helpful menu with some helper methods, <ESC> to exit menu
"           On menu, press a to create a new dir/file recursively
"           On menu, press d to delete a dir/file recursively
"           On menu, press m to move a dir/file recursively
"     Press I to toggle hidden file


"/
"/ Fugitive (Git)
"/
" Use :Git <command git> to execute raw git command
" Use :GStatus to open a git status preview windows
"    Press g? to open a help file
"    Press - to staged or unstage a given file (works on visual mode)
"    Press d to see the cursor file diff into an horizontal split (same as :Gdiff)
"    Press dv to see the cursor file diff into a vertical split (same as :Gvdiff)
"    Press cc to commit the cursor file
"    Press U to checkout the cursor file
" Use :Gwrite to put the content to the other buffer (index / local) -- needs to save file to apply
" Use :Gread to put the content to the other buffer (index / local) --needs to save file to apply
" Use :Gvdiff to see the current file diff into a vertical split
"    Use :diffget to get a partial content of the other buffer (index / local) - needs to save file to apply changes
"        or just press do (does not work on VISUAL mode)
"    Use :diffput to put a partial content on the other buffer (index / local) - needs to save file to apply changes
"        or just press dp (does not work on VISUAL mode)
"    Use :diffupdate  to forcei the diferences to be updated on the screen (complicated changes are not updated automatically)
" Use :Git add % to stage the current file to the index (equivalent to :Gwrite, but does not update the buffer)
" Use :Git checkout % to revert current file to last checked in version (equivalent to :Gread, but does not update the buffer)
" Use :Git rm %	to delete the current file (equivalent to :Gremove, but does not update the buffer)
" Use :Git mv % <source> to rename the current file (equivalent to :Gmove, but does not update the buffer)
"/
"/ Vim Qf ( Searching / Search and Replate )
"/
" Type <leader>wq to toggle quickfix window
" Type <leader>wl to toggle location window
" In quickfix/location windows, type:
"    s - open entry in a new horizontal window
"    v - open entry in a new vertical window
"    t - open entry in a new tab
"    o - open entry and come back
"    O - open entry and close the location/quickfix window
"    p - open entry in a preview window
"
"    Search and Replate:
"
"    :Keep       to keep only entries that containing the given argument (filename or in the description).
"                Argument is not a regular expression pattern.
"    :Reject     to reject all entries that containing the given argument (filename or in the description).
"                Argument is not a regular expression pattern.
"    :Restore    Restore the list to its original state
"    :Doline    Execute an Ex command on every line in the current list.
"                Aliased to the built-in `:cdo` and `:ldo` when applicable.
"                Note : with subtitute command, do not use g flag or % range (for
"                all file) because the search list already has a item on list
"                for ocurrences on a file). If you use % or g, subistitution
"                will fail on next list item executions because will not find
"                the pattern, already changed by last command.
"                    :Doline s/foo/bar
"   :Doline     Execute an Ex command on every file in the current list.
"                Aliased to the built-in `:cfdo` and `:lfdo` when applicable.
"                Note :with subistitution command, note that the command will
"                execute only once per file, so you must consider use % range
"                or g flag to apply to all ocurrences.
"                    :Dofile %s/foo/bar/g
"                    :Dofile norm @q
"    Hints :
"        :Reject <c-r><c-w> to reject all ocurrences containing  the <cword> (word under the cursor)
"        :Reject <c-r><c-a> with the cursor under the file path to reject the current item on quicklist
"        :Keep <c-r><c-f> with the cursor under the file path to keep all ocurrences the file
"
" Note : Vim-Qf quit NeoVim if the last window is a location/quickfix window


"/
"/ Deoplete (auto complete)
"/
" Press <TAB> to navigate through popup options
" or <C-n> and <C-p> to go foward and backward through popup options
" Press <C-h> to close popup and delete backword char

"/
"/ UltiSnips ( integrated to Deoplete )
"/
" On Deoplete pop, select the snippet and type <c-space> to trigger
" or just type the snippet name and type <c-space>
"   type <c-space> again to go forward snippets jumps
"   type <c-k> to go backward snippts jumpts
" Type :UltiSnipsEdit to open the snippets file for the current filetype

" --------- Helpers ---------------"

"/
"/ Cheat sheet
"/
" ~/.config/nvim/cheat40.txt


"/
"/ Helper scripts
"/
" ~/bin/ctags-update.sh
" phpmd-ruleset.xml
" phpcs-ruleset.xml
" .ctagsignore
" .ignore


"/
"/ External libs
"/
" - universal-ctags (for tagging files) - uses .ctagsignore to ignore files
" - ryanoasis/nerd-fonts for fonts with devicons
" - ggreer/the_silver_searcher (ag for code searching) - uses .ignore to ignore files
"   msgpack php extention (msgpack/msgpack-php) - used by lvht/phpcd omnifunc
"   PCNTL php extention - used by lvht/phpcd omnifunc
"   fzf (fuzzy file finder) (brew install fzf && /usr/local/opt/fzf/install)
"   its own fzf binary installed by the 'junegunn/fzf' plugin
"   highlight (brew install highlight)  - for Highlight in fzf preview - http://www.andre-simon.de
