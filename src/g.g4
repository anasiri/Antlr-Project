grammar g;

startRule :importDeclaration+ mainPart;
//startRule: ImportIden+ mainPart;
importDeclaration : 'import'  importIdentifier ';' ;

mainPart: '{' classDeclaration* '}';

classDeclaration: classDef '\n<\n' statement '\n>';

statement: (variableDecleration|functionDecleration)*;

functionDecleration:'Function' functionIdentifier '(' functionInputDecleration* ')' '\n<\n' functionCode '\n>';

functionCode:(variableDecleration|ifStatement|forStatement|whileStatement|switchCaseStatement)*;

ifStatement:'if' '('conditionalExpressions')';

conditionalExpressions
    :
    conditionalExpression?(logicalOperators conditionalExpression|'!'conditionalExpression)*;
conditionalExpression
	: expression conditionalOperators expression;
forStatement:'z';

whileStatement:'d';

switchCaseStatement:'c';
varTypes:intDecleration|floatDecleration|constantsDecleration;
variableDecleration:intVar|floatVar|constantsVar;

functionInputDecleration:(varTypes identifier)(','varTypes identifier)*;



intVar: (intDecleration intIdentifier (',' intIdentifier |'=' intVal |';')*);
floatVar:(floatDecleration floatIdentifier (',' floatIdentifier |'=' floatVal |';')*);
constantsVar:(constantsDecleration constantsIdentifier (',' constantsIdentifier |'='constantsVal |';')*);

intIdentifier:identifier;
floatIdentifier:identifier;
constantsIdentifier:identifier;


intDecleration: IntType;
floatDecleration:FloatType;
constantsDecleration:ConstantsType;

expression:(ID|Numbers|ConstantsVal|FloatingNumbers)+;

logicalOperators:
    '||'|
    '&&'|
    '!';

conditionalOperators:
    '=='|
    '!='|
    '>'|
    '<'|
    '<='
    '>=';

VarTypes:'int'|'flaot'|'constants';
IntType: 'int ';
FloatType: 'float ';
ConstantsType: 'constants ';

intVal :Numbers;
floatVal:FloatingNumbers;
constantsVal :ConstantsVal;

Numbers:Digits+;
FloatingNumbers:Digits+('f'|('.'Digits+)?('f'?));
ConstantsVal:'true'|'false'|'null'|'ioat';


classDef: 'class' claseIdentifier ':' ;
claseIdentifier :identifier;
importIdentifier :identifier;
functionIdentifier :identifier;
identifier:ID;


ID:Letters+(Letters|Digits)+;


Letters: 'a'..'z'|'A'..'Z';
Digits: '1'..'9';

SE :('\n<\n' |'\n>')-> skip;
WS: (' ' | '\t') -> skip;
NL: '\r'? '\n' -> skip;
//Semi: ';'-> skip;