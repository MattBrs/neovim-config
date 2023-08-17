" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" set keybindings for coc completition
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" go forward with tab in list of completition
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"

" go back with tab in list of completition
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" set main keybindings

" find file in project
nmap <Space>ff :FzfLua files<CR>

" find text in project
nmap <Space>ftp :FzfLua live_grep<CR>

" file manager (add, delete, navigate files)
nmap <Space>fm :Dirbuf<CR>


