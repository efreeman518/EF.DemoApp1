´
rC:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\Infrastructure.Data\Configuration\EntityBaseConfiguration.cs
	namespace 	
Infrastructure
 
. 
Data 
. 
Configuration +
{ 
public 

abstract 
class #
EntityBaseConfiguration 1
<1 2
T2 3
>3 4
:5 6$
IEntityTypeConfiguration7 O
<O P
TP Q
>Q R
whereS X
TY Z
:[ \

EntityBase] g
{ 
public		 
virtual		 
void		 
	Configure		 %
(		% &
EntityTypeBuilder		& 7
<		7 8
T		8 9
>		9 :
builder		; B
)		B C
{

 	
builder 
. 
HasKey 
( 
c 
=> 
c  !
.! "
Id" $
)$ %
.% &
IsClustered& 1
(1 2
false2 7
)7 8
;8 9
builder 
. 
Property 
( 
c 
=> !
c" #
.# $
Id$ &
)& '
.' (
ValueGeneratedNever( ;
(; <
)< =
;= >
builder 
. 
Property 
( 
b 
=> !
b" #
.# $
	CreatedBy$ -
)- .
.. /
HasMaxLength/ ;
(; <
$num< ?
)? @
;@ A
builder 
. 
Property 
( 
b 
=> !
b" #
.# $
	UpdatedBy$ -
)- .
.. /
HasMaxLength/ ;
(; <
$num< ?
)? @
;@ A
builder 
. 
Property 
( 
b 
=> !
b" #
.# $
CreatedDate$ /
)/ 0
.0 1
HasColumnType1 >
(> ?
$str? M
)M N
;N O
builder 
. 
Property 
( 
b 
=> !
b" #
.# $
UpdatedDate$ /
)/ 0
.0 1
HasColumnType1 >
(> ?
$str? M
)M N
;N O
} 	
} 
} ë
pC:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\Infrastructure.Data\Configuration\TodoItemConfiguration.cs
	namespace 	
Infrastructure
 
. 
Data 
. 
Configuration +
{ 
public 

class !
TodoItemConfiguration &
:' (#
EntityBaseConfiguration) @
<@ A
TodoItemA I
>I J
{ 
public		 
override		 
void		 
	Configure		 &
(		& '
EntityTypeBuilder		' 8
<		8 9
TodoItem		9 A
>		A B
builder		C J
)		J K
{

 	
base 
. 
	Configure 
( 
builder "
)" #
;# $
builder 
. 
ToTable 
( 
$str &
)& '
. 
HasIndex 
( 
i 
=> 
i  
.  !
Name! %
)% &
.& '
IsUnique' /
(/ 0
)0 1
.1 2
IsClustered2 =
(= >
)> ?
;? @
builder 
. 
Property 
( 
b 
=> !
b" #
.# $
Name$ (
)( )
.) *
HasMaxLength* 6
(6 7
$num7 :
): ;
;; <
} 	
} 
} ø
]C:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\Infrastructure.Data\DbContextFactory.cs
	namespace 	
Infrastructure
 
. 
Data 
{ 
public 

class 
DbContextFactory !
:" #'
IDesignTimeDbContextFactory$ ?
<? @
TodoContext@ K
>K L
{ 
public 
TodoContext 
CreateDbContext *
(* +
string+ 1
[1 2
]2 3
args4 8
)8 9
{ 	
string 
? 

connString 
=  
Environment! ,
., -"
GetEnvironmentVariable- C
(C D
$strD S
)S T
;T U
if 
( 
string 
. 
IsNullOrEmpty $
($ %

connString% /
)/ 0
)0 1
throw 
new %
InvalidOperationException 3
(3 4
$str	4 „
)
„ …
;
… †
Console 
. 
	WriteLine 
( 

connString (
)( )
;) *
var 
optionsBuilder 
=  
new! $#
DbContextOptionsBuilder% <
<< =
TodoContext= H
>H I
(I J
)J K
;K L
optionsBuilder 
. 
UseSqlServer '
(' (

connString( 2
)2 3
;3 4
return 
new 
TodoContext "
(" #
optionsBuilder# 1
.1 2
Options2 9
)9 :
;: ;
} 	
}   
}!! ý5
]C:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\Infrastructure.Data\MigrationSupport.cs
	namespace 	
Infrastructure
 
