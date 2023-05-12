lock_path := A_ScriptDir "\app\lock.txt"
key_path := A_ScriptDir "\app\token.txt"
temp_path := A_ScriptDir "\app\t.txt"
request_path := A_ScriptDir "\app\request.txt"
response_path := A_ScriptDir "\app\response.txt"
trash_path := A_ScriptDIr "\app\trash.txt"
app_path := A_ScriptDIr "\app\GoogleBard.exe"
fileList := [lock_path, key_path, request_path, response_path, trash_path]


class Bard {
	__New(token) {
		this.clean()
		this.token := token
		this.pid := ""
		this.request := ""
		this.response := ""
		this.openLock()
		this.writeKey()
	}
	connect(){
		this.openApp()
	}
	clean() {
		for i in fileList {
			if FileExist(i) {
				FileMove(i, trash_path, 1)
			}
		}
	}
	openLock() {
		FileAppend(lock_path, lock_path)
	}
	writeKey() {
		FileAppend(this.token, key_path)
	}
	openApp() {
		SplitPath(app_path, ,&dir)
		Run(app_path, dir,,&PID)
		this.PID := PID
	}
	ask(text) {
		this.response := ""
		if FileExist(response_path) {
			FileMove(response_path, trash_path, 1)
		}
		if FileExist(temp_path) {
			FileMove(temp_path, trash_path, 1)
		}
		FileAppend(text, temp_path)
		FileMove(temp_path, request_path, 1)
		return this.responseWait()
	}
	responseWait() {
		While not FileExist(response_path) {
			if FileExist(response_path) {
				break
			}
			else {
				Sleep(10)
			}
		}
		this.response := FileRead(response_path)
		return this.response
	}
	Close() {
		this.clean()
	}
}