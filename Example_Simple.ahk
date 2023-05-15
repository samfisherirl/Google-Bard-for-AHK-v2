#Include bard.ahk

session_token := "xxxxxxxxxxxxxxxxxxxxxxxxxx."
Barder := Bard(session_token)



Barder.Connect()
response := Barder.ask("Whats the average weather in Fiji?")
MsgBox(response)

Barder.Close()


