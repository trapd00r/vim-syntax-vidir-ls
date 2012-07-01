"   What: ls colors for vidir file listings
"  Where: $VIMRUNTIME/syntax/vidir-ls.vim
" Author: Magnus Woldrich <m@japh.se>
" Update: 2012-07-01 22:07:28
"    URL: https://github.com/trapd00r/vim-syntax-vidir-ls
"         http://devel.japh.se/vim-syntax-vidir-ls/
"         http://devel.japh.se/vidir
"
" This is supposed to be used with vidir [0]:
"   export VIDIR_EDITOR_ARGS='-c :set nolist | :set ft=vidir-ls'
"
" The colors are generated from the LS_COLORS environment variable
" automatically. Please see the LS_COLORS repository [1] for a set of good
" colors.
"
" [0]: https://github.com/trapd00r/vidir
" [1]: https://github.com/trapd00r/LS_COLORS


if exists('b:current_syntax')
  finish
endif

function! <SID>MakeStyle(ls_color_style)
  let l:style_settings = split(a:ls_color_style, ';')

  let l:style_string = ''

  while len(l:style_settings) >= 3
    let [l:where, l:flag, l:clr; l:style_settings] = l:style_settings

    if l:flag == 5
      if l:where == 38
        let l:style_string .= ' ctermfg='.l:clr
      elseif l:where == 48
        let l:style_string .= ' ctermbg='.l:clr
      endif
    endif
  endwhile

  if len(l:style_settings) == 1
    let l:style = l:style_settings[0]

    if l:style == '0' || l:style == '00'
      let l:style_string .= ' cterm=none'
    elseif l:style == '1' || l:style == '01'
      let l:style_string .= ' cterm=bold'
    elseif l:style == '4' || l:style == '04'
      let l:style_string .= ' cterm=underline'
    elseif l:style == '7' || l:style == '07'
      let l:style_string .= ' cterm=reverse'
    endif
  end

  return l:style_string
endfunction

function! <SID>MakeSyntax(ls_color)
  let [l:glob, l:colors] = split(a:ls_color, '=')

  if l:glob =~ '^\*\..*'
    let l:regex = '\v/\zs.+[.]'
    let l:ext = substitute(l:glob, '^\*[.]', '', '')
    let l:regex .= substitute(l:ext, '[.~]', '[&]', 'g') . '$'
    let l:ext = substitute(l:ext, '[.~]', '_', 'g')
  elseif l:glob == 'di'
    let l:ext = 'DI'
    let l:regex = '\v.+[/].+[/]$'
  else
    return
  endif

  execute 'silent! hi ls_' . l:ext . <SID>MakeStyle(l:colors)
  execute 'silent! syn match ls_' . l:ext . ' display "' . l:regex . '"'
endfunction

let s:ls_colors = split($LS_COLORS, ':')
let s:ls_colors = map(s:ls_colors, '<SID>MakeSyntax(v:val)')

let b:current_syntax = 'vidir-ls'
