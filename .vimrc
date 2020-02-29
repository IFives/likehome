"vim-plug is need
  
set noshowmode
colorscheme xcodedarkhc

"All my pluggins
call plug#begin()

Plug 'tpope/vim-sensible' "(:)help
Plug 'arzg/vim-colors-xcode' "color scheme
Plug 'dense-analysis/ale' "Check syntax in the code (:)ALEToggle
Plug 'itchyny/lightline.vim' "Colored status line

call plug#end()
