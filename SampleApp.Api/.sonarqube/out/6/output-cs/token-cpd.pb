Ã

ZC:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\Application.Services\ITodoService.cs
	namespace 	
Application
 
. 
Services 
{ 
public 

	interface 
ITodoService !
{ 
Task		 
<		 
PagedResponse		 
<		 
TodoItemDto		 &
>		& '
>		' (
GetItemsAsync		) 6
(		6 7
int		7 :
pageSize		; C
=		D E
$num		F H
,		H I
int		J M
	pageIndex		N W
=		X Y
$num		Z [
)		[ \
;		\ ]
Task

 
<

 
TodoItemDto

 
>

 
GetItemAsync

 &
(

& '
Guid

' +
id

, .
)

. /
;

/ 0
Task 
< 
TodoItemDto 
> 
AddItemAsync &
(& '
TodoItemDto' 2
dto3 6
)6 7
;7 8
Task 
< 
TodoItemDto 
? 
> 
UpdateItemAsync *
(* +
TodoItemDto+ 6
dto7 :
): ;
;; <
Task 
DeleteItemAsync 
( 
Guid !
id" $
)$ %
;% &
} 
} ∑
YC:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\Application.Services\ServiceBase.cs
	namespace 	
Application
 
. 
Services 
{ 
public 

abstract 
class 
ServiceBase %
{ 
	protected		 
readonly		 
ILogger		 "
<		" #
ServiceBase		# .
>		. /
?		/ 0
Logger		1 7
;		7 8
public 
ServiceBase 
( 
ILogger "
<" #
ServiceBase# .
>. /
?/ 0
logger1 7
)7 8
{ 	
Logger 
= 
logger 
; 
} 	
	protected 
void 
Log 
( 
LogLevel #
logLevel$ ,
,, -
string. 4
message5 <
,< =
int> A
eventIdB I
=J K
$numL M
,M N
	ExceptionO X
?X Y
exZ \
=] ^
null_ c
,c d
Liste i
<i j
KeyValuePairj v
<v w
stringw }
,} ~
string	 Ö
?
Ö Ü
>
Ü á
>
á à
?
à â
logData
ä ë
=
í ì
null
î ò
)
ò ô
{ 	
if 
( 
Logger 
== 
null 
) 
return  &
;& '
Logger 
. 
Log 
( 
logLevel 
,  
eventId! (
,( )
message* 1
,1 2
ex3 5
,5 6
logData7 >
)> ?
;? @
} 	
} 
} «M
YC:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\Application.Services\TodoService.cs
	namespace 	
Application
 
