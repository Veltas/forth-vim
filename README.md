veltas/forth-vim
================

This is a less-visually-loud vim syntax script for Forth source code.

Try it by copying `forth.vim` to your `~/.vim/syntax/`.

Standard words that immediately parse the next word correctly prevent the next
word being styled if it's a comment word, string word, etc.

I welcome any PR's to refactor my poor vimscript, or to add other typical Forth
words to conform with the 'scheme' I have.
