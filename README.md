*   What: ls colors for vidir file listings
*  Where: $VIMRUNTIME/syntax/vidir-ls.vim
* Author: Magnus Woldrich <m@japh.se>
*    URL: http://github.com/trapd00r/vim-syntax-vidir-ls

This is supposed to be used with [vidir][0]:

    export VIDIR_EDITOR_ARGS='-c :set nolist | :set ft=vidir-ls'

![vidir-ls](http://devel.japh.se/vim-syntax-vidir-ls/vidir-ls.png)

The colors are generated from the ``LS_COLORS`` environment variable
automatically. Please see the [LS\_COLORS][1] repository for a set of good
colors.

[0]: https://github.com/trapd00r/vidir
[1]: https://github.com/trapd00r/LS_COLORS
