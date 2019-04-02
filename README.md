use LS\_COLORS in your [vidir](https://github.com/trapd00r/vidir)
session inside vim. It can also be used in other places where you list
filenames in your vim session, for example while editing a perl
MANIFEST file.


![img](/extra/vidir-ls.png)

Install to ``$VIMRUNTIME/syntax/vidir-ls.vim``

    export VIDIR_EDITOR_ARGS='-c :set nolist | :set ft=vidir-ls'


The colors are generated from the ``LS_COLORS`` environment variable
automatically. Please see the [LS\_COLORS][1] repository for a set of good
colors.

[0]: https://github.com/trapd00r/vidir
[1]: https://github.com/trapd00r/LS_COLORS
