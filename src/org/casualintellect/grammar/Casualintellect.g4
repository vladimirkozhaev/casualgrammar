grammar Casualintellect;

bool_bin_operation: 'OR'|'AND'|'XOR';

states
:
	state+
;

state
:
	'state' '=' ID '{' states_before states_after states_in_process transitions
	'}' ';'
;

list_of_id
:
	ID+
;

ID
:
	[a-zA-Z]
	(
		[a-zA-Z0-9]
	)*
;

states_before
:
	'before' '{' list_of_id '}'
;

states_after
:
	'after' '{' list_of_id '}'
;

states_in_process
:
	'in_process' '{' list_of_id '}'
;

transitions
:
	'transitions' '{' transition+ '}'
;

transition
:
	'transition' '{' 'state_name' ':' ID ';'  'bool_expr' ':' bool_expr ';' 'process' ':' '{' list_of_id '}' '}'
;

left_brace:'(';

right_brace:')';

bool_expr: ID | left_brace bool_expr right_brace | ID ( bool_bin_operation bool_expr)+| bool_un_operation bool_expr;

bool_un_operation:'NOT';


WS : [ \t\n\r]+ -> skip ;
