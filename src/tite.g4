grammar tite;

program : declarations;
declarations : declaration (delim declaration)* ;
declaration : tag? IDENTIFIER ':' (type | type? (assignment | function)) ;
tag : '$' | '.' | '#' ;
type : IDENTIFIER | expression | return? '(' declarations? ')' ;
return : IDENTIFIER ;
expressions : expression (delim expression)* ;
expression : IDENTIFIER | constant | execution | access | structure | hashmap | '(' production ')' ;
assignment : '=' expression ;
function : '=>' LF? (expression | production) ;
production : expression ('*'|'/'|'**'|'+') expression ;
execution : IDENTIFIER arguments;
access: IDENTIFIER '.' expression ;
sentence : (declaration | expression) ;
sequence : LF? sentence (delim sentence)* LF? ; 
arguments : '(' sequence? ')' ;
structure : '{' sequence? '}' ;
hashmap : '[' sequence? ']' ;
constant : INT | FLOAT | STRING;
delim: (LF | ',') LF? ;
IDENTIFIER : [a-zA-Z_][a-zA-Z_0-9]* ;
INT : [0-9]+ ;
FLOAT : [0-9]+ '.' [0-9]* ;
STRING : '"' .*? '"' ;
WS : [ ;\t]+ -> skip ;
LF : [\r\n]+ ;