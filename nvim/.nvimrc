" this file has ordered commands for it to work. don't blindly change the order.

" Lang {{{
language messages en_US.utf8
set langmenu=en_US.utf8
let $LANG = 'en_US.utf8'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set spelllang=en,es
" }}}

" Vim-Plug Config {{{
" in nvim, put this before any python plugins are loaded:
if has('nvim')
		runtime! plugin/python_setup.vim
endif

" Example config:
" call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" Plug 'junegunn/seoul256.vim'
" Plug 'junegunn/vim-easy-align'
"
" " On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" " Using git URL
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
" " Plugin options
" Plug 'nsf/gocode', { 'tag': 'go.weekly.2012-03-13', 'rtp': 'vim' }
"
" " Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
"
" " Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'
"
" call plug#end()

" Automatic installation:
if empty(glob('~/.nvim/autoload/plug.vim'))
		silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall
endif

" For Mac/Linux users
call plug#begin('~/.nvim/bundle')
" For Windows users
" call plug#begin('~/vimfiles/bundle')

" ADD YOUR PLUGINS HERE:

" LOOKS:
"Plug 'ScrollColors'								" scroll themes with :SCROLLCOLOR
Plug 'chriskempson/base16-vim'						" base16 color themes
"Plug 'mimicpak'									" more color themes
"Plug 'severin-lemaignan/vim-minimap'				" sublime-text style minimap (NEEDS braille capable font, python)
"Plug 'CSApprox'									" makes gvim-only colorschemes work in terminal vim
Plug 'zefei/vim-colortuner'						" only works with true colours (neovim, gvim)
	let g:colortuner_filepath = '~/.nvim/.vim-colortuner'

Plug 'bling/vim-airline'							" status/tabline (NEEDS powerline font)
	let g:airline_powerline_fonts = 1 						" automatically populate the g:airline_symbols dictionary with the powerline symbols
	set laststatus=2 										" always show statusline
	set noshowmode 											" hide the default mode text (e.g. -- INSERT -- below the statusline)
	let g:airline#extensions#tabline#enabled = 1			" automatically displays all buffers when there's only one tab open
	"let g:airline#extensions#tabline#left_sep = ' '		" straight separators
	"let g:airline#extensions#tabline#left_alt_sep = '|'
	let g:airline#extensions#tabline#buffer_idx_mode = 1	" display numbers in the tab line, and use mappings <leader>1 to <leader>9
	if has("gui_running")
		let g:airline_theme= "base16"
	else
		let g:airline_theme= "badwolf"
	endif
	let g:airline_theme_patch_func = 'AirlineThemePatch'
	function! AirlineThemePatch(palette)
			if g:airline_theme == 'badwolf'
					let a:palette.normal.airline_c = [ '#8cffba' , '#242321' , 121 , 233 ]
					let a:palette.insert.airline_c = [ '#0a9dff' , '#242321' , 39  , 233 ]

			endif
	endfunction

" Plug 'edkolev/tmuxline.vim'						" clone airline to tmux (its set up, only uncomment if you want to change the tmux statusline theme again)
	" To export current statusline to a file which can be sourced by tmux.conf on startup:
	" :TmuxlineSnapshot ~/.tmux/tmuxline
	"let g:tmuxline_powerline_separators = 0		" use block separators instead
	let g:tmuxline_preset = {
		\'a'    : '#S',
		\'b'    : '#W',
		\'win'  : '#I #W',
		\'cwin' : '#I #W',
		\'y'    : '%R',
		\'z'    : '#H'}

Plug 'sjl/badwolf'									" badwolf color theme
	let g:badwolf_darkgutter = 1					" make the gutters darker than the background.
	let g:badwolf_tabline = 1 						" make the tabline the same color as the background