. 
Data 
{ 
public%% 

class%% 
MigrationSupport%% !
{&& 
private'' 
readonly'' 
MigrationBuilder'' )
_migrationBuilder''* ;
;''; <
private(( 
readonly(( 4
(SqlColumnEncryptionAzureKeyVaultProvider(( A
_akvProvider((B N
=((O P
null((Q U
!((U V
;((V W
private)) 
readonly)) 
string)) 
s_algorithm))  +
=)), -
$str)). 8
;))8 9
public++ 
MigrationSupport++ 
(++  
MigrationBuilder++  0
migrationBuilder++1 A
,++A B"
DefaultAzureCredential++C Y

credential++Z d
)++d e
{,, 	
_migrationBuilder-- 
=-- 
migrationBuilder--  0
;--0 1
_akvProvider// 
=// 
new// 
(// 

credential// )
)//) *
;//* +
}00 	
public99 
void99 !
CreateColumnMasterKey99 )
(99) *
string99* 0
urlAKVMasterKeyUrl991 C
,99C D
string99E K
cmkName99L S
)99S T
{:: 	
string;;  
KeyStoreProviderName;; '
=;;( )4
(SqlColumnEncryptionAzureKeyVaultProvider;;* R
.;;R S
ProviderName;;S _
;;;_ `
byte== 
[== 
]== 
cmkSign== 
=== 
_akvProvider== )
.==) *'
SignColumnMasterKeyMetadata==* E
(==E F
urlAKVMasterKeyUrl==F X
,==X Y
true==Z ^
)==^ _
;==_ `
string>> 

cmkSignStr>> 
=>> 
string>>  &
.>>& '
Concat>>' -
(>>- .
$str>>. 2
,>>2 3
BitConverter>>4 @
.>>@ A
ToString>>A I
(>>I J
cmkSign>>J Q
)>>Q R
.>>R S
Replace>>S Z
(>>Z [
$str>>[ ^
,>>^ _
string>>` f
.>>f g
Empty>>g l
)>>l m
)>>m n
;>>n o
string@@ 
sql@@ 
=@@ 
$@"AA 
$strAA -
{AA- .
cmkNameAA. 5
}AA5 6
$strAC6 4
{CC4 5 
KeyStoreProviderNameCC5 I
}CCI J
$strCDJ %
{DD% &
urlAKVMasterKeyUrlDD& 8
}DD8 9
$strDE9 :
{EE: ;

cmkSignStrEE; E
}EEE F
$strEFF 
"FF 
;FF 
_migrationBuilderHH 
.HH 
SqlHH !
(HH! "
sqlHH" %
)HH% &
;HH& '
}II 	
publicRR 
voidRR %
CreateColumnEncryptionKeyRR -
(RR- .
stringRR. 4
urlAKVMasterKeyUrlRR5 G
,RRG H
stringRRI O
cmkNameRRP W
,RRW X
stringRRY _
cekNameRR` g
)RRg h
{SS 	
stringTT 
sqlTT 
=TT 
$@"UU 
$strUU 5
{UU5 6
cekNameUU6 =
}UU= >
$strUW> 1
{WW1 2
cmkNameWW2 9
}WW9 :
$strWX: )
{XX) *
s_algorithmXX* 5
}XX5 6
$strXY6 .
{YY. /
GetEncryptedValueYY/ @
(YY@ A
urlAKVMasterKeyUrlYYA S
)YYS T
}YYT U
$strYZU 
"ZZ 
;ZZ 
_migrationBuilder\\ 
.\\ 
Sql\\ !
(\\! "
sql\\" %
)\\% &
;\\& '
}]] 	
private__ 
string__ 
GetEncryptedValue__ (
(__( )
string__) /
urlAKVMasterKeyUrl__0 B
)__B C
{`` 	
byteaa 
[aa 
]aa (
plainTextColumnEncryptionKeyaa /
=aa0 1
newaa2 5
byteaa6 :
[aa: ;
$numaa; =
]aa= >
;aa> ?!
RandomNumberGeneratorbb !
.bb! "
Createbb" (
(bb( )
)bb) *
.bb* +
GetBytesbb+ 3
(bb3 4(
plainTextColumnEncryptionKeybb4 P
)bbP Q
;bbQ R
bytecc 
[cc 
]cc (
encryptedColumnEncryptionKeycc /
=cc0 1
_akvProvidercc2 >
.cc> ?&
EncryptColumnEncryptionKeycc? Y
(ccY Z
urlAKVMasterKeyUrlccZ l
,ccl m
s_algorithmccn y
,ccy z)
plainTextColumnEncryptionKey	cc{ —
)
cc— ˜
;
cc˜ ™
stringdd 
EncryptedValuedd !
=dd" #
stringdd$ *
.dd* +
Concatdd+ 1
(dd1 2
$strdd2 6
,dd6 7
BitConverterdd8 D
.ddD E
ToStringddE M
(ddM N(
encryptedColumnEncryptionKeyddN j
)ddj k
.ddk l
Replaceddl s
(dds t
$strddt w
,ddw x
stringddy 
.	dd €
Empty
dd€ …
)
dd… †
)
dd† ‡
;
dd‡ ˆ
returnee 
EncryptedValueee !
;ee! "
}ff 	
publicss 
voidss !
AlterColumnEncryptionss )
(ss) *
stringss* 0
cekNamess1 8
,ss8 9
stringss: @
	tableNamessA J
,ssJ K
stringtt 
columnNameAndTypett $
,tt$ %
stringtt& ,
?tt, -
collatett. 5
=tt6 7
$strtt8 U
,ttU V
stringttW ]
encTypett^ e
=ttf g
$strtth w
,ttw x
stringuu 
	algorithmuu 
=uu 
$struu >
,uu> ?
booluu@ D
isNulluuE K
=uuL M
trueuuN R
)uuR S
{vv 	
stringww 
nullabilityww 
=ww  
isNullww! '
?ww( )
$strww* ,
:ww- .
$strww/ 5
;ww5 6
stringxx 
sqlxx 
=xx 
$@"xx 
$strxx (
{xx( )
	tableNamexx) 2
}xx2 3
$strxy3 -
{yy- .
columnNameAndTypeyy. ?
}yy? @
$stryz@  
{zz  !
collatezz! (
}zz( )
$strz{) :
{{{: ;
encType{{; B
}{{B C
$str{|C 5
{||5 6
	algorithm||6 ?
}||? @
$str|}@ A
{}}A B
cekName}}B I
}}}I J
$str}}J M
{}}M N
nullability}}N Y
}}}Y Z
$str}}Z ^
"}}^ _
;}}_ `
_migrationBuilder~~ 
.~~ 
Sql~~ !
(~~! "
sql~~" %
)~~% &
;~~& '
} 	
}
€€ 
} …)
tC:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\Infrastructure.Data\Migrations\20210623215531_InitialCreate.cs
	namespace 	
Infrastructure
 
. 
Data 
. 

Migrations (
{ 
public 

partial 
class 
InitialCreate &
:' (
	Migration) 2
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{		 	
migrationBuilder

 
.

 
EnsureSchema

 )
(

) *
name 
: 
$str 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str  
,  !
schema 
: 
$str 
, 
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
Guid& *
>* +
(+ ,
type, 0
:0 1
$str2 D
,D E
nullableF N
:N O
falseP U
)U V
,V W
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 E
,E F
	maxLengthG P
:P Q
$numR U
,U V
nullableW _
:_ `
falsea f
)f g
,g h

