‘
dC:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\Infrastructure.Repositories\ITodoRepository.cs
	namespace		 	
Infrastructure		
 
.		 
Repositories		 %
{

 
public 

	interface 
ITodoRepository $
:% &
IRepositoryBase' 6
{ 
Task 
< 
List 
< 
TodoItem 
> 
> 
GetItemsAsync *
(* +
int+ .
pageSize/ 7
,7 8
int9 <
	pageIndex= F
,F G
CancellationTokenH Y
cancellationTokenZ k
=l m
defaultn u
)u v
;v w
Task 
< 
int 
> 
GetItemsCountAsync $
($ %
CancellationToken% 6
cancellationToken7 H
=I J
defaultK R
)R S
;S T
Task 
< 
bool 
> 
ExistsAsync 
( 

Expression )
<) *
Func* .
<. /
TodoItem/ 7
,7 8
bool9 =
>= >
>> ?
filter@ F
,F G
CancellationTokenH Y
cancellationTokenZ k
=l m
defaultn u
)u v
;v w
Task 
< 
TodoItem 
? 
> 
GetItemAsync $
($ %

Expression% /
</ 0
Func0 4
<4 5
TodoItem5 =
,= >
bool? C
>C D
>D E
filterF L
,L M
CancellationTokenN _
cancellationToken` q
=r s
defaultt {
){ |
;| }
TodoItem 
AddItem 
( 
TodoItem !
todoItem" *
)* +
;+ ,
void 

UpdateItem 
( 
TodoItem  
todoItem! )
)) *
;* +
void 

DeleteItem 
( 
TodoItem  
todoItem! )
)) *
;* +
void 

DeleteItem 
( 
Guid 
id 
)  
;  !
} 
} €?
cC:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\Infrastructure.Repositories\TodoRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{ 
public 

class 
TodoRepository 
:  !
RepositoryBase" 0
<0 1
TodoContext1 <
>< =
,= >
ITodoRepository? N
{ 
public 
TodoRepository 
( 
TodoContext )
	dbContext* 3
)3 4
:5 6
base7 ;
(; <
	dbContext< E
)E F
{ 	
} 	
public 
async 
Task 
< 
List 
< 
TodoItem '
>' (
>( )
GetItemsAsync* 7
(7 8
int8 ;
pageSize< D
,D E
intF I
	pageIndexJ S
,S T
CancellationTokenU f
cancellationTokeng x
=y z
default	{ Ç
)
Ç É
{ 	
var 
error 
= 
$str 
; 
if 
( 
pageSize 
< 
$num 
) 
error #
+=$ &
$str' I
;I J
if   
(   
	pageIndex   
<   
$num   
)   
error   $
+=  % '
$str  ( K
;  K L
if!! 
(!! 
error!! 
.!! 
Length!! 
>!! 
$num!!  
)!!  !
throw!!" '
new!!( +
ValidationException!!, ?
(!!? @
error!!@ E
)!!E F
;!!F G
var## 
q## 
=## 
DB## 
.## 
	TodoItems##  
.##  !
AsQueryable##! ,
(##, -
)##- .
.##. /
AsNoTracking##/ ;
(##; <
)##< =
;##= >
int$$ 
	skipCount$$ 
=$$ 
($$ 
	pageIndex$$ &
-$$' (
$num$$) *
)$$* +
*$$, -
pageSize$$. 6
;$$6 7
q%% 
=%% 
	skipCount%% 
==%% 
$num%% 
?%%  
q%%! "
.%%" #
Take%%# '
(%%' (
pageSize%%( 0
)%%0 1
:%%2 3
q%%4 5
.%%5 6
Skip%%6 :
(%%: ;
	skipCount%%; D
)%%D E
.%%E F
Take%%F J
(%%J K
pageSize%%K S
)%%S T
;%%T U
return&& 
await&& 
q&& 
.&& 
ToListAsync&& &
(&&& '
cancellationToken&&' 8
)&&8 9
;&&9 :
}'' 	
public)) 
async)) 
Task)) 
<)) 
int)) 
>)) 
GetItemsCountAsync)) 1
())1 2
CancellationToken))2 C
cancellationToken))D U
=))V W
default))X _
)))_ `
{** 	
return++ 
await++ 
DB++ 
.++ 
	TodoItems++ %
.++% &

CountAsync++& 0
(++0 1
cancellationToken++1 B
)++B C
;++C D
},, 	
public.. 
async.. 
Task.. 
<.. 
TodoItem.. "
?.." #
>..# $
GetItemAsync..% 1
(..1 2

Expression..2 <
<..< =
Func..= A
<..A B
TodoItem..B J
,..J K
bool..L P
>..P Q
>..Q R
filter..S Y
,..Y Z
CancellationToken..[ l
cancellationToken..m ~
=	.. Ä
default
..Å à
)
..à â
{// 	
return00 
await00 
DB00 
.00 
	TodoItems00 %
.00% &
FirstOrDefaultAsync00& 9
(009 :
filter00: @
,00@ A
cancellationToken00B S
)00S T
;00T U
}11 	
public33 
async33 
Task33 
<33 
bool33 
>33 
ExistsAsync33  +
(33+ ,

Expression33, 6
<336 7
Func337 ;
<33; <
TodoItem33< D
,33D E
bool33F J
>33J K
>33K L
filter33M S
,33S T
CancellationToken33U f
cancellationToken33g x
=33y z
default	33{ Ç
)
33Ç É
{44 	
return55 
await55 
DB55 
.55 
	TodoItems55 %
.55% &
AnyAsync55& .
(55. /
filter55/ 5
,555 6
cancellationToken557 H
)55H I
;55I J
}66 	
public88 
TodoItem88 
AddItem88 
(88  
TodoItem88  (
todoItem88) 1
)881 2
{99 	
return:: 
DB:: 
.:: 
	TodoItems:: 
.::  
Add::  #
(::# $
todoItem::$ ,
)::, -
.::- .
Entity::. 4
;::4 5
};; 	
public== 
void== 

UpdateItem== 
(== 
TodoItem== '
todoItem==( 0
)==0 1
{>> 	
DB?? 
.?? 
Update?? 
(?? 
todoItem?? 
)?? 
;??  
}@@ 	
privateII 
voidII 
GetLocalOrAttachII %
(II% &
refII& )
TodoItemII* 2
entityII3 9
)II9 :
{JJ 	
ifLL 
(LL 
DBLL 
.LL 
EntryLL 
(LL 
entityLL 
)LL  
.LL  !
StateLL! &
!=LL' )
EntityStateLL* 5
.LL5 6
DetachedLL6 >
)LL> ?
returnLL@ F
;LLF G
boolNN 
attachNN 
;NN 
GuidOO 
idOO 
=OO 
entityOO 
.OO 
IdOO 
;OO  
TodoItemPP 
?PP 
localEntityPP !
=PP" #
DBPP$ &
.PP& '
SetPP' *
<PP* +
TodoItemPP+ 3
>PP3 4
(PP4 5
)PP5 6
.PP6 7
LocalPP7 <
.PP< =
FirstOrDefaultPP= K
(PPK L
ePPL M
=>PPN P
ePPQ R
.PPR S
IdPPS U
==PPV X
idPPY [
)PP[ \
;PP\ ]
ifQQ 
(QQ 
localEntityQQ 
!=QQ 
nullQQ #
)QQ# $
{RR 
entitySS 
=SS 
localEntitySS $
;SS$ %
attachTT 
=TT 
DBTT 
.TT 
EntryTT !
(TT! "
entityTT" (
)TT( )
.TT) *
StateTT* /
==TT0 2
EntityStateTT3 >
.TT> ?
DetachedTT? G
;TTG H
}UU 
elseVV 
{WW 
attachXX 
=XX 
trueXX 
;XX 
}YY 
ifZZ 
(ZZ 
attachZZ 
)ZZ 
DBZZ 
.ZZ 
AttachZZ !
(ZZ! "
entityZZ" (
)ZZ( )
;ZZ) *
}[[ 	
public]] 
void]] 

DeleteItem]] 
(]] 
TodoItem]] '
todoItem]]( 0
)]]0 1
{^^ 	
GetLocalOrAttach__ 
(__ 
ref__  
todoItem__! )
)__) *
;__* +
DB`` 
.`` 
	TodoItems`` 
.`` 
Remove`` 
(``  
todoItem``  (
)``( )
;``) *
}aa 	
publiccc 
voidcc 

DeleteItemcc 
(cc 
Guidcc #
idcc$ &
)cc& '
{dd 	

DeleteItemee 
(ee 
newee 
TodoItemee #
{ee$ %
Idee& (
=ee) *
idee+ -
}ee. /
)ee/ 0
;ee0 1
}ff 	
}gg 
}hh 