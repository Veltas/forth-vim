" forth.vim - vim syntax file for Forth
" Copyright 2020-2024 (C) - Christopher Leonard, MIT Licence
" https://github.com/veltas/forth-vim

" Copy to e.g. ~/.vim/syntax/ or /usr/share/vim/vim*/syntax/ to enable

if exists("b:current_syntax")
  finish
endif

syntax case ignore

setlocal iskeyword=33-255

syn keyword forthLangConstant TRUE FALSE
syn match forthLangNumber "\<-\?\d\+\.\?\>"
syn match forthLangNumber "\<-\?0\x\+\.\?\>"
syn match forthLangNumber "\<$-\?\x\+\.\?\>"
syn match forthLangNumber "\<#-\?\d\+\.\?\>"
syn match forthLangNumber "\<%-\?[01]\+\.\?\>"
syn match forthLangNumber "\<'.'\>"
syn match forthLangFloat "\<[+-]\?\d\+\(\.\d*\)\?E[+-]\?\d*\>"

syn keyword forthLangOther :NONAME ; DOES> ;CODE NEXT LITERAL 2LITERAL
syn keyword forthLangOther END-STRUCTURE FLITERAL IMMEDIATE RESTRICT SLITERAL
syn keyword forthLangOther END-PACKAGE PUBLIC PRIVATE

syn match forthLangParsedWord contained "\<\S\+\zs\s\+\S\+\ze"
syn match forthLangOther "\<\(\S*:\|MARKER\|'\|TO\|IS\|CREATE\|INCLUDE\|POSTPONE\|+FIELD\|ACTION-OF\|BEGIN-STRUCTURE\|DEFER\|FORGET\|REQUIRE\|CODE\|F\?VALUE\|[2F]\?CONSTANT\|[2F]\?VARIABLE\|PACKAGE\)\(\s\+\S\+\|\s*$\)" contains=forthLangParsedWord

syn match forthLangParsedWords contained "\<\S\+\zs\s\+\S\+\s\+\S\+\ze"
syn match forthLangOther "\<SYNONYM\(\s\+\S\+\|\s*$\)\{2}" contains=forthLangParsedWords

syn keyword forthLangConditional IF ELSE THEN CASE OF ENDOF ENDCASE CATCH AHEAD

syn keyword forthLangStatement EXIT RECURSE MYSELF QUIT BYE THROW ABORT
syn keyword forthLangStatementX EVALUATE EXECUTE
syn keyword forthLangStatementX LEAVE LOAD THRU INCLUDE-FILE INCLUDED REQUIRED
"hi def link forthLangStatementX forthLangStatement

syn keyword forthLangRepeat ?DO DO FOR LOOP +LOOP BEGIN AGAIN UNTIL WHILE REPEAT

syn match forthLangBrackets "\<\[[^[:space:]\]]*]\?\>"
syn match forthLangBrackets "\<[[\]]\>"
syn match forthLangBrackets "\<\[CHAR\]\s\+\S\+" contains=forthLangParsedWord

syn keyword forthLangTodo contained TODO FIXME XXX NOTE
syn region forthLangComments start=/\<(\>/ end=/)/ contains=forthLangTodo
syn match forthLangComments "\<\\.*" contains=forthLangTodo

syn match forthLangLocalComments contained "\<\zs--.\{-}\ze\(}\|$\)"
syn match forthLangLocalComments2 contained "\<\zs--.\{-}\ze\(:}\|$\)"
syn match forthLangLocals "\<LOCALS|\>.\{-}\(|\|$\)"
syn match forthLangLocals "\<{\>.\{-}\(}\|$\)" contains=forthLangLocalComments
syn match forthLangLocals "\<{:\>.\{-}\(:}\|$\)" contains=forthLangLocalComments2

syn match forthLangString "\<\S*[^[:space:]\\]\"\(\s[^"]*\(\"\|$\)\|$\)"
syn match forthLangString "\<\S*\\\"\(\s\(\\.\|[^\"]\)*\(\"\|$\)\|$\)"
syn match forthLangString "\<\S\+(\(\s[^)]*\()\|$\)\|$\)"

let b:current_syntax = "forth"

hi def link forthLangTodo Todo
hi def link forthLangConstant Constant
hi def link forthLangLocalComments forthLangComments
hi def link forthLangLocalComments2 forthLangComments
hi def link forthLangString String
hi def link forthLangComments Comment
hi def link forthLangNumber Number
hi def link forthLangFloat Float
hi def link forthLangConditional Conditional
hi def link forthLangStatement Statement
hi def link forthLangOther Structure
hi def link forthLangLocals Special
hi def link forthLangRepeat Repeat
hi def link forthLangBrackets Macro
