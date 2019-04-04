grammar g;

startRule :importDeclaration+ mainPart;


//startRule: ImportIden
importDeclaration : 'import'  importIdentifier ';' ;
importIdentifier :identifier;

//Start of Code
mainPart: '{' classDeclaration* '}';


// Defining Class
classDeclaration: classDef '\n<\n' statement ('\n>'|'>');
classDef: 'class' claseIdentifier ':' ;
claseIdentifier :identifier;

//Statements
statement: (variableDecleration|functionDecleration)*;


//Declering Functions
functionDecleration:'Function' functionIdentifier '(' functionInputDecleration* ')' '<\n' functionCode '>';
functionCode:(variableDecleration|ifStatement|forStatement|whileStatement|switchCaseStatement|equation)*;
functionInputDecleration:(varTypes identifier)(','varTypes identifier)*;

functionIdentifier :identifier;



//if Statement
ifStatement:'if' '('conditionalExpressions')';

//for Statement
forStatement:'z';

//While Statement
whileStatement:'d';

//SwitchCase Statement
switchCaseStatement:'c';


//Conditional Expression
conditionalExpressions
    :
    conditionalExpression?(logicalOperators conditionalExpression|'!'(conditionalExpression))*;
conditionalExpression
	: expression conditionalOperators expression|NOT expression|ID|TRUE|FALSE;



//Expressions

equation:identifier assignmentOperators expression';';

expression: comparingExp;
comparingExp:equalityExp(comparingOperators equalityExp)*;
equalityExp :bitwiseExp(equalityOperators bitwiseExp)*;
bitwiseExp :shiftExp(bitwiseOperators shiftExp)*;
shiftExp:hashtagExp(shiftOperators hashtagExp)*;
hashtagExp :plusMinusExp(hashtagOperators plusMinusExp)*;
plusMinusExp:multDivExp(plustMinusOperators multDivExp)*;
multDivExp:signExp (multDivOperators signExp)*;
signExp:signOperators bitwiseNotExp ;
bitwiseNotExp:exponentiationExp (bitwiseNotOperator exponentiationExp)*;
exponentiationExp :parenthesesExp(exponentiationOperator parenthesesExp)*;
parenthesesExp:(lPar (expression) rPar)|variable;

variable: (ID|IntNumbers|ConstantsVal|SCIENTIFIC_NUMBER|FloatingNumbers);

assignmentOperators:ASSIGN|ASSIGNEXPON|ASSIGNDIV|ASSIGNFDIV|ASSIGNMULT|ASSIGNREM|ASSIGNMINUS|ASSIGNPLUS;
comparingOperators:GTHANEQ|GTHAN|LTHANEQ|LTHAN;
equalityOperators:Equal|NEqual;
bitwiseOperators:BITAND|BITOR|BITXOR;
shiftOperators:LSHIFT|RSHIFT;
hashtagOperators:'#';
plustMinusOperators:PLUS|Minus;
multDivOperators:MULT|DIV|FDIV|REM;
signOperators:(PLUS|Minus)?;
bitwiseNotOperator: BITNOT;
exponentiationOperator:EXPONEN;
lPar :LPAR;
rPar :RPAR;

//Defining Variables///
varTypes:intDecleration|floatDecleration|constantsDecleration;
variableDecleration:intVar|floatVar|constantsVar;
intVar: (intDecleration intIdentifier ('=' intVal)?(',' intIdentifier ('=' intVal)? )*';');
floatVar:(floatDecleration floatIdentifier ('=' floatVal)?(',' floatIdentifier('=' floatVal)? )*';');
constantsVar:(constantsDecleration constantsIdentifier ('='constantsVal)?(',' constantsIdentifier ('='constantsVal)? )*';');


intIdentifier:identifier;
floatIdentifier:identifier;
constantsIdentifier:identifier;

intDecleration: IntType;
floatDecleration:FloatType;
constantsDecleration:ConstantsType;

VarTypes:'int'|'float'|'constants';
IntType: 'int ';
FloatType: 'float ';
ConstantsType: 'constants ';

intVal :IntNumbers|SCIENTIFIC_NUMBER;
floatVal:FloatingNumbers|SCIENTIFIC_NUMBER;
constantsVal :ConstantsVal;

IntNumbers:NUMBER+;
FloatingNumbers:NUMBER+('.'NUMBER+)?;
ConstantsVal:TRUE|FALSE|'null'|'ioat';
SCIENTIFIC_NUMBER: FloatingNumbers('e' (PLUS|Minus)? NUMBER)?;


TRUE :'true';
FALSE:'false';


/////////////Other///////
identifier:ID;


ID:LETTERS+(LETTERS|NUMBER)+;
fragment LETTERS: 'a'..'z'|'A'..'Z';


fragment NUMBER: '0' .. '9';


/////////////Operators/////////

logicalOperators:
    AND|
    OR|
    NOT;

conditionalOperators:
    Equal|
    NEqual|
    GTHAN|
    LTHAN|
    LTHANEQ|
    GTHANEQ;

//Parentheses   1
LPAR:'(';
RPAR:')';


//Exponentiation   2
EXPONEN:'**';

//BITWISE NOT    3
BITNOT:'~';


//Sign       4
//SIGN : ('+' | '-');


//Multiplication    5
MULT: '*';

//Division       5
DIV: '/';

//Floor Division    5
FDIV:'//';

//Remainder        5
REM:'%';

//Plus          6
PLUS:'+';

//Minus         6
Minus:'-';


//# ?????????? 7


//Shift Right 8
RSHIFT: '>>';

//Shift Left 8
LSHIFT:'<<';


//_ ????????  9


//Bitwise and  10
BITAND:'&';

//Bitwise or 10
BITOR:'|';

//Bitwise xor 10
BITXOR:'^';

//Equal      11
Equal:'==';

//Not Equal  11
NEqual:'!';

//<> ??????? 11

//Less than  12
LTHAN:'<';

//Less than or equal 12
LTHANEQ:'<=';

//Greater than  12
GTHAN:'>';

//Greater than or equal 12
GTHANEQ:'>=';

//Assignment    13
ASSIGN:'=';

// Plus equal   13
ASSIGNPLUS:'+=';

// Minus equal   13
ASSIGNMINUS:'-=';

// Multiplication equal   13
ASSIGNMULT:'*=';

// Division equal   13
ASSIGNDIV:'/=';

// Remainder equal   13
ASSIGNREM:'%=';

// Exponentiation equal 13
ASSIGNEXPON:'**=';

// Floor Division equal 13
ASSIGNFDIV:'//=';


//NOT           14
NOT:'not';

//AND           14
AND:'and';

//OR            14
OR:'or';



SE :('\n<\n' |'\n>')-> skip;
WS: (' ' | '\t') -> skip;
NL: '\r'? '\n' -> skip;
BlockComment : '/*' .*? '*/' -> skip;
LineComment :'@' .*? '\n' ->skip;
//Semi: ';'-> skip;