. 
Services 
{ 
public 

class 
TodoService 
: 
ServiceBase *
,* +
ITodoService, 8
{ 
private 
readonly 
ITodoRepository (
_repository) 4
;4 5
private 
readonly 
IMapper  
_mapper! (
;( )
public 
TodoService 
( 
ILogger "
<" #
TodoService# .
>. /
logger0 6
,6 7
ITodoRepository8 G

repositoryH R
,R S
IMapperT [
mapper\ b
)b c
:d e
basef j
(j k
loggerk q
)q r
{ 	
_repository 
= 

repository $
;$ %
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
PagedResponse '
<' (
TodoItemDto( 3
>3 4
>4 5
GetItemsAsync6 C
(C D
intD G
pageSizeH P
=Q R
$numS U
,U V
intW Z
	pageIndex[ d
=e f
$numg h
)h i
{ 	
return 
new 
PagedResponse $
<$ %
TodoItemDto% 0
>0 1
{   
PageSize!! 
=!! 
pageSize!! #
,!!# $
	PageIndex"" 
="" 
	pageIndex"" %
,""% &
Data## 
=## 
_mapper## 
.## 
Map## "
<##" #
List### '
<##' (
TodoItem##( 0
>##0 1
,##1 2
List##3 7
<##7 8
TodoItemDto##8 C
>##C D
>##D E
(##E F
await##F K
_repository##L W
.##W X
GetItemsAsync##X e
(##e f
pageSize##f n
,##n o
	pageIndex##p y
)##y z
)##z {
,##{ |
Total$$ 
=$$ 
await$$ 
_repository$$ )
.$$) *
GetItemsCountAsync$$* <
($$< =
)$$= >
}%% 
;%% 
}&& 	
public(( 
async(( 
Task(( 
<(( 
TodoItemDto(( %
>((% &
GetItemAsync((' 3
(((3 4
Guid((4 8
id((9 ;
)((; <
{)) 	
var** 
todo** 
=** 
await** 
_repository** (
.**( )
GetItemAsync**) 5
(**5 6
t**6 7
=>**8 :
t**; <
.**< =
Id**= ?
==**@ B
id**C E
)**E F
;**F G
if++ 
(++ 
todo++ 
==++ 
null++ 
)++ 
throw++ "
new++# &
NotFoundException++' 8
(++8 9
$"++9 ;
$str++; H
{++H I
id++I K
}++K L
$str++L X
"++X Y
)++Y Z
;++Z [
return.. 
_mapper.. 
... 
Map.. 
<.. 
TodoItem.. '
,..' (
TodoItemDto..) 4
>..4 5
(..5 6
todo..6 :
)..: ;
;..; <
}// 	
public11 
async11 
Task11 
<11 
TodoItemDto11 %
>11% &
AddItemAsync11' 3
(113 4
TodoItemDto114 ?
dto11@ C
)11C D
{22 	
int44 
validNameLength44 
=44  !
$num44" #
;44# $
string55 
regexValidName55 !
=55" #
$str55$ '
;55' (
if88 
(88 
dto88 
.88 
Name88 
.88 
Length88 
<88  !
validNameLength88" 1
)881 2
throw883 8
new889 <
ValidationException88= P
(88P Q
$"88Q S
$str88S r
{88r s
validNameLength	88s Ç
}
88Ç É
$str
88É è
"
88è ê
)
88ê ë
;
88ë í
if99 
(99 
await99 
_repository99 !
.99! "
ExistsAsync99" -
(99- .
t99. /
=>990 2
t993 4
.994 5
Name995 9
==99: <
dto99= @
.99@ A
Name99A E
)99E F
)99F G
throw99H M
new99N Q
ValidationException99R e
(99e f
$"99f h
$str99h w
{99w x
dto99x {
.99{ |
Name	99| Ä
}
99Ä Å
$str
99Å í
"
99í ì
)
99ì î
;
99î ï
var<< 
todo<< 
=<< 
_mapper<< 
.<< 
Map<< "
<<<" #
TodoItemDto<<# .
,<<. /
TodoItem<<0 8
><<8 9
(<<9 :
dto<<: =
)<<= >
;<<> ?
if?? 
(?? 
!?? 
new?? 
TodoNameLengthRule?? '
(??' (
validNameLength??( 7
)??7 8
.??8 9
IsSatisfiedBy??9 F
(??F G
todo??G K
)??K L
)??L M
throw??N S
new??T W
ValidationException??X k
(??k l
$"??l n
$str	??n ç
{
??ç é
validNameLength
??é ù
}
??ù û
$str
??û ™
"
??™ ´
)
??´ ¨
;
??¨ ≠
if@@ 
(@@ 
!@@ 
new@@ 
TodoNameContentRule@@ (
(@@( )
regexValidName@@) 7
)@@7 8
.@@8 9
IsSatisfiedBy@@9 F
(@@F G
todo@@G K
)@@K L
)@@L M
throw@@N S
new@@T W
ValidationException@@X k
(@@k l
$"@@l n
$str	@@n ä
{
@@ä ã
regexValidName
@@ã ô
}
@@ô ö
$str
@@ö ú
"
@@ú ù
)
@@ù û
;
@@û ü
ifAA 
(AA 
!AA 
newAA 
TodoCompositeRuleAA &
(AA& '
validNameLengthAA' 6
,AA6 7
regexValidNameAA8 F
)AAF G
.AAG H
IsSatisfiedByAAH U
(AAU V
todoAAV Z
)AAZ [
)AA[ \
throwAA] b
newAAc f
ValidationExceptionAAg z
(AAz {
$"AA{ }
$str	AA} é
"
AAé è
)
AAè ê
;
AAê ë
todoCC 
=CC 
_repositoryCC 
.CC 
AddItemCC &
(CC& '
todoCC' +
)CC+ ,
;CC, -
awaitDD 
_repositoryDD 
.DD 
SaveChangesAsyncDD .
(DD. /
$strDD/ 8
)DD8 9
;DD9 :
returnGG 
_mapperGG 
.GG 
MapGG 
<GG 
TodoItemGG '
,GG' (
TodoItemDtoGG) 4
>GG4 5
(GG5 6
todoGG6 :
)GG: ;
;GG; <
}HH 	
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
TodoItemDtoJJ %
?JJ% &
>JJ& '
UpdateItemAsyncJJ( 7
(JJ7 8
TodoItemDtoJJ8 C
dtoJJD G
)JJG H
{KK 	
varMM 
dbTodoMM 
=MM 
awaitMM 
_repositoryMM *
.MM* +
GetItemAsyncMM+ 7
(MM7 8
tMM8 9
=>MM: <
tMM= >
.MM> ?
IdMM? A
==MMB D
dtoMME H
.MMH I
IdMMI K
)MMK L
;MML M
ifNN 
(NN 
dbTodoNN 
==NN 
nullNN 
)NN 
throwNN  %
newNN& )
NotFoundExceptionNN* ;
(NN; <
$"NN< >
$strNN> K
{NNK L
dtoNNL O
.NNO P
IdNNP R
}NNR S
$strNNS _
"NN_ `
)NN` a
;NNa b
varPP 

updateTodoPP 
=PP 
_mapperPP $
.PP$ %
MapPP% (
<PP( )
TodoItemDtoPP) 4
,PP4 5
TodoItemPP6 >
>PP> ?
(PP? @
dtoPP@ C
)PPC D
;PPD E
dbTodoSS 
.SS 
NameSS 
=SS 

updateTodoSS $
.SS$ %
NameSS% )
;SS) *
dbTodoTT 
.TT 

IsCompleteTT 
=TT 

updateTodoTT  *
.TT* +

IsCompleteTT+ 5
;TT5 6
dbTodoUU 
.UU 
StatusUU 
=UU 

updateTodoUU &
.UU& '
StatusUU' -
;UU- .
_repositoryVV 
.VV 

UpdateItemVV "
(VV" #
dbTodoVV# )
)VV) *
;VV* +
awaitXX 
_repositoryXX 
.XX 
SaveChangesAsyncXX .
(XX. /
$strXX/ 8
)XX8 9
;XX9 :
return[[ 
_mapper[[ 
.[[ 
Map[[ 
<[[ 
TodoItem[[ '
,[[' (
TodoItemDto[[) 4
>[[4 5
([[5 6
dbTodo[[6 <
)[[< =
;[[= >
}\\ 	
public^^ 
async^^ 
Task^^ 
DeleteItemAsync^^ )
(^^) *
Guid^^* .
id^^/ 1
)^^1 2
{__ 	
_repository`` 
.`` 

DeleteItem`` "
(``" #
id``# %
)``% &
;``& '
awaitaa 
_repositoryaa 
.aa 
SaveChangesAsyncaa .
(aa. /
$straa/ 8
)aa8 9
;aa9 :
}bb 	
}cc 
}dd å
aC:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\Application.Services\TodoServiceSettings.cs
	namespace 	
Application
 
. 
Services 
{ 
public 

class 
TodoServiceSettings $
{ 
public 
string 
? 
StringValue "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
? 
IntValue 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} 