" FUNCTIONALITY:
"Plug 'matchit.zip'									" cicles between if, then, else..
Plug 'tpope/vim-surround'							" surround strings faster 			(http://www.catonmat.net/blog/vim-plugins-surround-vim/)
Plug 'tpope/vim-speeddating'						" fixes vim incrementing of dates, times, etc (<C-A>, <C-X>)
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " navigation tree
Plug 'tpope/vim-fugitive'							" git support
Plug 'airblade/vim-gitgutter'						" show +,-,~ git changes on the gutter
"Plug 'majutsushi/tagbar'							" show list of variables, functions, classes.. (NEEDS ctags)
"Plug 'kien/ctrlp.vim'								" full path fuzzy file,buffer,mru,tag.. finder
"Plug 'sjl/gundo.vim'								" visualize vim undo tree
" Plug 'nathanaelkane/vim-indent-guides'			" visually display indent levels
Plug 'scrooloose/syntastic'							" automatic syntax checking
Plug 'LargeFile'									" disables certain features of vim for speed in large files
Plug 'AndrewRadev/inline_edit.vim'					" change code inside other code with ':InlineEdit'
Plug 'tpope/vim-commentary'							" comment with motion support
Plug 'tmux-plugins/vim-tmux-focus-events'			" lets terminal vim to know about focus changes (autoread, etc)
" Plug 'scrooloose/nerdcommenter'					" toggle comments
	let g:NERDSpaceDelims = 1						" add space before and after comment delimiters

"Plug 'tasklist.vim'								" <leader> t shows a list of TODOs and FIXMEs
Plug 'christoomey/vim-tmux-navigator'				" seamlessly navigate between tmux and vim panels

Plug 'yonchu/accelerated-smooth-scroll'				" smooth scroll on <C-d>, <C-u>, <C-f>, <C-b>
	let g:ac_smooth_scroll_du_sleep_time_msec = 5
	let g:ac_smooth_scroll_fb_sleep_time_msec = 5

"Plug 'xolox/vim-shell'								" provides integration between Vim and environment (fullscreen, etc). requires wmctrl
"Plug 'xolox/vim-misc'								" (NEEDED by vim-shell)
	let g:shell_fullscreen_items = ''				" hide: m mainmenu, T toolbar, e tabline

Plug 'mhinz/vim-startify'							" a start screen with recently modified files and vim sessions
	let g:startify_session_persistence = 0			" automatically update sessions
	let g:startify_session_delete_buffers = 1		" delete open buffers before loading a new session
	let g:startify_custom_footer = [
		\ '',
		\ '    b   ➤ open in new buffer  :SLoad   ➤ load a session     ',
		\ '    s,v ➤ open in split       :SSave   ➤ save a session     ',
		\ '    t   ➤ open in tab         :SDelete ➤ delete a session   ',
		\ '',
		\ ]
	let g:startify_custom_header =
		\ map(split(system('fortune'), '\n'), '"   ". v:val') + ['']

Plug 'vim-scripts/Conque-GDB', {'on': 'ConqueGDB'}	" GDB integration inside vim
	let g:ConqueTerm_Color = 2						" 1: strip color after 200 lines, 2: always with color
	let g:ConqueTerm_CloseOnEnd = 1 				" close conque when program ends running
	let g:ConqueTerm_StartMessages = 0				" display warning messages if conqueTerm is configured incorrectly

Plug 'jez/vim-superman'								" wrapper around man.vim's Man command
	noremap K :SuperMan <cword><CR>


" COMPLETION AND SNIPPETS:
Plug 'Raimondi/delimitMate'							" provides insert mode auto-completion for quotes,parens,brackets..
Plug 'Valloric/YouCompleteMe', {'do': './install.sh --clang-completer'}		" (NEEDS to be compiled, read the docs!)
	"let g:ycm_auto_trigger = 0		" turn off the as-you-type popup and the popup you'd get after typing . or -> in say C++. You can still use it by <C-Space> shortcut.
	let g:ycm_global_ycm_extra_conf = '~/.nvim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

Plug 'SirVer/ultisnips'								" compatible with YouCompleteMe, this is the snippets engine
Plug 'honza/vim-snippets'							" Snippets are separated from the engine.
	let g:UltiSnipsEnableSnipMate = 0 " don't look for SnipMate snippets, in the 'snippets' dir
	let g:UltiSnipsSnippetDirectories=["snippets_UltiSnips"]
	" Ultisnips and YouCompleteMe integration, both work with tab
	function! g:UltiSnips_Complete()
		call UltiSnips#ExpandSnippet()
		if g:ulti_expand_res == 0
			if pumvisible()
				return "\<C-n>"
			else
				call UltiSnips#JumpForwards()
				if g:ulti_jump_forwards_res == 0
					return "\<TAB>"
				endif
			endif
		endif
		return ""
	endfunction
	au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
	let g:UltiSnipsJumpForwardTrigger="<tab>"
	let g:UltiSnipsListSnippets="<c-e>"
	" this maps Enter key to <C-y> to chose the current highlight item
	" and close the selection list, same as other IDEs:
	" CONFLICTS with some plugins like tpope/Endwise
	inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" FILETYPE:
