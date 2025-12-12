" find file in project
nmap <Space>ff :FzfLua git_files<CR>

nmap <Space>fp :FzfLua files<CR>


" find file in opened buffers
nmap <Space>fb :FzfLua buffers<CR>

" find text in project
nmap <Space>ftp :FzfLua live_grep<CR>

" find text in file
nmap <Space>ftf :FzfLua lgrep_curbuf

" file manager (add, delete, navigate files)
nmap <Space>fm :Dirbuf<CR>

nmap <Space>ca :lua vim.lsp.buf.code_action()<CR>
nmap <Space>ck :lua vim.lsp.buf.hover()<CR>


nmap <Space>s :w<CR>:w<CR>

nmap <Space>gg :LazyGit<CR>

nmap <Space>fmtc :!/usr/bin/clang-format -i %:p<CR>

xnoremap y "+y
xnoremap p "+p

"xnoremap p P





