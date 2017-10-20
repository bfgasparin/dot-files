call plug#begin('~/.config/nvim/plugged')

 " colorschemes
   Plug 'gosukiwi/vim-atom-dark'           " dark colorscheme
   " Plug 'albertorestifo/github.vim'         " light colorscheme

  " visual
   Plug 'vim-airline/vim-airline'        " fancy statusline
   Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
   Plug 'Yggdroot/indentLine'            " Display the indention levels with thin vertical lines
   Plug 'ntpeters/vim-better-whitespace' " Highlight trailing whitespaces and enable commands to fix it

  " utilities
   Plug 'junegunn/vim-easy-align'                                " mappings for aligment content
   Plug 'tpope/vim-surround'                                     " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
   Plug 'tpope/vim-commentary'                                   " comment stuff out
   Plug 'tpope/vim-abolish'                                      " easily search for, substitute, and abbreviate multiple variants of a word (snakeCase, camelCase, ...)
   Plug 'arithran/vim-delete-hidden-buffers'                     " Simple command to delete hidden non saved buffers

   if has('nvim')
       " Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }     " Language Server Protocol support
       Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete feature
       Plug 'fntlnz/atags.vim'                                   " Simplified ctags generation for neovim
   endif
   Plug 'danro/rename.vim'                                       " Rename a file on buffer and disk retaining the relative path
   Plug 'tpope/vim-repeat'                                       " Enable repeating plugin maps with .
   Plug 'matze/vim-move'                                         " Quickly move line up and down
   Plug 'jiangmiao/auto-pairs'                                   " Insert, delete brackets, parens, quotes in pair

  " Git
  Plug 'tpope/vim-fugitive'                                     " awesome Git wrapper
  Plug 'junegunn/gv.vim'                                        " A git commit browser
  Plug 'tpope/vim-rhubarb'                                      " GitHub extension for fugitive.vim
  Plug 'airblade/vim-gitgutter'                                 " Shows a git diff in the 'gutter'

  " PHP
   Plug 'lvht/phpcd.vim', { 'for': 'php' , 'do': 'composer update' } " autocomplete for php
   Plug 'arnaud-lb/vim-php-namespace'                            " add use statement and expand fully qualified php classes
   Plug 'pbrisbin/vim-mkdir'                                     " Auto create any non-existent directories before write buffer
   Plug 'alvan/vim-php-manual'                                   " PHP Manual
   Plug 'jwalton512/vim-blade'                                   " Laravel Blade Highlight
   Plug 'lumiliet/vim-twig'                                      " Twig syntax Highlight and indenting
   if has('nvim')
       " Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}    " Langhage Server php source for LanguageClient
   endif

   " HTML/CSS
   Plug 'mattn/emmet-vim'                                        " Emmet for vim

   " Javascript
   Plug 'mxw/vim-jsx'                                           " React JSX syntax highlighting and indenting for vim.

  " Languages (General)
   Plug 'janko-m/vim-test'                                       " Add support for running tests easily and fast
   Plug 'SirVer/ultisnips'                                       " Add snippet support
   Plug 'tobyS/vmustache'                                        " Template system engine (required by tobyS/pdv)
   Plug 'tobyS/pdv'                                              " to generate PHP docblock
   Plug 'w0rp/ale'                                               " Assynchronous Lint Engine

  " Markdown
   Plug 'kannokanno/previm'                                          " Preview markdown and reStructuredText into browser

  " " navigation
   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy file finder (installed throw homebrew
   Plug 'junegunn/fzf.vim'                                           " Customize fzf into vim
   Plug 'majutsushi/tagbar'                                          " show current file ctags in a diferent view
   Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' | Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " file drawer
   Plug 'moll/vim-bbye'                                              " Delete buffers and close files in NeoVim without closing windows
 " helper
   Plug 'lifepillar/vim-cheat40'                                     " Helper cheat
call plug#end()
