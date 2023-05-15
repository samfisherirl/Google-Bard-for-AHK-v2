#Include bard.ahk
/*https://github.com/samfisherirl/Google-Bard-for-AHK-v2 
For API access (2mins):
Go to https://bard.google.com/
F12 for console Copy the values
Session: Go to Application → Cookies → . Copy the value of that cookie.__Secure-1PSID and paste into session_token
*/

session_token := "xxxxxxxx."

Barder := Bard(session_token)
; instatiate Bard object, writes token to file. Waits for user to make ask or connect to open python exe


response := Barder.singleAsk("Whats the weather like in Fiji?")
MsgBox(response)
; opens connection, asks the question, and upon response the connection to bard is closed. This is slower but less code.




Barder.Connect()
response := Barder.ask("Whats the average weather in Fiji?")
MsgBox(response)
response := Barder.ask("How can I travel there?")
MsgBox(response)
Barder.Close() 
; Connects to bard via python application. stays open until closed, and questions can be concurrent. This is faster for multiple q's as the connection is left open.
 


