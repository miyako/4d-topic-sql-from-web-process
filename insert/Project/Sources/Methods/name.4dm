//%attributes = {"invisible":true,"preemptive":"capable"}
#DECLARE($length : Integer)->$name : Text

$length:=$length<0 ? 10 : $length
$length:=$length=0 ? 10 : $length

$alphabet:=[]

For ($i; Character code:C91("あ"); Character code:C91("ん"))
	$alphabet.push(Char:C90($i))
End for 

$random:=Formula:C1597($alphabet[Random:C100%$alphabet.length])

For ($i; 1; $length)
	$name:=$name+$random.call()
End for 