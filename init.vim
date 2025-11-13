" WSL Clipboard Integration
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
  augroup WSLYank
    autocmd!
      autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
  augroup END
end

" Copy current file's directory path to Windows clipboard in WSL
noremap /dir :call system('/mnt/c/Windows/System32/clip.exe', expand('%:p:h')) \| echo 'Directory path copied: ' . expand('%:p:h')<CR>

" Copy current file's name to Windows clipboard in WSL
noremap /filename :call system('/mnt/c/Windows/System32/clip.exe', expand('%:t')) \| echo 'Filename copied: ' . expand('%:t')<CR>

" Visual mode clipboard mappings
vnoremap <C-c> "+y
vnoremap <C-v> "+p

" Pressing ESC also clears search highlighting In Insert mode
inoremap <Esc> <Esc>:nohlsearch<CR>

" Basic Neovim settings
set hlsearch
set number
set expandtab
set tabstop=4
set belloff=all
set noswapfile

" Filetype-specific indentation settings
augroup filetype_indent
  autocmd FileType html,css,javascript setlocal tabstop=2
augroup END

" Normal mode non-recursive map
nnoremap e $
nnoremap q ^

" Disable default left/right/up/down movements in normal mode
nnoremap <h> <Nop>
nnoremap <j> <Nop>
nnoremap <k> <Nop>
nnoremap <l> <Nop>

" Highlight trailing whitespace
match ErrorMsg /\s\+$/

" Move 4 characters/lines in Visual mode with Shift + arrow keys
vnoremap <S-Left> 4h
vnoremap <S-Right> 4l
vnoremap <S-Up> 4k
vnoremap <S-Down> 4j

" Highlight Groups and Their Colors
highlight EndOfBuffer ctermfg=21
highlight Visual ctermfg=8 ctermbg=1
highlight VisualNOS ctermfg=8 ctermbg=1
