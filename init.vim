"""Load and install Plugins"""
"Test
call plug#begin()
	Plug 'nvim-treesitter/nvim-treesitter'
	Plug 'nvim-treesitter/playground'
	""""Plug 'kristijanhusak/vim-dadbod-ui'
	""""Plug 'habamax/vim-godot'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'stevearc/vim-arduino'
	Plug 'wfxr/minimap.vim'
	Plug 'pacha/vem-tabline'
	Plug 'honza/vim-snippets'
	""" Plugins for writing
	""""Plug 'dpelle/vim-LanguageTool'
	""""Plug 'lervag/vimtex'
	""""""flutter
	""""Plug 'dart-lang/dart-vim-plugin'
	""""Plug 'thosakwe/vim-flutter'
	""""Plug 'natebosch/vim-lsc'
	""""Plug 'natebosch/vim-lsc-dart'
	""cmp
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/vim-vsnip-integ'
	Plug 'hrsh7th/nvim-cmp'
	""Telescope
	Plug 'princejoogie/dir-telescope.nvim'
	Plug 'BurntSushi/ripgrep'
	Plug 'sharkdp/fd'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'cljoly/telescope-repo.nvim'
	"Neorg test
	Plug 'nvim-neorg/neorg'
	"Git
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	"""QOF
	"openclose brackets
	Plug 'Raimondi/delimitMate'
	"show in discord
	Plug 'vimsence/vimsence'
	"Allows to suda write/read
	Plug 'lambdalisue/suda.vim'
	"Something like light selected block code
	Plug 'junegunn/limelight.vim'
	"focus mode
	Plug 'junegunn/goyo.vim'
	"todo comments
	Plug 'folke/trouble.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'folke/todo-comments.nvim'
	"Database
	Plug 'tpope/vim-dadbod'
	Plug 'kristijanhusak/vim-dadbod-completion'
	Plug 'kristijanhusak/vim-dadbod-ui'
	"Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
	
	"cellular
	Plug 'Eandrju/cellular-automaton.nvim'
call plug#end()

"""Plugin Options"""
""Vimsence""
let g:vimsence_client_id = '439476230543245312'
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Working on: {}'
let g:vimsence_file_explorer_text = 'In NERDTree'
let g:vimsence_file_explorer_details = 'Looking for files'
""Nerd Tree"
"let NERDTreeShowLineNumbers=1
"let NERDTreeMinimalUI=1
"let NERDTreeShowHidden=1
"autocmd VimEnter * NERDTree
"autocmd VimEnter * NERDTree /home/hanckedd/archives/work
"let g:NERDTreeFileExtensionHighlightFullName = 1
"let g:NERDTreeExactMatchHighlightFullName = 1
"let g:NERDTreePatternMatchHighlightFullName = 1
"let g:NERDTreeGitStatusUseNerdFonts = 1
"set updatetime=100
""Minimap""
let g:minimap_width = 10
let g:minimap_auto_start_win_enter = 1
let g:minimap_highlight_range = 1
let g:minimap_git_colors = 1
"IconsPadding"
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
"gitgutter"
let g:gitgutter_highlight_linenrs = 1
"LanguageTool"
let g:languagetool_cmd='java -jar $HOME/fractalis/programs/software/LanguageTool-5.7/languagetool-commandline.jar'
set spelllang=es
"VimTex"
let g:vimtex_view_method = 'zathura'
"""Custom Funcions"""
"Meow"
function Meow()
	echo "Meow!"
endfunction

"Distraction free mode"
let g:focused = 0
function! Focus()
	let g:focused = 1 - g:focused
	
	if g:focused == 1
		:Goyo 80
		:Limelight
		
		set nocursorline
		set noshowmode
		set relativenumber
		set number
		
		nmap G Gzz
		noremap k jzz
		noremap l kzz
		
		:silent !xdotool key --repeat 2 Ctrl+plus
	else
		:Goyo!
		:Limelight!
		set cursorline
		set showmode
		
		noremap k j
		noremap l k
		unmap G
		
		:silent !xdotool key --repeat 2 Ctrl+minus
		:silent !xdotool key Ctrl+equal
	endif
endfunction
let g:writing = 0
function! Writing()
	let g:focused = 1 - g:focused
	
	if g:focused == 1
		:Goyo 80
		:Limelight
		
		set nocursorline
		set noshowmode
		nmap G Gzz
		noremap k jzz
		noremap l kzz
		
		silent !bash plusfont.sh
	else
		:Goyo!
		:Limelight!
		
		set cursorline
		set showmode
		
		noremap k j
		noremap l k
		unmap G
		
		:silent !bash minusfont.sh
	endif
endfunction

