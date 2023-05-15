 

# Reverse engineering Google's Bard chatbot with an AHK wrapper.

This script uses AutoHotkey (AHK) and Python to communicate with Google's Bard AI. The script takes user input and sends it to the AI for analysis. The AI generates a response, which is then displayed to the user in AHK.

# Prerequisites
Before running this script, you'll need to have the following installed:

AutoHotkey (version 2 or higher)
The Python requests library (you can install this using pip)
You'll also need to have a Google API key to use the Bard AI. [Instructions for obtaining an API key can be found in the Bard API documentation.](https://github.com/acheong08/Bard)
You just need the session ID, access is free. 

# Authentication
Go to https://bard.google.com/

F12 for console
Copy the values
<h4>Session: Go to Application → Cookies → __Secure-1PSID. Copy the value of that cookie.<h4>


# Usage
To use this script, follow these steps:

Download the release file from GitHub.
Open the Example.ahk script in AutoHotkey.
Replace Token/Session ID on line 3 with your actual Google API key.
The script will send your query to the Bard AI, which will generate a response. The response will be displayed in AHK.
 
```autohotkey
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
 


```

 ![giphy (1)](https://github.com/samfisherirl/Google-Bard-for-AHK-v2/assets/98753696/b308323b-aafb-48e3-b436-ac5dc62659a8)

# Acknowledgments
This project is based on the work of Alex Cheong. Thank you to Alex for creating the original Python script that this project is based on!
https://github.com/acheong08/Bard



