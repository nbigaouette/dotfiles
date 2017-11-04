" neovim configuration
" ~/.config/nvim/init.vim

" Some plugins require the python plugin:
" pip2 install --user neovim
" pip3 install --user neovim


" Inspired by:
"   https://arusahni.net/blog/2015/03/switching-to-neovim-part-1.html
"   https://arusahni.net/blog/2015/04/switching-to-neovim-part-2.html

" ##############################################################################
" Allow using ~/.vim as a symbolic link to ~/.nvim
" https://github.com/arusahni/dotfiles/blob/45c6655d46d1f672cc36f4e81c2a674484739ebc/vimrc#L28-L53
if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
else
    let s:editor_root=expand("~/.vim")
endif
if has("unix")
    let s:uname = system("uname")
    let g:python_host_prog='/usr/bin/python2'
    let g:python3_host_prog='/usr/bin/python3'
    if s:uname == "Darwin\n"
        let g:python_host_prog='/usr/local/bin/python2'
        let g:python3_host_prog='/usr/local/bin/python3'
    endif
endif


" ##############################################################################
" Setting up Vundle - the vim plugin bundler - and make sure it is installed.
" https://github.com/VundleVim/Vundle.vim
" https://github.com/arusahni/dotfiles/blob/45c6655d46d1f672cc36f4e81c2a674484739ebc/vimrc
let vundle_installed=1
let vundle_readme=s:editor_root . '/bundle/vundle/README.md'
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    " silent execute "! mkdir -p ~/." . s:editor_path_name . "/bundle"
    silent call mkdir(s:editor_root . '/bundle', "p")
    silent execute "!git clone https://github.com/VundleVim/Vundle.vim " . s:editor_root . "/bundle/vundle"
    let vundle_installed=0
endif
let &rtp = &rtp . ',' . s:editor_root . '/bundle/vundle/'
call vundle#rc(s:editor_root . '/bundle')


" ------------------------------------------------------------------------------
" Plugins and their configurations
" Inspiration: http://phaazon.blogspot.ca/2017/07/on-programming-workflows.html

" ...........................................
" Color scheme / Theme
" Solarized:
"     https://github.com/altercation/vim-colors-solarized
"     http://ethanschoonover.com/solarized/vim-colors-solarized
Bundle 'altercation/vim-colors-solarized'
syntax enable
set background=dark
" https://github.com/altercation/vim-colors-solarized#important-note-for-terminal-users
" For iTerm2: Settings -> Profiles -> Color Presets -> Solarized Dark
" Without this, the colors are screwed and one has to uncomment the
" folllowing:
" let g:solarized_termcolors=256
colorscheme solarized


" ...........................................
" Fancy start screen
Bundle 'mhinz/vim-startify'

" ...........................................
" Status line and its theme
if has('nvim')
    Bundle 'itchyny/lightline.vim'
    Bundle 'jacoborus/tender.vim'

    " Useless with lightline
    set noshowmode
    let s:editor_root=expand("~/.vim")

    let g:lightline = {
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'fugitive#head'
        \ },
        \ }
endif




" ...........................................
" Git status in gutter
Bundle 'airblade/vim-gitgutter'

Bundle 'tpope/vim-fugitive'

" ...........................................
" Markdown, tables and table of content
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
Bundle 'mzlogin/vim-markdown-toc'

" ...........................................
" TOML
Bundle 'cespare/vim-toml'


" ...........................................
" Python mode
" https://github.com/python-mode/python-mode
" https://github.com/python-mode/python-mode/blob/develop/doc/pymode.txt
Bundle 'python-mode/python-mode'
" set nofoldenable        " Disable folding on opening
let g:pymode_rope = 0   " Disable Rope support
let g:pymode_lint_cwindow = 1   " Auto open cwindow (quickfix) if any errors have been found

" ...........................................
" Adds file type glyphs/icons to popular Vim plugins
" Note: Needs "Nerd Font!" to render UTF-8 characters.
"   Clone https://github.com/ryanoasis/nerd-fonts.git and ./install.sh
"   https://github.com/ryanoasis/vim-devicons#installation
"   https://github.com/ryanoasis/nerd-fonts#font-installation
Bundle 'ryanoasis/vim-devicons'

