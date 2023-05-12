#Include bard.ahk

session_token := "VgioAJGF46wOHxJLbd8fTfyabTaE3e50d7H4Dbk8MBIA4V7zPye9C9u9egmgighW0p3zrA."
Barder := Bard(session_token)
Barder.Connect()
response := Barder.ask("Whats the average weather in Fiji?")
MsgBox(response)
Barder.Close()