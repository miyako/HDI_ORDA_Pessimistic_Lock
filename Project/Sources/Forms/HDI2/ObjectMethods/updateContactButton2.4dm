
If (btnTrace)
	TRACE:C157
End if 


var $fg; $bg : Integer

Form:C1466.saveLockStatus:=Form:C1466.contactToUpdate.save()

If (Form:C1466.saveLockStatus.success)  //The save action is successful
	
	Form:C1466.saveLockStatus:=Form:C1466.contactToUpdate.unlock()  // Unlock the contact as the update is successfully done
	
	If (Form:C1466.saveLockStatus.success)  // The unlock is successful
		
		OBJECT SET VISIBLE:C603(*; "reload_OK@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "save_OK@"; True:C214)
		
		OBJECT SET ENABLED:C1123(*; "updateContactButton2"; False:C215)
		
		OBJECT GET RGB COLORS(*; "refSavedColour"; $fg; $bg)  // theme-aware colour defined in styleSheets.css
		OBJECT SET RGB COLORS:C628(*; "contactToLock@"; $bg; Background color:K23:2)
		OBJECT SET FONT STYLE:C166(*; "contactToLock@"; Bold:K14:2)
		
	End if 
	
End if 

