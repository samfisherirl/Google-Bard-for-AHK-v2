 

# Reverse engineering Google's Bard chatbot API with an AHK wrapper.

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

Clone or download the project from GitHub.
Open the Example.ahk script in AutoHotkey.
Replace Token/Session ID on line 3 with your actual Google API key.
The script will send your query to the Bard AI, which will generate a response. The response will be displayed in AHK.

```autohotkey
session_token := "xxxxxxxx"
Barder := Bard(session_token)
Barder.Connect()
response := Barder.ask("Whats the average weather in Fiji?")
MsgBox(response)
Barder.Close()
```

Acknowledgments
This project is based on the work of Alex Cheong. Thank you to Alex for creating the original Python script that this project is based on!
https://github.com/acheong08/Bard



