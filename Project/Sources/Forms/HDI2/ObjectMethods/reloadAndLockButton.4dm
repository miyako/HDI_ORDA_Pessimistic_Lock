

If (btnTrace)
	TRACE:C157
End if 


var $fg; $bg : Integer

Form:C1466.saveLockStatus:=Form:C1466.contactToUpdate.lock(dk reload if stamp changed:K85:15)  // Reload and lock the entity

If (Form:C1466.saveLockStatus.success)  // The reload and lock action is successfull
	
	OBJECT SET VISIBLE:C603(*; "lock_KO@"; False:C215)
	
	OBJECT GET RGB COLORS(*; "refReloadedColour"; $fg; $bg)  // theme-aware colour defined in styleSheets.css
	OBJECT SET RGB COLORS:C628(*; "contactToLock@"; $bg; Background color:K23:2)
	OBJECT SET FONT STYLE:C166(*; "contactToLock@"; Bold:K14:2)
	
	OBJECT SET VISIBLE:C603(*; "reload_OK@"; True:C214)
	
	OBJECT SET ENABLED:C1123(*; "reloadAndLockButton"; False:C215)
	OBJECT SET ENABLED:C1123(*; "updateContactButton2"; True:C214)
	
End if 

manageTexts