IsComplete 
=  
table! &
.& '
Column' -
<- .
bool. 2
>2 3
(3 4
type4 8
:8 9
$str: ?
,? @
nullableA I
:I J
falseK P
)P Q
,Q R
Status 
= 
table "
." #
Column# )
<) *
int* -
>- .
(. /
type/ 3
:3 4
$str5 :
,: ;
nullable< D
:D E
falseF K
)K L
,L M
CreatedDate 
=  !
table" '
.' (
Column( .
<. /
DateTime/ 7
>7 8
(8 9
type9 =
:= >
$str? M
,M N
nullableO W
:W X
falseY ^
)^ _
,_ `
	CreatedBy 
= 
table  %
.% &
Column& ,
<, -
string- 3
>3 4
(4 5
type5 9
:9 :
$str; J
,J K
	maxLengthL U
:U V
$numW Z
,Z [
nullable\ d
:d e
falsef k
)k l
,l m
UpdatedDate 
=  !
table" '
.' (
Column( .
<. /
DateTime/ 7
>7 8
(8 9
type9 =
:= >
$str? M
,M N
nullableO W
:W X
falseY ^
)^ _
,_ `
	UpdatedBy 
= 
table  %
.% &
Column& ,
<, -
string- 3
>3 4
(4 5
type5 9
:9 :
$str; J
,J K
	maxLengthL U
:U V
$numW Z
,Z [
nullable\ d
:d e
truef j
)j k
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 2
,2 3
x4 5
=>6 8
x9 :
.: ;
Id; =
)= >
. 

Annotation #
(# $
$str$ 9
,9 :
false; @
)@ A
;A B
} 
) 
; 
migrationBuilder!! 
.!! 
CreateIndex!! (
(!!( )
name"" 
:"" 
$str"" (
,""( )
schema## 
:## 
$str## 
,## 
table$$ 
:$$ 
$str$$ !
,$$! "
column%% 
:%% 
$str%% 
,%% 
unique&& 
:&& 
true&& 
)&& 
.'' 

Annotation'' 
('' 
$str'' 1
,''1 2
true''3 7
)''7 8
;''8 9
}(( 	
	protected** 
override** 
void** 
Down**  $
(**$ %
MigrationBuilder**% 5
migrationBuilder**6 F
)**F G
{++ 	
migrationBuilder,, 
.,, 
	DropTable,, &
(,,& '
name-- 
:-- 
$str--  
,--  !
schema.. 
:.. 
$str.. 
).. 
;..  
}// 	
}00 
}11 ³
XC:\Users\Eben\source\repos\Veracity\ECS\ECS.SampleApp\Infrastructure.Data\TodoContext.cs
	namespace 	
Infrastructure
 
. 
Data 
{		 
public

 

class

 
TodoContext

 
:

 
DbContextBase

 ,
{ 
public 
TodoContext 
( 
DbContextOptions +
<+ ,
TodoContext, 7
>7 8
options9 @
)@ A
: 
base 
( 
options 
) 
{ 	
} 	
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
base 
. 
OnModelCreating  
(  !
modelBuilder! -
)- .
;. /
modelBuilder 
. 
HasDefaultSchema )
() *
$str* 0
)0 1
;1 2
foreach 
( 
var 
property !
in" $
modelBuilder% 1
.1 2
Model2 7
.7 8
GetEntityTypes8 F
(F G
)G H
. 

SelectMany 
( 
t 
=>  
t! "
." #
GetProperties# 0
(0 1
)1 2
)2 3
. 
Where 
( 
p 
=> 
p 
. 
ClrType %
==& (
typeof) /
(/ 0
decimal0 7
)7 8
||9 ;
p< =
.= >
ClrType> E
==F H
typeofI O
(O P
decimalP W
?W X
)X Y
)Y Z
)Z [
{ 
if 
( 
property 
. 
GetColumnType *
(* +
)+ ,
==- /
null0 4
)4 5
property6 >
.> ?
SetColumnType? L
(L M
$strM \
)\ ]
;] ^
}   
foreach"" 
("" 
var"" 
property"" !
in""" $
modelBuilder""% 1
.""1 2
Model""2 7
.""7 8
GetEntityTypes""8 F
(""F G
)""G H
.## 

SelectMany## 
(## 
t## 
=>##  
t##! "
.##" #
GetProperties### 0
(##0 1
)##1 2
)##2 3
.$$ 
Where$$ 
($$ 
p$$ 
=>$$ 
p$$ 
.$$ 
ClrType$$ %
==$$& (
typeof$$) /
($$/ 0
DateTime$$0 8
)$$8 9
||$$: <
p$$= >
.$$> ?
ClrType$$? F
==$$G I
typeof$$J P
($$P Q
DateTime$$Q Y
?$$Y Z
)$$Z [
)$$[ \
)$$\ ]
{%% 
if&& 
(&& 
property&& 
.&& 
GetColumnType&& *
(&&* +
)&&+ ,
==&&- /
null&&0 4
)&&4 5
property&&6 >
.&&> ?
SetColumnType&&? L
(&&L M
$str&&M X
)&&X Y
;&&Y Z
}'' 
modelBuilder** 
.** 
ApplyConfiguration** +
(**+ ,
new**, /!
TodoItemConfiguration**0 E
(**E F
)**F G
)**G H
;**H I
}++ 	
public.. 
DbSet.. 
<.. 
TodoItem.. 
>.. 
	TodoItems.. (
{..) *
get..+ .
;... /
set..0 3
;..3 4
}..5 6
=..7 8
null..9 =
!..= >
;..> ?
}// 
}00 