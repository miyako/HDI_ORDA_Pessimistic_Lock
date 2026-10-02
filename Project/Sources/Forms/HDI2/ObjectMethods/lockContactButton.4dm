
If (btnTrace)
	TRACE:C157
End if 


Form:C1466.saveLockStatus:=Form:C1466.contactToUpdate.lock()

If (Not:C34(Form:C1466.saveLockStatus.success))  // The lock action failed
	
	Case of 
		: (Form:C1466.saveLockStatus.status=dk status locked:K85:21)  // The entity is already locked
			ALERT:C41("The contact is already locked by the other process"+Char:C90(13)+Char:C90(13)+"Unlock the contact to continue")
			
		: (Form:C1466.saveLockStatus.status=dk status stamp has changed:K85:20)  // The stamp of the entity has changed
			
			OBJECT SET VISIBLE:C603(*; "save_KO@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "lock_KO@"; True:C214)
			
			OBJECT SET ENABLED:C1123(*; "lockContactButton"; False:C215)
			OBJECT SET ENABLED:C1123(*; "reloadAndLockButton"; True:C214)
	End case 
	
End if 

manageTexts
