function! db#adapter#duckdb#canonicalize(url) abort
  return db#url#canonicalize_file(a:url)
endfunction

function! db#adapter#duckdb#test_file(file) abort
  " if getfsize(a:file) >= 100 && readfile(a:file, 1)[0] =~# '^Sqlite format 3\n'
  "   return 1
  " endif
  " TODO: 👆
  return 1
endfunction

function! s:path(url) abort
  let path = db#url#file_path(a:url)
  if path =~# '^[\/]\=$'
    if !exists('s:session')
      let s:session = tempname() . '.duckdb'
    endif
    let path = s:session
  endif
  return path
endfunction

function! db#adapter#duckdb#dbext(url) abort
  return {'dbname': s:path(a:url)}
endfunction

function! db#adapter#duckdb#command(url) abort
  return ['duckdb', s:path(a:url)]
endfunction

function! db#adapter#duckdb#interactive(url) abort
  return db#adapter#duckdb#command(a:url) + ['-column', '-header']
endfunction

function! db#adapter#duckdb#tables(url) abort
  return split(join(db#systemlist(db#adapter#duckdb#command(a:url) + ['-noheader', '.tables'])))
endfunction

function! db#adapter#duckdb#massage(input) abort
  return a:input . "\n;"
endfunction
