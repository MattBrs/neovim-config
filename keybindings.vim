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

" faster movement through text
nmap <Space>hw :HopWord<CR>
nmap <Space>hl :HopLine<CR>
nmap <Space>ha :HopAnywhere<CR>
nmap <Space>ca :lua vim.lsp.buf.code_action()<CR>
nmap <Space>ck :lua vim.lsp.buf.hover()<CR>

nmap <Space>cf :Format<CR>

nmap <Space>ut :UndotreeToggle<CR>

nmap <Space>s :w<CR>:Format<CR>:w<CR>

nmap <Space>gg :LazyGit<CR>

" debugger
nmap <Space>dgt :lua require'dapui'.toggle()<CR>
nmap <Space>dc :lua require'dap'.continue()<CR>
nmap <Space>dbt :lua require'dap'.toggle_breakpoint()<CR>
nmap <Space>dsi :lua require'dap'.step_into()<CR>
nmap <Space>dso :lua require'dap'.step_over()<CR>

" terminal
nmap <Space>tt :ToggleTerm<CR>
tmap <Esc> <C-\><C-n>


xnoremap p P
