" find file in project
nmap <Space>ff :FzfLua files<CR>

" find file in opened buffers
nmap <Space>fb :FzfLua buffers<CR>

" find text in project
nmap <Space>ftp :FzfLua live_grep<CR>

" find text in file
nmap <Space>ftf :FzfLua lgrep_curbuf

" file manager (add, delete, navigate files)
nmap <Space>fm :Dirbuf<CR>

" faster movement through text
nmap <Space>hw :HopWord<CR>
nmap <Space>hl :HopLine<CR>
nmap <Space>ha :HopAnywhere<CR>
nmap <Space>ca :lua vim.lsp.buf.code_action()<CR>
nmap <Space>cf :Format<CR>
