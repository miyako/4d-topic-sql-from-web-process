#DECLARE($URL : Text; $preview : Text; $client : Text; $server : Text; $user : Text; $password : Text)

$status:={success: True:C214; values: []}

ARRAY LONGINT:C221($pos; 0)
ARRAY LONGINT:C221($len; 0)

ON ERR CALL:C155("err")

Case of 
	: (Match regex:C1019("\\/dosql\\/(\\d+)"; $URL; 1; $pos; $len))
		
		$values:=[]
		
		var $count; $i : Integer
		$count:=Num:C11(Substring:C12($URL; $pos{1}; $len{1}))
		
		For ($i; 1; $count)
			$name:=name
			$age:=age
			Begin SQL
				insert into Table_1
				(name,age)
				values (:$name,:$age);
			End SQL
			If (OK=1)
				$values.push({name: $name; age: $age})
			Else 
				$values.push({name: "ERROR"; age: "ERROR"})
			End if 
		End for 
		
		$status.success:=True:C214
		$status.values:=$values
		
End case 

ON ERR CALL:C155("")

WEB SEND TEXT:C677(JSON Stringify:C1217($status); "application/json")