"Plug 'godlygeek/tabular'							" to order lines by a separator easily
"Plug 'plasticboy/vim-markdown'						" markdown style (needs tabular plugin)
Plug 'justinmk/vim-syntax-extra', {'for': 'c'}		" bison, flex, c syntax (operators, delimiters, functions..)
Plug 'freitass/todo.txt-vim', {'for': 'todo'}		" for todo.txt filetypes
Plug 'vivien/vim-addon-linux-coding-style', {'for': 'c'}

Plug 'LaTeX-Box-Team/LaTeX-Box', {'for': 'tex'}
	let g:LatexBox_output_type="pdf"
	let g:LatexBox_latexmk_async=1 					" allow Latexmk to run in the background and load any compilation errors in a quickfix window after it finishes running.
	"let g:LatexBox_latexmk_preview_continuously=1 	" Latexmk will track the currently edited file for writes and recompile automatically when necessary
	let g:LatexBox_quickfix=3 						" recommended by preview_continously
	let g:LatexBox_latexmk_options="-pdflatex='xelatex --shell-escape -interaction=nonstopmode %O %S' -cd -f"
	let g:LatexBox_autojump=1						" auto jump to first error after compiling

Plug 'c.vim', {'for': 'c'}
	let g:C_LocalTemplateFile = $HOME.'/.nvim/snippets_Cvim/c-support/templates/Templates' " this allows for the templates to be versioned on .dotfiles

Plug 'hdima/python-syntax', {'for': 'python'}		" neccesary, vim default python syntax has a regex bug as of 7.4.663
	let python_highlight_all = 1
	" you can change between py v2 and v3 with :Python2Syntax and :Python3Syntax

Plug 'jamessan/vim-gnupg'							" encrypts/decrypts with gpg files that end in .gpg,.pgp or .asc. plaintext only on ram
	let g:GPGDefaultRecipients = ["0x5702AA3A <me@viccuad.me>"]
	" let g:GPGUsePipes=1			" (might break the prompt) use pipes instead of vim /temp files (no writing to disk)

call plug#end()
" }}}

" Filetype & languages {{{
filetype on						" enable filetype detection
filetype indent on				" enable filetype-specific indenting. can conflict with set autoindent smartindent
filetype plugin on				" enable filetype-specific plugins

" C language
let c_space_errors = 1
let c_comment_strings = 0		" dont highlight strings inside C comments

" Python language
let python_space_errors = 1
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

" Java language
let java_space_errors = 1

" Markdown instead of modula2
autocmd BufNewFile,BufReadPost *.md setl filetype=markdown spell textwidth=0 wrapmargin=0

" TXT files
autocmd BufNewFile,BufReadPost *.txt setl spell textwidth=0 wrapmargin=0

" Mail files from mutt
autocmd FileType mail setl nonumber spell textwidth=0 wrapmargin=0
" }}}

" Spaces & Tabs {{{
set tabstop=4						" number of visual spaces per TAB
"set autoindent smartindent			" copy indent from current line when starting a new line, and smart indent automatically inserts one level of indentation in some cases.
set listchars=tab:>·,trail:·,eol:¬	" show tabs, eol and trailing whitespace when showing separators
"set listchars=tab:\ \ ,trail:·		" only show trailing whitespace when showing separators. the tab is 2 spaces
"set list							" show listchars
" }}}