" ...........................................
" Navigate through the window
" Default key binding: <Leader><Leader>
" Note: Needs to appear _before_ the 'let mapleader' command.
" https://github.com/easymotion/vim-easymotion
" Bundle 'easymotion/vim-easymotion'
"
" " Use the plugin for the search through "/"
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
"
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

" ...........................................
" Comments toggling
Bundle 'scrooloose/nerdcommenter'

filetype plugin on

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Change "<leader>" key (\) to coma
" Comment lines using: ",c " (coma, c, space)
" https://stackoverflow.com/a/26205358
let mapleader=","
set timeout timeoutlen=1500


" ...........................................
" Atom/Sublime like multiple cursors
Bundle "terryma/vim-multiple-cursors"

" ...........................................
" Autocompletion
" https://github.com/roxma/nvim-completion-manager
Bundle 'roxma/nvim-completion-manager'

" ...........................................
" Minimap
" Note: Requires both Python 2 and Python 3 packages:
"       pip2 install neovim && pip3 install neovim
" Bundle 'severin-lemaignan/vim-minimap'

" ...........................................
" Rust
Bundle 'rust-lang/rust.vim'

" ...........................................
" Tree visualization
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'tiagofumo/vim-nerdtree-syntax-highlight'

" ...........................................
" Fuzzy finder
Bundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Use 'F' as command to search for a file to open
:command F FZF


" Map key "Ctrl+\" to toggle tree
nnoremap <C-\> :NERDTreeToggle<CR>

" Open tree on vim start
" autocmd vimenter * NERDTree

" Ctrl + w w --> Cycle through all windows
" Ctrl + w h --> Takes focus left
" Ctrl + w l --> Takes focus left

" ...........................................
" To try/test
" Bundle 'ctrlpvim/ctrlp.vim'
" Bundle 'MattesGroeger/vim-bookmarks'
" Bundle 'luochen1990/rainbow'


" ##############################################################################
if vundle_installed == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end



" ##############################################################################
" General vim/neomvim configurations
" Tabs settings (see https://stackoverflow.com/a/1878983)
set tabstop=4           " Tabs width (maximum widht) is 4 spaces
set shiftwidth=4        " Indentation is 4 spaces
set expandtab           " Insert spaces instead of tabs

set cursorline          " Highlight current cursor line
set number              " Show line numbers
set encoding=utf8       " Use UTF-8 encoding

" Change lines with arrows when at end/begin
set whichwrap+=<,>,h,l,[,]

" Save last cursor position
" https://www.reddit.com/r/neovim/comments/632wh4/neovim_does_not_save_last_cursor_position/
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Enable spell check
" To check: Ctrl+x, s
"set spell
set spell spelllang=en_ca
set mouse=a
" set mouse=a mousemodel=popup
" set mouse=a mousemodel=popup_setpos


" Surprinsingly, vim does not set syntax by default
syntax on

" Smarthome
" http://vim.wikia.com/wiki/Smart_home
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

" Reload file when modified outside
" https://github.com/neovim/neovim/issues/3326#issuecomment-313326704
" https://github.com/neovim/neovim/issues/1936#issuecomment-309311829
set autoread
au FocusGained * :checktime

" Use ctrl+d to delete the word "around" the cursor (when in edit mode)
" https://stackoverflow.com/a/835333
imap <C-d> <C-[>diwi

" https://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
set colorcolumn=80                      " Column width
highlight ColorColumn ctermbg=gray      " Add a gray character to highlight the column
highlight OverLength ctermbg=darkred    " Set the background colour for text overflowing
match OverLength /\%81v.\+/             " Set the overflowing width

" Highlight whitespaces
set list


" Make :W save, just like :w
:command W w

" Map "qq" in edit mode to escape
" http://vim.wikia.com/wiki/Avoid_the_escape_key
:imap qq <Esc>
