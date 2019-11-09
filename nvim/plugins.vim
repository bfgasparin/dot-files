call plug#begin('~/.config/nvim/plugged')

 " colorschemes
   Plug 'gosukiwi/vim-atom-dark'           " dark colorscheme
   Plug 'albertorestifo/github.vim'         " light colorscheme

  " visual
   Plug 'itchyny/lightline.vim'
   " Plug 'maximbaz/lightline-ale'
   Plug 'Yggdroot/indentLine'            " Display the indention levels with thin vertical lines
   Plug 'ntpeters/vim-better-whitespace' " Highlight trailing whitespaces and enable commands to fix it

  " utilities
   Plug 'junegunn/vim-easy-align'                                " mappings for aligment content
   Plug 'tpope/vim-surround'                                     " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
   Plug 'tpope/vim-commentary'                                   " comment stuff out
   Plug 'tpope/vim-abolish'                                      " easily search for, substitute, and abbreviate multiple variants of a word (snakeCase, camelCase, ...)
   Plug 'arithran/vim-delete-hidden-buffers'                     " Simple command to delete hidden non saved buffers

   if has('nvim')
       Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}      " autocompletion feature
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
   Plug 'pbrisbin/vim-mkdir'                                     " Auto create any non-existent directories before write buffer
   Plug 'alvan/vim-php-manual'                                   " PHP Manual
   Plug 'jwalton512/vim-blade'                                   " Laravel Blade Highlight
   Plug 'lumiliet/vim-twig'                                      " Twig syntax Highlight and indenting

   " HTML/CSS
   Plug 'mattn/emmet-vim'                                        " Emmet for vim

   " Javascript
   Plug 'pangloss/vim-javascript'                               " Required by vim-jsx
   Plug 'mxw/vim-jsx'                                           " React JSX syntax highlighting and indenting for vim.
   Plug 'posva/vim-vue'                                         " Syntax Highlight for vue components

  " Languages (General)
   Plug 'janko-m/vim-test'                                       " Add support for running tests easily and fast
   Plug 'SirVer/ultisnips'                                       " Add snippet support
   Plug 'honza/vim-snippets'                                     " Default snippets for a lot of languages
   Plug 'tobyS/vmustache'                                        " Template system engine (required by tobyS/pdv)

   Plug 'tobys/pdv'                                              " to generate PHP docblock
   " commented ale in order to test linting and autocompletoin from nowclide/coc
   " Plug 'w0rp/ale'                                               " Assynchronous Lint Engine

  " Markdown
   Plug 'kannokanno/previm'                                          " Preview markdown and reStructuredText into browser

  " navigation
   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy file finder (installed throw homebrew
   Plug 'junegunn/fzf.vim'                                           " Customize fzf into vim
   Plug 'liuchengxu/vista.vim'                                       " View and search LSP symbols
   Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' | Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " file drawer
   Plug 'moll/vim-bbye'                                              " Delete buffers and close files in NeoVim without closing windows

 " helper
   Plug 'lifepillar/vim-cheat40'                                     " Helper cheat
   " Plug 'editorconfig/editorconfig-vim'                              " EditorConfig plugin for Vim
call plug#end()
