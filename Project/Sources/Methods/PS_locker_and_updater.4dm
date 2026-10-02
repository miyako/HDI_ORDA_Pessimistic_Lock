//%attributes = {"invisible":true}
#DECLARE($id : Integer; $inNewProcess : Integer)  // $id: primary key of the entity to lock; $inNewProcess: omit to create the process

var $ps; $win : Integer

If (Count parameters:C259=1)
	
	$ps:=New process:C317(Current method name:C684; 0; Current method name:C684; $id; 0; *)
	
Else 
	
	btnTrace:=False:C215
	
	$win:=Open form window:C675("LockForm"; Plain form window:K39:10; On the right:K39:3; Vertically centered:K39:4)
	DIALOG:C40("LockForm"; New object:C1471("idToLock"; $id))
	
End if 
