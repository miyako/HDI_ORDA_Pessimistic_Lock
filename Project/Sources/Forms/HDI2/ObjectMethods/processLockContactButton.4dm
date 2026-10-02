If (btnTrace)
	TRACE:C157
End if 

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		ALERT:C41("This creates another process which locks and updates the edited contact."+Char:C90(13)+Char:C90(13)+"So the stamp will change")
		
		PS_locker_and_updater(Form:C1466.contactToUpdate.getKey())  //Another process updates the entity
		
		DELAY PROCESS:C323(Current process:C322; 30)
		
		OBJECT SET ENABLED:C1123(*; "processLockContactButton"; False:C215)
		OBJECT SET ENABLED:C1123(*; "updateContactButton"; True:C214)
		
End case 
