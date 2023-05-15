#Include bard.ahk
#Requires Autohotkey v2.0
/*https://github.com/samfisherirl/Google-Bard-for-AHK-v2 
For API access (2mins):
Go to https://bard.google.com/
F12 for console Copy the values
Session: Go to Application → Cookies → . Copy the value of that cookie.__Secure-1PSID and paste into session_token
*/
global Barder := False
global session_token := "xxxxxxx"

myGui := Gui()
myGui.SetFont("s12", "Consolas")
UserInput := myGui.Add("Edit", "x16 y584 w417 h141 ")
GoogleBotField := myGui.Add("Edit", "x16 y48 w417 h522 ReadOnly")
myGui.Add("Text", "x16 y0 w320 h33 +0x200", "Have a convo with Google Bard")
GoogleBotField.SetFont("s9")
ogcButtonRequest := myGui.Add("Button", "x16 y736 w131 h33", "Request")
ogcButtonRequest.OnEvent("Click", OnEventHandler)

ogcButtonClose := myGui.Add("Button", "x301 y736 w131 h33", "Close")
ogcButtonClose.OnEvent("Click", OnEventHandler)
myGui.Title := "Google Bard Bot"
myGui.Show("w445 h788")
Return

$~Enter::
{
	If WinActive(myGui.Hwnd) {
		OnEventHandler()
	}
}

OnEventHandler(*)
{
	global Barder, session_token
	divider := "`n*******************************`n"
	if !Barder {
		Barder := Bard(session_token)
		Barder.Connect()
		; Barder.Close()
	}
	request := Trim(UserInput.Value)
	if InStr(request, "`n") {
			request := StrReplace(request, "`n", " ")
	}
	originalBotField := GoogleBotField.Value 
	UserInput.Value := ""
	GoogleBotField.Value :=  Format("asking...{1}`n`n{2}", request, GoogleBotField.Value) 
	response := Barder.ask(request)
	response := Format("{3}{1}: `n{2}`n`n", request, response, divider)
	GoogleBotField.Value := response . originalBotField
}

GuiEscape(*)
{ ; V1toV2: Added bracket
GuiClose:
	Barder.Close()
	ExitApp()
} ; Added bracket in the end