" Line wrap {{{
" gq: performs 'rewrap the text'
set wrap							" soft wrap long lines, visually, instead of changing the file
set linebreak						" wrap long lines at characters in 'breakat' rather than at the last character that fits
set breakindent						" wrapped lines are visually indented
let &colorcolumn=join(range(81,200),",") " colors columns past 80
set textwidth=80
set formatoptions=tcrql 			" t autowrap to textwidth
									" c autowrap comments to textwidth
									" r autoinsert comment leader with <enter>
									" q allow formatting of comments with gq
									" l	Long lines are not broken in insert mode: When a line was longer than 'textwidth' when the insert command started, Vim does not automatically format it.
									" 1	Don't break a line after a one-letter word. It's broken before it instead (if possible).
									" j	Where it makes sense, remove a comment leader when joining lines
" }}}

" Look and feel {{{
set title							" change terminal title
syntax on							" enable syntax processing
"set virtualedit=all				" move the cursor everywhere
set synmaxcol=2048					" prevents huge slow downs from syntax highlighting
set number							" show line numbers
"set relativenumber					" show relative numbers. can be on at the same time that number
set cursorline						" highlight current line
set showcmd							" show (partial) command in status line
set wildmenu        				" visual autocomplete for command menu
set wildmode=longest,list,full		" complete longest common string, then list alternatives, then select the sortest first
set cpoptions+=$					" put a '$' at the end of the changed text
set showmatch						" highlight matching brackets
set mouse=a							" enable mouse usage (all modes)
set mousehide						" hide the mouse when typing text
set backspace=indent,eol,start		" allow backspacing over all of that
set ruler 							" show the cursor position and line number at the bar
set lazyredraw						" don't redraw while in macros
set scrolloff=5						" keep at least 5 lines above/below
set sidescrolloff=5 				" keep at least 5 lines left/right
set splitright 						" vertical splits use right half of screen
set splitbelow 						" horizontal splits use bottom half of screen
set noerrorbells					" no error bells please
set visualbell
set vb t_vb=						" no beep or flash
if has('autocmd')
	autocmd GUIEnter * set visualbell t_vb= 	"redo t_vb= for gui so it takes place
endif
set timeout							" time out on key codes
set ttimeoutlen=500					" the time in milliseconds that is waited for a key code or mapped key sequence to complete

if has("gui_running")
	set guiheadroom=0				" vim padding: fix it in ~/.gtkrc-2.0
	set background=dark 			" if using a dark background, for syntax highlighting

	colorscheme base16-monokai

	set guioptions-=T				" remove Toolbar
	set guioptions+=c				" use console dialogs
	set guioptions-=r				" remove right-hand scrollbar
	set guioptions-=R				" remove right-hand scrollbar
	set guioptions-=l				" remove left-hand scrollbar
	set guioptions-=L				" remove left-hand scrollbar

	if has("gui_gtk2")
		"set guifont=Monospace\ 10
		"set guifont=DejaVu\ Sans\ Mono\ 10
		"set guifont=Terminus\ 9
		set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 8
	elseif has("gui_macvim")
		set guifont=Menlo\ Regular:h14
	elseif has("gui_win32")
		set guifont=Consolas:h11:cANSI
	endif
else
	set t_Co=256					" force number of colors to 256 inside vim. this shouldn't be done, better with TERM
	"let base16colorspace=256		" access colors present in 256 colorspace
	set background=dark 			" if using a dark background, for syntax highlighting
	" colorscheme wombat256
	colorscheme badwolf
	" colorscheme xoria256
	" colorscheme base16-default
	" colorscheme wombat256mod
	" colorscheme base16-tomorrow
	" highlight ColorColumn ctermbg=232 guibg=#080808 	" colorcolumn for wombat256mod
	" highlight ColorColumn ctermbg=0 guibg=#000000 	" colorcolumn for wombat256
	" highlight ColorColumn ctermbg=233 guibg=#121212	" colorcolumn for xoria256
	highlight ColorColumn ctermbg=232 guibg=#080808		" colorcolumn for badwolf
	" highlight ColorColumn ctermbg=0 guibg=#303030		" colorcolumn for base16
	" highlight ColorColumn ctermbg=235 guibg=#262626	" colorcolumn for base16-default
endif

highlight clear SignColumn		" sets the git gutter to the same color as the number column (needs to be after your colorscheme)

