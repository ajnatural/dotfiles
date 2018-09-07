" let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1
let g:ale_completion_enabled = 1
let g:ale_use_global_executables = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_open_list = 1

let g:ale_linters = {
\   'python': ['pyls'],
\   'javascript': ['flow', 'prettier'],
\}

let g:ale_fixers = {
\   'python': ['trim_whitespace', 'yapf'],
\   'javascript': ['prettier'],
\}

