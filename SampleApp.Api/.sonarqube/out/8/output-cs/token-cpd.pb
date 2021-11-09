Ô@
aC:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\SampleApp.Api\Controllers\TodoController.cs
	namespace		 	
	SampleApp		
 
.		 
Api		 
.		 
Controllers		 #
{

 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
[ 
Produces 
( 
$str  
)  !
]! "
public 

class 
TodoItemsController $
:% &
ControllerBase' 5
{ 
private 
readonly 
ITodoService %
_todoService& 2
;2 3
public 
TodoItemsController "
(" #
ITodoService# /
todoService0 ;
); <
{ 	
_todoService 
= 
todoService &
;& '
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
PagedResponse' 4
<4 5
TodoItemDto5 @
>@ A
>A B
>B C
GetTodoItemsD P
(P Q
intQ T
pageSizeU ]
=^ _
$num` b
,b c
intd g
	pageIndexh q
=r s
$numt u
)u v
{ 	
var 
items 
= 
await 
_todoService *
.* +
GetItemsAsync+ 8
(8 9
pageSize9 A
,A B
	pageIndexC L
)L M
;M N
return 
Ok 
( 
items 
) 
; 
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
[ 	
SwaggerResponse	 
( 
( 
int 
) 
HttpStatusCode ,
., -
OK- /
,/ 0
$str0 9
,9 :
typeof: @
(@ A
TodoItemDtoA L
)L M
)M N
]N O
[ 	
SwaggerResponse	 
( 
( 
int 
) 
HttpStatusCode ,
., -

BadRequest- 7
,7 8
$str9 V
,V W
typeofX ^
(^ _$
ValidationProblemDetails_ w
)w x
)x y
]y z
[   	
SwaggerResponse  	 
(   
(   
int   
)   
HttpStatusCode   ,
.  , -
NotFound  - 5
,  5 6
$str  7 B
,  B C
typeof  D J
(  J K
Guid  K O
)  O P
)  P Q
]  Q R
public!! 
async!! 
Task!! 
<!! 
ActionResult!! &
<!!& '
TodoItemDto!!' 2
>!!2 3
>!!3 4
GetTodoItem!!5 @
(!!@ A
Guid!!A E
id!!F H
)!!H I
{"" 	
var## 
todoItem## 
=## 
await##  
_todoService##! -
.##- .
GetItemAsync##. :
(##: ;
id##; =
)##= >
;##> ?
return$$ 
($$ 
todoItem$$ 
!=$$ 
null$$  $
)$$$ %
?%% 
Ok%% 
(%% 
todoItem%% 
)%% 
:&& 
NotFound&& 
(&& 
id&& 
)&& 
;&& 
}'' 	
[)) 	
HttpPost))	 
])) 
[** 	
SwaggerResponse**	 
(** 
(** 
int** 
)** 
HttpStatusCode** ,
.**, -
Created**- 4
,**4 5
$str**6 ?
,**? @
typeof**A G
(**G H
TodoItemDto**H S
)**S T
)**T U
]**U V
[++ 	
SwaggerResponse++	 
(++ 
(++ 
int++ 
)++ 
HttpStatusCode++ ,
.++, -

BadRequest++- 7
,++7 8
$str++9 K
,++K L
typeof++M S
(++S T
ExceptionResponse++T e
)++e f
)++f g
]++g h
public,, 
async,, 
Task,, 
<,, 
ActionResult,, &
<,,& '
TodoItemDto,,' 2
>,,2 3
>,,3 4
PostTodoItem,,5 A
(,,A B
TodoItemDto,,B M
todoItem,,N V
),,V W
{-- 	
todoItem.. 
=.. 
await.. 
_todoService.. )
...) *
AddItemAsync..* 6
(..6 7
todoItem..7 ?
)..? @
;..@ A
return// 
CreatedAtAction// "
(//" #
nameof//# )
(//) *
GetTodoItem//* 5
)//5 6
,//6 7
new//8 ;
{//< =
id//> @
=//A B
todoItem//C K
.//K L
Id//L N
}//O P
,//P Q
todoItem//R Z
)//Z [
;//[ \
}00 	
[22 	
HttpPut22	 
(22 
$str22 
)22 
]22 
[33 	
SwaggerResponse33	 
(33 
(33 
int33 
)33 
HttpStatusCode33 ,
.33, -
OK33- /
,33/ 0
$str331 :
,33: ;
typeof33< B
(33B C
TodoItemDto33C N
)33N O
)33O P
]33P Q
[44 	
SwaggerResponse44	 
(44 
(44 
int44 
)44 
HttpStatusCode44 ,
.44, -

BadRequest44- 7
,447 8
$str449 K
,44K L
typeof44M S
(44S T
ExceptionResponse44T e
)44e f
)44f g
]44g h
public55 
async55 
Task55 
<55 
ActionResult55 &
<55& '
TodoItemDto55' 2
>552 3
>553 4
PutTodoItem555 @
(55@ A
Guid55A E
id55F H
,55H I
TodoItemDto55J U
todoItem55V ^
)55^ _
{66 	
if77 
(77 
todoItem77 
.77 
Id77 
!=77 
default77 &
&&77' )
todoItem77* 2
.772 3
Id773 5
!=776 8
id779 ;
)77; <
return88 

BadRequest88 !
(88! "
$str88" E
)88E F
;88F G
todoItem:: 
.:: 
Id:: 
=:: 
id:: 
;:: 
TodoItemDto;; 
?;; 
todoUpdated;; $
=;;% &
await;;' ,
_todoService;;- 9
.;;9 :
UpdateItemAsync;;: I
(;;I J
todoItem;;J R
);;R S
;;;S T
return== 
Ok== 
(== 
todoUpdated== !
)==! "
;==" #
}>> 	
[@@ 	

HttpDelete@@	 
(@@ 
$str@@ 
)@@  
]@@  !
[AA 	
SwaggerResponseAA	 
(AA 
(AA 
intAA 
)AA 
HttpStatusCodeAA ,
.AA, -
OKAA- /
,AA/ 0
$strAA1 :
)AA: ;
]AA; <
[BB 	
SwaggerResponseBB	 
(BB 
(BB 
intBB 
)BB 
HttpStatusCodeBB ,
.BB, -

BadRequestBB- 7
,BB7 8
$strBB9 L
,BBL M
typeofBBN T
(BBT U$
ValidationProblemDetailsBBU m
)BBm n
)BBn o
]BBo p
publicCC 
asyncCC 
TaskCC 
<CC 
ActionResultCC &
>CC& '
DeleteTodoItemCC( 6
(CC6 7
GuidCC7 ;
idCC< >
)CC> ?
{DD 	
awaitEE 
_todoServiceEE 
.EE 
DeleteItemAsyncEE .
(EE. /
idEE/ 1
)EE1 2
;EE2 3
returnFF 
OkFF 
(FF 
)FF 
;FF 
}GG 	
}HH 
}II Æ(
hC:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\SampleApp.Api\Middleware\GlobalExceptionHandler.cs
	namespace 	
	SampleApp
 
. 
Api 
. 

Middleware "
{ 
public 

sealed 
class "
GlobalExceptionHandler .
{ 
private 
readonly 
RequestDelegate (
_next) .
;. /
private 
readonly 
ILogger  
_logger! (
;( )
public "
GlobalExceptionHandler %
(% &
RequestDelegate& 5
next6 :
,: ;
ILoggerFactory< J
loggerFactoryK X
)X Y
{ 	
_next 
= 
next 
; 
_logger 
= 
loggerFactory #
.# $
CreateLogger$ 0
<0 1"
GlobalExceptionHandler1 G
>G H
(H I
)I J
;J K
} 	
public   
async   
Task   
Invoke    
(    !
HttpContext  ! ,
context  - 4
)  4 5
{!! 	
try"" 
{## 
await%% 
_next%% 
(%% 
context%% #
)%%# $
;%%$ %
}&& 
catch'' 
('' 
	Exception'' 
ex'' 
)''  
{(( 
await)) 
LogAndSendResponse)) (
())( )
context))) 0
,))0 1
ex))2 4
)))4 5
;))5 6
}** 
}++ 	
private-- 
async-- 
Task-- 
LogAndSendResponse-- -
(--- .
HttpContext--. 9
context--: A
,--A B
	Exception--C L
ex--M O
)--O P
{.. 	
try// 
{00 
_logger11 
.11 
Log11 
(11 
LogLevel11 $
.11$ %
Error11% *
,11* +
ex11, .
,11. /
$"110 2
$str112 e
{11e f
ex11f h
.11h i
Message11i p
}11p q
"11q r
)11r s
;11s t
}22 
catch33 
(33 
	Exception33 

exInternal33 '
)33' (
{44 
try55 
{66 
_logger77 
.77 
Log77 
(77  
LogLevel77  (
.77( )
Error77) .
,77. /

exInternal770 :
,77: ;
$"77< >
$str	77> £
{
77£ ¤
ex
77¤ ¦
.
77¦ §
Message
77§ ®
}
77® ¯
$str
77¯ °
"
77° ±
)
77± ²
;
77² ³
}88 
catch99 
{:: 
throw<< 
ex<< 
;<< 
}== 
}>> 
exAA 
=AA 
exAA 
.AA 
GetBaseExceptionAA $
(AA$ %
)AA% &
;AA& '
HttpStatusCodeBB 

statusCodeBB %
=BB& '
HttpStatusCodeBB( 6
.BB6 7
InternalServerErrorBB7 J
;BBJ K
switchCC 
(CC 
exCC 
.CC 
GetTypeCC 
(CC 
)CC 
.CC  
NameCC  $
)CC$ %
{DD 
caseEE 
$strEE *
:EE* +

statusCodeFF 
=FF  
HttpStatusCodeFF! /
.FF/ 0

BadRequestFF0 :
;FF: ;
breakGG 
;GG 
caseHH 
$strHH (
:HH( )

statusCodeII 
=II  
HttpStatusCodeII! /
.II/ 0
NotFoundII0 8
;II8 9
breakJJ 
;JJ 
defaultKK 
:KK 
breakLL 
;LL 
}MM 
ifNN 
(NN 
exNN 
isNN 
ValidationExceptionNN )
)NN) *

statusCodeNN+ 5
=NN6 7
HttpStatusCodeNN8 F
.NNF G

BadRequestNNG Q
;NNQ R
contextOO 
.OO 
ResponseOO 
.OO 

StatusCodeOO '
=OO( )
(OO* +
intOO+ .
)OO. /

statusCodeOO/ 9
;OO9 :
ExceptionResponsePP 
responsePP &
=PP' (
newPP) ,
(PP, -
)PP- .
{PP/ 0
MessagePP1 8
=PP9 :
exPP; =
.PP= >
MessagePP> E
}PPF G
;PPG H
contextQQ 
.QQ 
ResponseQQ 
.QQ 
ContentTypeQQ (
=QQ) *
newQQ+ . 
MediaTypeHeaderValueQQ/ C
(QQC D
$strQQD V
)QQV W
.QQW X
ToStringQQX `
(QQ` a
)QQa b
;QQb c
awaitRR 
contextRR 
.RR 
ResponseRR "
.RR" #

WriteAsyncRR# -
(RR- .
JsonSerializerRR. <
.RR< =
	SerializeRR= F
(RRF G
responseRRG O
)RRO P
)RRP Q
;RRQ R
}SS 	
}TT 
}UU ß
NC:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\SampleApp.Api\Program.cs
	namespace 	
	SampleApp
 
. 
Api 
{ 
public 

class 
Program 
{		 
	protected

 
Program

 
(

 
)

 
{

 
}

 
public 
static 
async 
Task  
Main! %
(% &
string& ,
[, -
]- .
args/ 3
)3 4
{ 	
IHost 
host 
= 
CreateHostBuilder *
(* +
args+ /
)/ 0
.0 1
Build1 6
(6 7
)7 8
;8 9
await 
host 
. 
RunAsync 
(  
)  !
;! "
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 
ConfigureLogging /
(/ 0
ConfigureLogger0 ?
)? @
;@ A

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
static 
void 
ConfigureLogger #
(# $!
WebHostBuilderContext$ 9
hostingContext: H
,H I
ILoggingBuilderJ Y
loggingZ a
)a b
{ 	
logging 
. "
AddApplicationInsights *
(* +
)+ ,
;, -
if 
( 
hostingContext 
. 
HostingEnvironment 1
.1 2
IsDevelopment2 ?
(? @
)@ A
)A B
{ 
logging   
.   
AddDebug    
(    !
)  ! "
;  " #
logging!! 
.!! 

AddConsole!! "
(!!" #
)!!# $
;!!$ %
}"" 
}## 	
}$$ 
}%% ü
NC:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\SampleApp.Api\Startup.cs
	namespace 	
	SampleApp
 
. 
Api 
{ 
public 

class 
Startup 
{ 
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
new 
Bootstrapper 
. 
Startup $
($ %
Configuration% 2
)2 3
.3 4
ConfigureServices4 E
(E F
servicesF N
)N O
;O P
services!! 
.!! 
AddControllers!! #
(!!# $
)!!$ %
;!!% &
services"" 
."" 
AddSwaggerGen"" "
(""" #
c""# $
=>""% '
{## 
c$$ 
.$$ 

SwaggerDoc$$ 
($$ 
$str$$ !
,$$! "
new$$# &
OpenApiInfo$$' 2
{$$3 4
Title$$5 :
=$$; <
$str$$= L
,$$L M
Version$$N U
=$$V W
$str$$X \
}$$] ^
)$$^ _
;$$_ `
}%% 
)%% 
;%% 
}&& 	
public)) 
void)) 
	Configure)) 
