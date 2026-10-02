var $statusLock; $statusSave; $statusUnLock : Object
var $message : Text


If (btnTrace)
	TRACE:C157
End if 


Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.contact:=ds:C1482.Contact.get(Form:C1466.idToLock)  //Get the contact to lock
		
		$statusLock:=Form:C1466.contact.lock()  //Lock the contact
		
		If ($statusLock.success)  // The lock action is successful
			Form:C1466.contact.lastName:=Form:C1466.contact.lastName+" ****"
			$statusSave:=Form:C1466.contact.save()  // This update causes the stamp to change
		End if 
		
	: (Form event code:C388=On Unload:K2:2)
		
		$statusUnLock:=Form:C1466.contact.unlock()  //Unlock the contact
		
		If ($statusUnLock.success)  // The unlock action is successful
			$message:=Localized string("AlertContactUnlocked")
			$message:=Replace string:C233($message; "{firstName}"; Form:C1466.contact.firstName)
			$message:=Replace string:C233($message; "{lastName}"; Form:C1466.contact.lastName)
			ALERT:C41($message)
		End if 
		
End case 

btnTrace:=False:C215