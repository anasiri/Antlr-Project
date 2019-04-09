grammar g;

startRule :importDeclaration+ mainPart;


//startRule: ImportIden
importDeclaration : 'import'  importIdentifier ';' ;
importIdentifier :identifier;

//Start of Code
mainPart: '{' classDeclaration* '}';


// Defining Class
classDeclaration: classDef leftBlock statement rightBlock;
classDef: 'class' claseIdentifier ':' ;
claseIdentifier :identifier;

//Statements
statement: (variableDecleration';'|functionDecleration)*;


//Declering Functions
functionDecleration:'Function' functionIdentifier '(' functionInputDecleration* ')' leftBlock functionCode returnValue';' rightBlock;
functionCode:(variableDecleration';'|ifStatement|forStatement|whileStatement|switchCaseStatement|equation';')*;
functionInputDecleration:(varTypes identifier)(','varTypes identifier)*;

functionIdentifier :identifier;

returnValue: 'return' (identifier|expression|equation);

//if Statement
ifStatement:'if' '('conditionalExpressions')' leftBlock functionCode rightBlock;
leftBlock:'<'|'<\n'|'\n<'|'\n<\n';
rightBlock:'>'|'>\n'|'\n>'|'\n>\n';
//for Statement
forStatement:'for('variableDecleration';'conditionalExpressions';'equation')'  leftBlock functionCode rightBlock;

//While Statement
whileStatement:'while('conditionalExpressions')' leftBlock functionCode rightBlock;

//SwitchCase Statement
switchCaseStatement:

    'switch('expression'):' leftBlock(
    ' case'expression':'
    (leftBlock functionCode rightBlock|functionCode|) 'break;'?)+
    ('default:'(leftBlock functionCode rightBlock|functionCode|))?
    rightBlock;



//Conditional Expression
conditionalExpressions: conditionalOr ;
conditionalOr: conditionalOr(OR conditionalAnd)|conditionalAnd ;
conditionalAnd:conditionalAnd(AND term)|term;
term: x|NOT term|ID |ConstantsVal;
x:bitwiseExp((comparingOperators|equalityOperators) bitwiseExp)+;
//comparingExpx:comparingExpx(equalityOperators bitwiseExp)|equalityExp(comparingOperators equalityExp);


NOT:'not';
AND:'and';
OR:'or';

//Exp old Version
//equation:identifier assignmentOperators expression';';
//
//expression: comparingExp;
//comparingExp:equalityExp(comparingOperators equalityExp)*;
//equalityExp :bitwiseExp(equalityOperators bitwiseExp)*;
//bitwiseExp :shiftExp(bitwiseOperators shiftExp)*;
//shiftExp:hashtagExp(shiftOperators hashtagExp)*;
//hashtagExp :plusMinusExp(hashtagOperators plusMinusExp)*;
//plusMinusExp:multDivExp(plustMinusOperators multDivExp)*;
//multDivExp:signExp (multDivOperators signExp)*;
//signExp:signOperators bitwiseNotExp ;
//bitwiseNotExp:exponentiationExp (bitwiseNotOperator exponentiationExp)*;
//exponentiationExp :parenthesesExp(exponentiationOperator parenthesesExp)*;
//parenthesesExp:(lPar (expression) rPar)|variable;

//Expressions
equation:identifier assignmentOperators expression;

expression: comparingExp;
comparingExp:comparingExp(comparingOperators equalityExp)|equalityExp;
equalityExp :equalityExp(equalityOperators bitwiseExp)|bitwiseExp;
bitwiseExp :bitwiseExp(bitwiseOperators underLineExp)|underLineExp;
underLineExp:underLineExp(underLineOperators shiftExp)|shiftExp;
shiftExp:hashtagExp(shiftOperators shiftExp)|hashtagExp;
hashtagExp :plusMinusExp(hashtagOperators hashtagExp)|plusMinusExp;
plusMinusExp:plusMinusExp(plustMinusOperators multDivExp)|multDivExp;
multDivExp:multDivExp (multDivOperators signExp)|signExp;
signExp:signOperators? bitwiseNotExp ;
bitwiseNotExp: bitwiseNotOperator? exponentiationExp;
exponentiationExp :parenthesesExp (exponentiationOperator exponentiationExp)|parenthesesExp;
parenthesesExp:(lPar (expression) rPar)|variable;

variable: (ID|IntNumbers|ConstantsVal|SCIENTIFIC_NUMBER|FloatingNumbers);

assignmentOperators:ASSIGN|ASSIGNEXPON|ASSIGNDIV|ASSIGNFDIV|ASSIGNMULT|ASSIGNREM|ASSIGNMINUS|ASSIGNPLUS;
comparingOperators:GTHANEQ|GTHAN|LTHANEQ|LTHAN;
equalityOperators:Equal|NEqual|DoubleEq;
bitwiseOperators:BITAND|BITOR|BITXOR;
underLineOperators:Underline;
shiftOperators:LSHIFT|RSHIFT;
hashtagOperators:Hashtag;
plustMinusOperators:PLUS|Minus;
multDivOperators:MULT|DIV|FDIV|REM;
signOperators:(PLUS|Minus);
bitwiseNotOperator: BITNOT;
exponentiationOperator:EXPONEN;
lPar :LPAR;
rPar :RPAR;

//Defining Variables///
varTypes:intDecleration|floatDecleration|constantsDecleration;
variableDecleration:intVar|floatVar|constantsVar;
intVar: (intDecleration intIdentifier ('=' expression)?(',' intIdentifier ('=' expression)? )*);
floatVar:(floatDecleration floatIdentifier ('=' expression)?(',' floatIdentifier('=' expression)? )*);
constantsVar:(constantsDecleration constantsIdentifier ('='expression)?(',' constantsIdentifier ('='expression)? )*);


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

IntNumbers:NUMBER+;
FloatingNumbers:NUMBER+('.'NUMBER+)?;
ConstantsVal:TRUE|FALSE|'null'|'ioat';
SCIENTIFIC_NUMBER: FloatingNumbers('e' (PLUS|Minus)? NUMBER+)?;
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


Hashtag: '#' ; // 7


//Shift Right 8
RSHIFT: '>>';

//Shift Left 8
LSHIFT:'<<';


Underline:'_'; //9


//Bitwise and  10
BITAND:'&';

//Bitwise or 10
BITOR:'|';

//Bitwise xor 10
BITXOR:'^';

//Equal      11
Equal:'==';

//Not Equal  11
NEqual:'!=';

DoubleEq: '<>'; // 11

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






//SE :('\n<\n' |'<\n' |'\n>'|'>\n'|'\n')-> skip;
WS: (' ' | '\t') -> skip;
NEWLINE: [\r\n] -> skip;
//NL: '\r'? '\n' -> skip;
BlockComment : '/*' .*? '*/' -> skip;
LineComment :'@' .*? '\n' ->skip;
//Semi: ';'-> skip;