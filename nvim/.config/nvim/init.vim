" this file has ordered commands for it to work. Don't blindly change the order.

" Lang {{{
language messages en_US.utf8
set langmenu=en_US.utf8
let $LANG = 'en_US.utf8'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set spelllang=en,es
set complete+=kspell			" add dictionary words to completion
" }}}

" Vim-Plug Config {{{

" Automatic installation shouldn't fire up, because we have our trusted plug.vim
" in '~/.config/nvim/autoload/plug.vim'

" Automatic installation:
if empty(glob('~/.config/nvim/autoload/plug.vim'))
		silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall
endif

" For Mac/Linux users
call plug#begin('~/.config/nvim/bundle')
" For Windows users
" call plug#begin('~/vimfiles/bundle')

" ADD YOUR PLUGINS HERE:

" LOOKS:
Plug 'viccuad/badfox'									" badfox color theme
	let g:badfox_darkgutter = 0							" make the gutters darker than the background.
	let g:badfox_darkcolorcolumn = 0					" make the colorcolumn the same color as the gutter
	let g:badfox_tabline = 1 							" make the tabline the same color as the background
    let g:airline_theme="badwolf"

Plug 'miyakogi/conoline.vim'							" show cursorline only on current buffer, change its color
	let g:conoline_auto_enable = 1
	let g:conoline_use_colorscheme_default_normal = 1	" Use colors defined by colorscheme in normal mode.
	let g:conoline_use_colorscheme_default_insert = 1	" Use colors defined by colorscheme in insert mode.

Plug 'junegunn/goyo.vim', {'on': 'Goyo'}			" distraction free mode
Plug 'junegunn/limelight.vim', {'on': 'Limelight'}	" hyperfocus mode
	let g:limelight_paragraph_span = 0
	let g:limelight_conceal_guifg = 'DarkGray'		" Neovim not yet with truecolor support
	autocmd! User GoyoEnter Limelight
	autocmd! User GoyoLeave Limelight!

Plug 'zefei/vim-colortuner', {'on': 'Colortuner'}			" saturation, hue, etc tuning (only works with true colours: neovim, gvim)
	let g:colortuner_filepath = '~/.config/nvim/vim-colortuner'

Plug 'bling/vim-airline'									" status/tabline (NEEDS powerline font)
	let g:airline_powerline_fonts = 1 						" automatically populate the g:airline_symbols dictionary with the powerline symbols
	set laststatus=2 										" always show statusline
	set noshowmode 											" hide the default mode text (e.g. -- INSERT -- below the statusline)
	let g:airline#extensions#tabline#enabled = 1			" automatically displays all buffers when there's only one tab open
	" let g:airline#extensions#tabline#left_sep = ' '		" straight separators
	" let g:airline#extensions#tabline#left_alt_sep = '|'
	let g:airline#extensions#tabline#buffer_idx_mode = 1	" display numbers in the tab line, and use mappings <leader>1 to <leader>9
	let g:airline#extensions#tmuxline#enabled = 0
	let g:airline#extensions#tagbar#enabled = 0
	let g:airline#extensions#tagbar#flags = 's'
	let g:airline_theme_patch_func = 'AirlineThemePatch'
	function! AirlineThemePatch(palette)
			if g:airline_theme == 'badwolf'
					let a:palette.normal.airline_c = [ '#8cffba' , '#242321' , 121 , 235 ]
					let a:palette.insert.airline_c = [ '#0a9dff' , '#242321' , 39  , 235 ]
			endif
	endfunction

" Plug 'edkolev/tmuxline.vim'							" clone airline to tmux (its set up, only uncomment if you want to change the tmux statusline theme again)
	" To export current statusline to a file which can be sourced by tmux.conf on startup:
	" :Tmuxline airline
	" :TmuxlineSnapshot! ~/.tmux/tmuxline
	"let g:tmuxline_powerline_separators = 0			" use block separators instead
	let g:tmuxline_preset = {
		\'a'    : '#S',
		\'b'    : '#W',
		\'c'    : '#{prefix_highlight}',
		\'win'  : '#I #W',
		\'cwin' : '#I #{?window_zoomed_flag,#[fg=red](,}#W#{?window_zoomed_flag,#[fg=red]),}',
		\'y'    : '%R',
		\'z'    : '#H #(rainbarf --width 10 --bolt --remaining --rgb)'}


