//%attributes = {}

C_BOOLEAN:C305(btnTrace)

//Business logic related to ORDA

OBJECT SET ENABLED:C1123(*; "processLockContactButton"; True:C214)
OBJECT SET ENABLED:C1123(*; "updateContactButton"; False:C215)
OBJECT SET ENABLED:C1123(*; "lockContactButton"; False:C215)
OBJECT SET ENABLED:C1123(*; "reloadAndLockButton"; False:C215)
OBJECT SET ENABLED:C1123(*; "updateContactButton2"; False:C215)

OBJECT SET VISIBLE:C603(*; "save_KO@"; False:C215)
OBJECT SET VISIBLE:C603(*; "lock_KO@"; False:C215)
OBJECT SET VISIBLE:C603(*; "reload_OK@"; False:C215)
OBJECT SET VISIBLE:C603(*; "save_OK@"; False:C215)

OBJECT SET RGB COLORS:C628(*; "contactToLock@"; 0x0000; Background color:K23:2)
OBJECT SET FONT STYLE:C166(*; "contactToLock@"; Plain:K14:1)

buildDataFromJSON

Form:C1466.contactToUpdate:=ds:C1482.Contact.all().first()

btnTrace:=False:C215