()) 
IApplicationBuilder)) 1
app))2 5
,))5 6
IWebHostEnvironment))7 J
env))K N
)))N O
{** 	
if++ 
(++ 
env++ 
.++ 
IsDevelopment++ !
(++! "
)++" #
)++# $
{,, 
app-- 
.-- %
UseDeveloperExceptionPage-- -
(--- .
)--. /
;--/ 0
app.. 
... 

UseSwagger.. 
(.. 
)..  
;..  !
app// 
.// 
UseSwaggerUI//  
(//  !
c//! "
=>//# %
c//& '
.//' (
SwaggerEndpoint//( 7
(//7 8
$str//8 R
,//R S
$str//T f
)//f g
)//g h
;//h i
}00 
app33 
.33 
UseDefaultFiles33 
(33  
)33  !
;33! "
app44 
.44 
UseStaticFiles44 
(44 
)44  
;44  !
app66 
.66 
UseHttpsRedirection66 #
(66# $
)66$ %
;66% &
app88 
.88 

UseRouting88 
(88 
)88 
;88 
app:: 
.:: 
UseAuthorization::  
(::  !
)::! "
;::" #
app== 
.== 
UseMiddleware== 
(== 
typeof== $
(==$ %"
GlobalExceptionHandler==% ;
)==; <
)==< =
;=== >
app?? 
.?? 
UseEndpoints?? 
(?? 
	endpoints?? &
=>??' )
{@@ 
	endpointsAA 
.AA 
MapControllersAA (
(AA( )
)AA) *
;AA* +
}BB 
)BB 
;BB 
}CC 	
}DD 
}EE 