function Compile()
	let current_extension = expand('%:e')
	let current_path = expand('%:p:h')
	let current_file = expand('%:t')
	:w
	:let file_d=expand('%:p')
	:let b:ext_type=expand('%:e')
	:let line=getline(1)
	if &filetype ==# 'python'
		if line ==# '# i'
			:make
			:echo 'Interactive Mode'
			:vs|term python -i %
		elseif line ==# '#flask'
			:vs|term export FLASK_APP=main.py ; export FLASK_ENV=development ; flask run
		elseif line ==# '#noterm'
			:!python %
		else
			"":echo 'Normal mode'
			:vs|:term 'make'
		endif
	elseif &filetype ==# 'c' || &filetype ==# 'cpp'
		if line ==# '//nr'
			:e ../main.cpp
			:make
			:make cleanO
			:execute 'e' fnameescape(file_d)
			:vs|:term '../main'
		elseif line ==# '//nr 1'
			:e ../../main.cpp
			:make
			:make cleanO
			:execute 'e' fnameescape(file_d)
			:vs|:term '../../main'
		elseif line ==# '//avr'
			:make
		elseif line ==# '//win'
			:make
			:vs|:term echo 'PROGRAM COMPILED'; echo 'CMD STARTED'; echo ''; WINEDEBUG=-all wine cmd.exe /c main.exe
		else
			:make
			:vs|:term ./main
		endif
	elseif &filetype ==# 'javascript'
		if line ==# '//nodejs'
			:sp|:resize 15|:term node %
		elseif line ==# '//nodejs dm'
			:sp|:resize 15|:term npm start
		else
			:vs|:term node %
		endif
	elseif &filetype ==# 'tex'
		:silent !latex %
		:silent !dvipdf main.dvi
		if line ==# '%z'
			:silent !zathura *.pdf & disown
		endif
	elseif &filetype ==# 'html'
		:!qutebrowser % &
	elseif current_extension ==# 'java'
		let makefile_dir = findfile('makefile', expand('%:p:h') . ';')
		if makefile_dir == ''
			echo "No se encontro el makefile"
		else
			let makefile_path = fnamemodify(makefile_dir, ':h')
			execute "cd" . makefile_path
			make
			let out_dir = makefile_path . '/out'
			let java_files = systemlist('find ' . shellescape(out_dir) . ' -name "*.class" -printf "%P\n"')
	
			if len(java_files) == 0
				echo "No se encontraron clases compiladas en el directorio /out"
			else
				echo "Clases disponibles en /out con método main:"
				let class_count = 0
				let main_classes = []
	
				for java_file in java_files
					let class_name = fnamemodify(java_file, ':r')
					let javap_output = system('javap -public -classpath ' . shellescape(out_dir) . ' ' . class_name)
					
					if javap_output =~ 'public static void main('
						let class_count += 1
						call add(main_classes, class_name)
						echo '[' . class_count . '] ' . class_name
					endif
				endfor
				
				if len(main_classes) == 0
					echo "No se encontraron clases con método main en el directorio /out"
				else
					let choice = input("Ingrese el número de la clase a ejecutar: ")
					if choice >= 1 && choice <= len(main_classes)
						let selected_class = main_classes[choice - 1]
						vs
						execute 'term java -cp ' . out_dir . ' ' . selected_class
					else
						echo "Selección inválida."
					endif
				endif
			endif
		endif
	elseif &filetype ==# 'r'
		if line ==# '#R'
			:w
			:sp|term R --no-save < %
		else
			:w
			:sp|term Rscript %
		endif
	elseif &filetype ==# 'pdf'
		:silent !zathura % & disown
	elseif &filetype ==# 'haskell'
		:sp|term runghc %
	elseif &filetype ==# 'asm'
		:make
		:vs|term ./main
	elseif &filetype ==# 'ruby'
		:vs|term ruby %
	elseif b:ext_type ==# 'gd'
		:w|GodotRun ./scene.tscn
	elseif b:ext_type ==# 'carbon'
		:vs|term bazel run //explorer -- ./% 
	elseif b:ext_type ==# 'v'
		:vs|term v run % 
	elseif b:ext_type ==# 'nl'
		:vs|term ../main
	elseif &filetype ==# 'lua'
		:vs|:term 'make'
	endif
	"":NERDTreeRefreshRoot
	:normal a
endfunction

"""Basic configs"""
let g:loaded_perl_provider = 0
set list lcs=tab:\│\ ,space:.
set fillchars=eob:\ ,fold:\ ,vert:\│
set guicursor=a:blinkon100
set autochdir
set splitright              " new panes to de right
set splitbelow              " new panes go down
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search
if &filetype ==# 'python'
	set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
	set expandtab               " converts tabs to white space
endif
set tabstop=4               " number of columns occupied by a tab 
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set relativenumber
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
"set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard+=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set formatoptions-=cro
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"My functions"
nnoremap <F10> :call Focus()<CR>
nnoremap <F9> :call Writing()<CR>
"vim tree"
nnoremap <C-l><C-k> :NvimTreeToggle<CR>
"let NERDTreeMapActivateNode='<space>'
"MiniMap"
nmap <C-l><C-m> :MinimapToggle<CR>
"Telescope"
nmap <C-l><C-o> :Telescope<CR>
"vsnip"
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

set termguicolors
set guicursor+=i:ver100-iCursor
set guicursor+=i:blinkon1
"""Compilers"""
imap <C-b> <C-o>:call Compile()"<CR>
nmap <C-b> :call Compile()<CR>

"""Auto completion"""
set completeopt=menu,menuone,noselect

lua require('init')

let b:next_type=expand('%:e')
if b:next_type ==# 'carbon'
	set syntax=cpp
endif


"Notes
:let g:notes_suffix = '.txt'
:set conceallevel=2