" FUNCTIONALITY:
Plug 'matchit.zip'									" cicles between if, then, else..
Plug 'tpope/vim-surround'							" surround strings faster (ysiwX,csXX, dsX, ysMX, yssX)
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}	" show list of variables, functions, classes.. (NEEDS exuberant-ctags)
Plug 'LargeFile'									" disables certain features of vim for speed in large files
Plug 'AndrewRadev/inline_edit.vim', {'on': 'InlineEdit'}	" change code inside other code with ':InlineEdit'
Plug 'tpope/vim-commentary'							" comment with motion support
Plug 'junegunn/vim-peekaboo'						" shows the contents of the registers on pop-up buffer
Plug 'christoomey/vim-tmux-navigator'				" seamlessly navigate between tmux and vim panels
Plug 'tmux-plugins/vim-tmux-focus-events'			" let terminal vim to know about focus changes (autoread, etc)
Plug 'reedes/vim-wordy', {'on': 'NextWordy'}		" adds dictionaries for uncovering usage problems in your writing
Plug 'keith/investigate.vim'						" search the language docs with gK
" Plug 'drawit'										" to draw lines and diagrams (<leader>di to start, <leader>ds to stop)
" Plug 'osyo-manga/vim-over'						" :substitute live preview to view changes as you are doing them
" Plug 'janko-m/vim-test'							" run test suites from inside vim

" Plug 'kana/vim-textobj-user'						" create your own text objects (dependency for the following)
	" Plug 'PeterRincker/vim-argumentative'			" Argument text object (via, >a)
	" Plug 'kana/vim-textobj-indent'					" Indent text object (vii)
	" Plug 'kana/vim-textobj-line'					" Line text object (vil)
	" Plug 'kana/vim-textobj-entire'					" Entire buffer text object (vae)
	" Plug 'nelstrom/vim-textobj-rubyblock'			" Ruby block text object (vir)
	" Plug 'glts/vim-textobj-comment'					" Comment text object (vac)

Plug 'rking/ag.vim'									" use ag instead of grep
	let g:ag_working_path_mode="r"					" always start searching from the project root instead of the cwd

Plug 'tpope/vim-fugitive'							" git support
	" each time you open a git object using fugitive it creates a new buffer. This autocloses them after:
	autocmd BufReadPost fugitive://* set bufhidden=delete

Plug 'unblevable/quick-scope'						" highlight characters when doing f,F,t,T
	let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

Plug 'vasconcelloslf/vim-interestingwords'			" highlight all words (<leader>k, <leader>K)
	let g:interestingWordsGUIColors = ['#99B3FF', '#B399FF', '#E699FF', '#FF99B3', '#99FFE6', '#FFD65C', '#99FFB3', '#E6FF99', '#FFB399', '#5CD6FF', '#99FF99', '#FFF6CC']


" Plug 'matze/vim-move'								" move blocks of text in visual and normal mode (<A-j>, <A-k>)
	" let g:move_map_keys = 0
	" vmap <C-j> <Plug>MoveBlockDown
	" vmap <C-k> <Plug>MoveBlockUp
	" " FIXME: this two don't work:
	" nmap <A-j> <Plug>MoveLineDown
	" nmap <A-k> <Plug>MoveLineUp

Plug 'haya14busa/incsearch.vim'						" highlights every occurrence of the search before hitting enter
	let g:incsearch#auto_nohlsearch = 0				" hlsearch will be automatically turned off after a cursor move
	map /  <Plug>(incsearch-forward)
	map ?  <Plug>(incsearch-backward)
	map g/ <Plug>(incsearch-stay)
	map n  <Plug>(incsearch-nohl-n)
	map N  <Plug>(incsearch-nohl-N)
	map *  <Plug>(incsearch-nohl-*)
	map #  <Plug>(incsearch-nohl-#)
	map g* <Plug>(incsearch-nohl-g*)
	map g# <Plug>(incsearch-nohl-g#)

Plug 'mhinz/vim-signify'							" show +,-,~ git changes on the gutter
	let g:signify_vcs_list = ['git']
	let g:signify_sign_change = '~'

