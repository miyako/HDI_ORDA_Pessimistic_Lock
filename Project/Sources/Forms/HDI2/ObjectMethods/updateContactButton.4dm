
If (btnTrace)
	TRACE:C157
End if 


Form:C1466.saveLockStatus:=Form:C1466.contactToUpdate.save()

If (Not:C34(Form:C1466.saveLockStatus.success))
	
	OBJECT SET VISIBLE:C603(*; "save_KO@"; True:C214)
	
	OBJECT SET ENABLED:C1123(*; "updateContactButton"; False:C215)
	OBJECT SET ENABLED:C1123(*; "lockContactButton"; True:C214)
	
End if 

manageTexts
