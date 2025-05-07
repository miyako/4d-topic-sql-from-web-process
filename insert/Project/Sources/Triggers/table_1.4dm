/*
意図的にSAVEエラーを発生させる例題
nameが「ん」を含んでいる場合は保存できないルール
*/
If (False:C215)
	If (Trigger event:C369=On Saving New Record Event:K3:1)
		If ([Table_1:1]name:2="@ん@")
			return -9999
		End if 
	End if 
End if 