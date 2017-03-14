call plug#begin('~/.config/nvim/plugged')

 " colorschemes
 Plug 'gosukiwi/vim-atom-dark'           " dark colorscheme
 Plug 'albertorestifo/github.vim'         " light colorscheme

 "visual
 Plug 'vim-airline/vim-airline'        " fancy statusline
 Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
 Plug 'Yggdroot/indentLine'            " Display the indention levels with thin vertical lines
 Plug 'ntpeters/vim-better-whitespace' " Highlight trailing whitespaces and enable commands to fix it
 Plug 'airblade/vim-gitgutter'         " Shows a git diff in the 'gutter'

" " utilities
 Plug 'junegunn/vim-easy-align'                                " mappings for aligment content
 Plug 'tpope/vim-surround'                                     " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
 Plug 'tpope/vim-fugitive'                                     " awesome Git wrapper
 Plug 'junegunn/gv.vim'                                        " A git commit browser
 Plug 'tpope/vim-commentary'                                   " comment stuff out
 Plug 'tpope/vim-abolish'                                      " easily search for, substitute, and abbreviate multiple variants of a word (snakeCase, camelCase, ...)
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete feature
 Plug 'lvht/phpcd.vim', { 'for': 'php' , 'do': 'composer update' } " autocomplete for php
 " @todo Configure padawan-php to work without bug https://github.com/padawan-php/padawan.php/issues/71#issuecomment-270927679
 " Plug 'padawan-php/deoplete-padawan'                         " asynchronous completion of PHP code using padawan project
 Plug 'danro/rename.vim'                                       " Rename a file on buffer and disk retaining the relative path
 Plug 'tpope/vim-repeat'                                       " Enable repeating plugin maps with .
 Plug 'matze/vim-move'                                         " Quickly move line up and down
" " PHP
 Plug 'StanAngeloff/php.vim'                                   " A PHP 5.6 syntax file
 Plug 'arnaud-lb/vim-php-namespace'                            " add use statement and expand fully qualified php classes
 Plug 'stephpy/vim-php-cs-fixer'                               " Integrates php-cs-fixer
 Plug 'pbrisbin/vim-mkdir'                                     " Auto create any non-existent directories before write buffer
 Plug 'alvan/vim-php-manual'                                   " PHP Manual

 " Languages (General)
 Plug 'janko-m/vim-test'                                       " Add support for running tests easily and fast
 Plug 'SirVer/ultisnips'                                       " Add snippet support
 Plug 'tobyS/vmustache'                                        " Template system engine (required by tobyS/pdv)
 Plug 'tobyS/pdv'                                              " to generate PHP docblock
 Plug 'neomake/neomake'                                        " Add lint support using async Neovim job control

 " navigation
 " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy file finder (installed throw homebrew
 Plug 'junegunn/fzf.vim'                                           " Customize fzf into vim
 Plug 'tweekmonster/fzf-filemru'                                   " Add MRU feature to fzf
 Plug 'tpope/vim-vinegar'                                          " alternative and minimalist file finder
 Plug 'majutsushi/tagbar'                                          " show current file ctags in a diferent view
 Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
 Plug 'romainl/vim-qf'                                             " Collections of settings, commands and mappings to easily work with quickfix/location windows
 Plug 'moll/vim-bbye'                                              " Delete buffers and close files in NeoVim without closing windows
" helper
 Plug 'lifepillar/vim-cheat40'                                     " Helper cheat
call plug#end()
