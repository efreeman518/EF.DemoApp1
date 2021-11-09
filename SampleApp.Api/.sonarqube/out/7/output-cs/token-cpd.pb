ë
nC:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\SampleApp.Bootstrapper\Automapper\ConfigureAutomapper.cs
	namespace 	
	SampleApp
 
. 
Bootstrapper  
.  !

Automapper! +
{ 
public 

static 
class 
ConfigureAutomapper +
{ 
public 
static 
void 
	Configure $
($ %
IServiceCollection% 7
services8 @
)@ A
{		 	
services

 
.

 
AddSingleton

 !
(

! "
CreateMapper

" .
(

. /
)

/ 0
)

0 1
;

1 2
} 	
public 
static 
IMapper 
CreateMapper *
(* +
)+ ,
{ 	
var 
mc 
= 
new 
MapperConfiguration ,
(, -
mc- /
=>0 2
{ 
mc 
. 
AddGlobalIgnore "
(" #
$str# ,
), -
;- .
mc 
. 
AddGlobalIgnore "
(" #
$str# ,
), -
;- .
mc 
. 

AddProfile 
( 
new !
MappingProfile" 0
(0 1
)1 2
)2 3
;3 4
} 
) 
; 
IMapper 
mapper 
= 
mc 
.  
CreateMapper  ,
(, -
)- .
;. /
mapper 
. !
ConfigurationProvider (
.( )&
AssertConfigurationIsValid) C
(C D
)D E
;E F
return 
mapper 
; 
} 	
} 
} ×
iC:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\SampleApp.Bootstrapper\Automapper\MappingProfile.cs
	namespace 	
	SampleApp
 
. 
Bootstrapper  
.  !

Automapper! +
{ 
public 

class 
MappingProfile 
:  !
Profile" )
{ 
public

 
MappingProfile

 
(

 
)

 
{ 	
	CreateMap 
< 
TodoItem 
, 
TodoItemDto  +
>+ ,
(, -
)- .
. 

ReverseMap 
( 
) 
; 
} 	
} 
} •
WC:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\SampleApp.Bootstrapper\Startup.cs
	namespace

 	
	SampleApp


 
.

 
Bootstrapper

  
{ 
public 

class 
Startup 
{ 
public 
readonly 
IConfiguration &
_config' .
;. /
public 
Startup 
( 
IConfiguration %
config& ,
), -
{ 	
_config 
= 
config 
; 
} 	
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddTransient !
<! "
ITodoService" .
,. /
TodoService0 ;
>; <
(< =
)= >
;> ?
services 
. 
	Configure 
< 
TodoServiceSettings 2
>2 3
(3 4
_config4 ;
.; <

GetSection< F
(F G
$strG \
)\ ]
)] ^
;^ _
ConfigureAutomapper 
.  
	Configure  )
() *
services* 2
)2 3
;3 4
services 
. 
AddTransient !
<! "
ITodoRepository" 1
,1 2
TodoRepository3 A
>A B
(B C
)C D
;D E
string"" 
connectionString"" #
=""$ %
_config""& -
.""- .
GetConnectionString"". A
(""A B
$str""B O
)""O P
;""P Q
if## 
(## 
string## 
.## 
IsNullOrEmpty## $
(##$ %
connectionString##% 5
)##5 6
||##7 9
connectionString##: J
==##K M
$str##N c
)##c d
{$$ 
services&& 
.&& 
AddDbContextPool&& )
<&&) *
TodoContext&&* 5
>&&5 6
(&&6 7
opt&&7 :
=>&&; =
opt&&> A
.&&A B
UseInMemoryDatabase&&B U
(&&U V
$str&&V c
)&&c d
)&&d e
;&&e f
}'' 
else(( 
{)) 
services** 
.** 
AddDbContextPool** )
<**) *
TodoContext*** 5
>**5 6
(**6 7
options**7 >
=>**? A
options++ 
.++ 
UseSqlServer++ (
(++( )
connectionString++) 9
,++9 :"
sqlServerOptionsAction-- .
:--. /

sqlOptions--0 :
=>--; =
{.. 

sqlOptions// &
.//& ' 
EnableRetryOnFailure//' ;
(//; <
maxRetryCount//< I
://I J
$num//K L
,//L M
maxRetryDelay00 )
:00) *
TimeSpan00+ 3
.003 4
FromSeconds004 ?
(00? @
$num00@ B
)00B C
,00C D
errorNumbersToAdd11 -
:11- .
null11/ 3
)113 4
;114 5
}22 
)22 
)33 
;33 
}44 
}66 	
}77 
}88 