" terminal: Use a blinking upright bar cursor in Insert mode, and a blinking block in normal
" this could be done with Plugin 'jszakmeister/vim-togglecursor'
" change cursor to a '|' when on vim console and insert mode:
if &term == 'xterm-256color' || &term == 'screen-256color'
	let &t_SI = "\<Esc>[5 q"
	let &t_EI = "\<Esc>[1 q"
endif
" urxvt has not implemented the bar cursor until 9.21, lets use an underbar:
if &term == 'rxvt-unicode-256color'
	let &t_SI = "\<Esc>[3 q"
	let &t_EI = "\<Esc>[1 q"
endif
" }}}

" Persistence {{{
set viminfo+=% "save and restore the buffer list expected if vim is started with a file name argument
set viminfo+=n$HOME/.nvim/.nviminfo
" delete the empty buffer that appears on startup:
"autocmd VimEnter * nested if  bufname('')==''  &&  line('$') == 1 &&  col('$')==1 &&  !&modified | bd % | endif

set hidden							" don't mark buffers as abandoned if hidden
set history=1000
set undofile						" save undo's after file closes
set undodir=$HOME/.nvim/undo			" where to save undo histories
set undolevels=1000					" how many undos
set undoreload=10000				" number of lines to save for undo
" }}}

" Backup and Swap files {{{
set backupdir=$HOME/.nvim/backup		" for backup files
set directory=$HOME/.nvim/backup		" for .swp files
" }}}

" Searching {{{
set ignorecase						" do case insensitive matching
set smartcase						" overrides ignorecase if uppercase used in search string
set incsearch						" incremental search
set hlsearch						" highlight matches
set wrapscan						" jumps to the beginning if reaching end, and viceversa
" }}}

" Mappings {{{
" make these commonly mistyped commands still work:
command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q

let mapleader = "\<Space>"

" use tab key to cycle through the buffers:
" if has('nvim')
" 	nnoremap <C-Tab>   :bnext<CR>
" 	nnoremap <C-S-Tab> :bprevious<CR>
" else
	nnoremap <leader><Tab>   :bnext<CR>
	nnoremap <leader><S-Tab> :bprevious<CR>
" endif

" remap jk to escape in insert mode:  You'll never type jk anyway, so it's great!
inoremap jk <Esc>

" use hjkl-movement between rows when soft wrapping:
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" force yourself to stop using the arrow keys:
map <up>    <nop>
map <down>  <nop>
map <left>  <nop>
map <right> <nop>

" move between tabs:
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" list of shared binds:
" write file without confirmation:
map <silent> <F2> :write<CR>

" remove trailing whitespaces:
"nnoremap <silent> <F3> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let"@/=_s<Bar>:nohl<CR>

" remove trailing whitespaces:
map <F3> :%s/\s\+$//<CR>

" close buffer:
map <silent> <F4> <Esc>:bd<CR>

" toggle spell checking:
map <F5> :setlocal spell!<CR>

" open urls, files, etc. example: http://google.com:
noremap <F6> :!xdg-open <cfile><CR><CR>
set isfname+=32										" to open files with spaces

" open (vim-shell plugin):
"<F6>

" previous c error (c.vim plugin):
map  <silent> <F7>    <Esc>:cprevious<CR>

" next c error (c.vim plugin)
map  <silent> <F8>    <Esc>:cnext<CR>

" compile & link c code (alt+<F9> write + compile, ctrl+<F9> compile + run) (c.vim plugin)
"<F9>

" maximize (vim-shell plugin)
"<F11>
" }}}

" Folding {{{
set foldmethod=syntax
set foldlevel=99
set foldnestmax=10			" max 10 depth
set nofoldenable			" don't fold files by default on open
set foldlevelstart=1		" start with fold level of 1
" }}}

" Launch {{{
set encoding=utf8
set autowrite								" automatically save before commands like :next and :make
set autochdir								" automatically cd into the directory that the file is in (this will break plugins if activated!!!)
"autocmd BufEnter * silent! lcd %:p:h		" automatically cd into the dir of the file. this breaks less
set autoread								" watch for file changes
set nomodeline								" dont make vim check beginning and ending lines of files for options. HUGE VULNERABILITY
" jump to the last position when reopening a file:
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" }}}

" vim:foldmethod=marker:foldlevel=0