Plug 'kshenoy/vim-signature'						" place, toggle and display marks
	" enable git-gutter and vim-signify color support:
	let g:SignatureMarkTextHLDynamic = 1
	let g:SignatureMarkerTextHLDynamic = 1

Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}			" visualize vim undo tree
	let g:gundo_auto_preview = 0
	let g:gundo_preview_bottom = 1
	let g:gundo_width = 30

Plug 'yonchu/accelerated-smooth-scroll'				" smooth scroll on <C-d>, <C-u>, <C-f>, <C-b>
	let g:ac_smooth_scroll_du_sleep_time_msec = 5
	let g:ac_smooth_scroll_fb_sleep_time_msec = 5

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


" FINDER:
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


" LINTING:
" Plug 'scrooloose/syntastic'						" automatic syntax checking
Plug 'benekastah/neomake'							" asynchronous :make using Neovim's job-control
	autocmd! BufWritePost * Neomake


" COMPLETION:
Plug 'cohama/lexima.vim'							" provides insert mode auto-completion for quotes,parens,brackets.
Plug 'Shougo/deoplete.nvim'							" autocompletion interface
	let g:deoplete#enable_at_startup = 1
	let g:deoplete#sources= {}
	let g:deoplete#sources._ = []					" load all sources for all filetypes


" SNIPPETS:
Plug 'SirVer/ultisnips'								" compatible with deoplete, this is the snippets engine
	let g:UltiSnipsEditSplit="vertical"				" edit new snippets on a vertical split instead of the current window
	" let g:UltiSnipsNoPythonWarning = 1				" don't notify of python warnings
	" Trigger configuration:
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-j>"
	let g:UltiSnipsJumpBackwardTrigger="<c-k>"

Plug 'honza/vim-snippets'							" snippets, that are used by the completion engine


" FILETYPE:
Plug 'freitass/todo.txt-vim', {'for': 'todo'}		" for todo.txt filetypes
Plug 'pangloss/vim-javascript'
Plug 'gorodinskiy/vim-coloresque'				"  css/less/sass/html color preview for vim

Plug 'lervag/vimtex', {'for': 'tex'}
	let g:vimtex_fold_enabled = 0
	let g:vimtex_indent_enabled = 0					" deactivate automatic indents
	let g:tex_flavor = 'latex'						" always use latex filetype instead of plaintex for .tex files
	" let g:vimtex_latexmk_options="-pdflatex='xelatex --shell-escape -interaction=nonstopmode %O %S' -cd -f"
	let g:vimtex_latexmk_options="-pdflatex='xelatex --shell-escape'"
	let g:vimtex_latexmk_continuous=0
	let g:vimtex_latexmk_background=0				" TODO: until neovim has --remote, watch the builds for errors manually
	let g:vimtex_quickfix_autojump=1				" autojump to first error

Plug 'justinmk/vim-syntax-extra', {'for': 'c'}		" bison, flex, c syntax (operators, delimiters, functions..)
Plug 'vivien/vim-addon-linux-coding-style', {'for': 'c'}
" Plug 'c.vim', {'for': 'c'}						" TODO: right now conflicts with ultisnips
	" let g:C_LocalTemplateFile = $HOME.'/.config/nvim/snippets_Cvim/c-support/templates/Templates' " this allows for the templates to be versioned on .dotfiles

Plug 'hdima/python-syntax', {'for': 'python'}		" necessary, Vim default python syntax has a regex bug as of 7.4.663
	let g:python_highlight_all = 1
	" you can change between py v2 and v3 with :Python2Syntax and :Python3Syntax
Plug 'davidhalter/jedi-vim'							" python autocompletion for vim
	" use jedi-vim onmi completion with deoplete:
	autocmd FileType python setlocal omnifunc=jedi#completions
	let g:jedi#completions_enabled = 0
	let g:jedi#auto_vim_configuration = 0
	let g:jedi#smart_auto_mappings = 0
	let g:jedi#show_call_signatures = 0

Plug 'klen/python-mode'
Plug 'hynek/vim-python-pep8-indent'					" indentation behavior as in PEP8

Plug 'jamessan/vim-gnupg'							" encrypts/decrypts with gpg files that end in .gpg,.pgp or .asc. plaintext only on ram
	" let g:GPGDefaultRecipients = ["0x5702AA3A <me@viccuad.me>"]
	let g:GPGDefaultRecipients = ["0xA2591E231E251F36 <me@viccuad.me>"]
	let g:GPGUsePipes=1			" (might break the prompt) use pipes instead of vim /temp files (no writing to disk)

