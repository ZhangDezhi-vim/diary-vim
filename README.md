diary.vim
============

`diary.vim` creates a diary window you can use within vim.  It is useful
in its own right as a diary-inside-vim.  It also provides hooks to customise
its behaviour, making it a good basis for writing new plugins which require
diary functionality (see `:help diary-hooks` for more information).

Installation
------------

You can install `diary.vim` in the usual way, by copying the contents of the
`plugin`, `autoload` and `doc` directories into the equivalent directories
inside `.vim`.

Alternatively, if you manage your plugins using [pathogen.vim][1], you can
simply clone into the `bundle` directory:

    cd ~/.vim/bundle
    git clone git://github.com/mattn/diary-vim

Or, using submodules:

    cd ~/.vim
    git submodule add git://github.com/mattn/diary-vim bundle/diary-vim

Usage
-----

Bring up a diary based on today's date in a vertically split window:

    :Diary

Bring up a diary showing November, 1991 (The month Vim was first released):

    :Diary 1991 11

The above diarys can alternatively be displayed in a horizontally split
window:

    :DiaryH

Bring up a full-screen:

    :DiaryT

Fast mappings are provided:

* <kbd>&lt;LocalLeader&gt;cal</kbd>: Vertically-split diary
* <kbd>&lt;LocalLeader&gt;caL</kbd>: Horizontally-split diary

For full documentation, install the plugin and run `:help diary` from within
Vim.

[1]: https://github.com/tpope/vim-pathogen
