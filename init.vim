function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
  call minpac#add('bfrg/vim-cpp-modern')
  call minpac#add('sbdchd/neoformat')
  call minpac#add('fatih/vim-go')
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('sainnhe/gruvbox-material')
  call minpac#add('windwp/nvim-autopairs')
  call minpac#add('preservim/nerdtree')
  call minpac#add('ryanoasis/vim-devicons')
  call minpac#add('ctrlpvim/ctrlp.vim')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('Xuyuanp/nerdtree-git-plugin')
  call minpac#add('Shougo/deoplete.nvim')
endfunction

" Plugin settings here.
set nu

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" custom setting for clangformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

if has('termguicolors')
set termguicolors
endif
set background=dark
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_disable_italic_comment = 1
colorscheme gruvbox-material
let g:lightline.colorscheme = 'gruvbox_material'

" set cindent
" set cino=i0,+2
autocmd FileType cpp setlocal noexpandtab shiftwidth=4 tabstop=4
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4

lua require('nvim-autopairs').setup{}

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()
