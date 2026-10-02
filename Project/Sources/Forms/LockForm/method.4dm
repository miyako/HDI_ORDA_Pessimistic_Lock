C_OBJECT:C1216($statusLock; $statusSave; $statusUnLock)


If (btnTrace)
	TRACE:C157
End if 


Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.contact:=ds:C1482.Contact.get(idToLock)  //Get the contact to lock
		
		$statusLock:=Form:C1466.contact.lock()  //Lock the contact
		
		If ($statusLock.success)  // The lock action is successful
			Form:C1466.contact.lastName:=Form:C1466.contact.lastName+" ****"
			$statusSave:=Form:C1466.contact.save()  // This update causes the stamp to change
		End if 
		
	: (Form event code:C388=On Unload:K2:2)
		
		$statusUnLock:=Form:C1466.contact.unlock()  //Unlock the contact
		
		If ($statusUnLock.success)  // The unlock action is successful
			ALERT:C41("The contact "+Form:C1466.contact.firstName+" "+Form:C1466.contact.lastName+" has been successfully unlocked")
		End if 
		
End case 

btnTrace:=False:C215