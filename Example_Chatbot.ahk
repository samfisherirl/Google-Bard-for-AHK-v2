#Include bard.ahk
#Requires Autohotkey v2.0
;AutoGUI 2.5.8
;Auto-GUI-v2 credit to Alguimist autohotkey.com/boards/viewtopic.php?f=64&t=89901
;AHKv2converter credit to github.com/mmikeww/AHK-v2-script-converter
global Barder := False


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
	global Barder
	if !Barder {
		session_token := "x."
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
	response := Format("{1}: `n{2}`n`n", request, response)
	GoogleBotField.Value := response . originalBotField
}

GuiEscape(*)
{ ; V1toV2: Added bracket
GuiClose:
	Barder.Close()
	ExitApp()
} ; Added bracket in the end