Plug 'Shougo/vinarise.vim', {'on': 'Vinarise'}		" hexadecimal editor

Plug 'sudar/vim-arduino-syntax', {'for': 'arduino'}
Plug 'jplaut/vim-arduino-ino', {'for': 'arduino'}	" provides ino calls (Needs inotool, picocom)
    " <Leader>ac - Compile the current sketch
    " <Leader>ad - Compile and deploy the current sketch
    " <Leader>as - Open a serial port in screen

call plug#end()
" }}}

" Filetype & languages {{{
filetype on						" enable filetype detection
filetype indent on				" enable filetype-specific indenting. can conflict with set autoindent smartindent
filetype plugin on				" enable filetype-specific plugins

" C language
let g:c_space_errors = 1
let g:c_comment_strings = 0		" dont highlight strings inside C comments

" Python language
let python_space_errors = 1
augroup python_files
	autocmd!
	autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
augroup END

" Java language
let java_space_errors = 1

" Markdown instead of modula2:
let g:markdown_fenced_languages = ['asm', 'sh', 'bash=sh', 'c', 'python', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']
augroup markdown_files
	autocmd!
	autocmd BufNewFile,BufReadPost *.md setl filetype=markdown spell wrap nolinebreak nolist formatoptions-=t
augroup END

" TXT files
augroup txt_files
	autocmd!
	autocmd BufNewFile,BufReadPost *.txt setl spell textwidth=80 wrapmargin=80
augroup END

" Mail files from mutt
augroup mail_files
	autocmd!
	autocmd FileType mail setl nonumber spell textwidth=72 wrapmargin=72
augroup END

" Latex files
let g:tex_flavor = "latex"		" default tex flavour if not specified in the file

" Help files
augroup help_files
	autocmd!
	autocmd filetype help wincmd L	" always open help files in vertical splits
augroup end
" }}}

" Spaces & Tabs {{{
set tabstop=4						" number of visual spaces per TAB
set autoindent smartindent			" copy indent from current line when starting a new line, and smart indent automatically inserts one level of indentation in some cases.
set listchars=tab:\╶\─,trail:·,eol:↵,extends:→,precedes:←	" show tabs, eol and trailing whitespace when showing separators
set list							" show listchars
" }}}

" Line wrap {{{
set wrap							" soft wrap long lines, visually, instead of changing the file
set linebreak						" wrap long lines at characters in 'breakat' rather than at the last character that fits
" if has('linebreak')
" 	set breakindent
" 	let &showbreak = '↳ '
" 	set cpo+=n
" end
set breakindent						" wrapped lines are visually indented
let &colorcolumn=join(range(73,220),",") " colors columns past 80
set textwidth=80
set formatoptions=tcrqljw 			" t autowrap to textwidth
									" c autowrap comments to textwidth
									" r autoinsert comment leader with <enter>
									" q allow formatting of comments with gq
									" l long lines are not broken in insert mode: When a line was longer than 'textwidth' when the insert command started, Vim does not automatically format it.
									" 1 don't break a line after a one-letter word. It's broken before it instead (if possible).
									" j where it makes sense, remove a comment leader when joining lines
									" a automatic formatting of paragraphs
									" w trailing white space indicates a paragraph continues in the next line
" }}}

" Look and feel {{{
set title							" change terminal title
syntax on							" enable syntax processing
"set virtualedit=all				" move the cursor everywhere
set synmaxcol=2048					" prevents huge slow downs from syntax highlighting
set number							" show line numbers
"set relativenumber					" show relative numbers. can be on at the same time that number
set cursorline						" highlight current line
set conceallevel=2					" display unicode characters instead of they plaintext counterparts (epsilon, lambda, etc)
" don't change colors of concealed characters:
highlight Conceal ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
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
set noerrorbells					" no sound bells please
set visualbell t_vb=				" no flash screen for the visual bell
if has('autocmd')
	autocmd GUIEnter * set visualbell t_vb= 	"redo t_vb= for gui so it takes place
endif
set timeout							" time out on key codes
set ttimeoutlen=20					" the time in milliseconds that is waited for a key code or mapped key sequence to complete
set fillchars+=vert:│				" complete utf fill separator

if has("gui_running")
	set guiheadroom=0				" vim padding: fix it in ~/.gtkrc-2.0

	colorscheme base16-monokai
	set background=dark 			" this shouldn't be necessary, but colorschemes bad behave putting background before hi Normal
	highlight ColorColumn ctermbg=0 guibg=#272822 			" colorcolumn for base16-monokai
	let g:airline_theme= "badwolf"
	function! AirlineThemePatch(palette)
		let a:palette.normal.airline_c = [ '#8cffba' , '#272822' , 121 , 233 ]
		let a:palette.insert.airline_c = [ '#0a9dff' , '#272822' , 39  , 233 ]
	endfunction

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
	colorscheme badfox
endif

" netrw:
set isfname+=32									" to open files with spaces
let g:netrw_liststyle=3							" default to tree view (you can rotate netrw views with i)
" Netrw remote transfers
let g:netrw_altv          = 1					" change from left splitting to right splitting
let g:netrw_special_syntax= 1					" highlight certain files (*.bak, *.zip..)

call matchadd('ErrorMsg', '[^\d0-\d127]')		" highlights weird unicode chars that try to pass as normal. eg:
												" ⅰnt ⅿain() { рrintf ("Ηello troll!\n"); }
" }}}

" Persistence , Backup and Swap files {{{
set viminfo+=% "save and restore the buffer list expected if vim is started with a file name argument
" set viminfo+=n$HOME/.nvim/.nviminfo
" delete the empty buffer that appears on startup:
"autocmd VimEnter * nested if  bufname('')==''  &&  line('$') == 1 &&  col('$')==1 &&  !&modified | bd % | endif

set hidden							" don't mark buffers as abandoned if hidden
set history=1000
set undofile						" save undo's after file closes
" set undodir=$HOME/.nvim/undo			" where to save undo histories
set undolevels=1000					" how many undos
set undoreload=10000				" number of lines to save for undo
" }}}

" Backup and Swap files {{{
" set backupdir=$HOME/.nvim/backup		" for backup files
" set directory=$HOME/.nvim/backup		" for .swp files
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
let maplocalleader = "\\"

nnoremap <leader><Tab>   :bnext<CR>
nnoremap <leader><S-Tab> :bprevious<CR>
nnoremap <leader>l   :bnext<CR>
nnoremap <leader>h :bprevious<CR>

" remap jk to escape:  You'll never type it anyway, so it's great!
inoremap jk <Esc>

" use hjkl-movement between rows when soft wrapping:
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" include the default behaviour by doing reverse mappings so you can move linewise with gj and gk:
nnoremap gj j
nnoremap gk k

" keep the cursor in place when joining lines with J (by dropping a mark and returning there):
nnoremap J mzJ`z

" Y yanks lines from the cursor to the end of the line: (as said in :h Y)
map Y y$

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
" remove trailing whitespaces:
map <F1> :%s/\s\+$//<CR>

" toggle spell checking:
map <F2> :setlocal spell!<CR>

" cycle between Wordy dictionaries:
map <F3> :NextWordy<CR>

" close buffer:
map <silent> <F4> <Esc>:bd<CR>

" open urls, files, etc. example: http://google.com:
noremap <F6> :!xdg-open <cfile><CR><CR>

" previous c error (c.vim plugin):
map  <F7> <Esc>:cprevious<CR>

" next c error (c.vim plugin):
map  <F8> <Esc>:cnext<CR>

" compile & link c code: (alt+<F9> write + compile, ctrl+<F9> compile + run) (c.vim plugin)
"<F9>

" }}}

" Folding {{{
set foldmethod=marker
set foldlevel=99
set foldnestmax=10			" max 10 depth
set nofoldenable			" don't fold files by default on open
set foldlevelstart=1		" start with fold level of 1
" }}}

" Launch {{{
set encoding=utf-8
set autowrite								" automatically save before commands like :next and :make
set autochdir								" automatically cd into the directory that the file is in (this will break plugins if activated!!!)
"autocmd BufEnter * silent! lcd %:p:h		" automatically cd into the dir of the file. this breaks less
set autoread								" watch for file changes
set nomodeline								" dont make vim check beginning and ending lines of files for options. HUGE VULNERABILITY
" jump to the last position when reopening a file:
if has("autocmd")
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" }}}

" vim:foldmethod=marker:foldlevel=0
