//%attributes = {}
C_TEXT:C284($txtContacts)
C_COLLECTION:C1488($contactsColl)


$txtContacts:=Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"contacts_data.json")

$contactsColl:=JSON Parse:C1218($txtContacts)

ds:C1482.Contact.all().drop()

ds:C1482.Contact.fromCollection($contactsColl)
