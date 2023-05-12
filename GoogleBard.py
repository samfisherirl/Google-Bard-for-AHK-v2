from os import environ
from Bard import Chatbot
from pathlib import Path
from shutil import move

cwd = Path(__file__).parent

class Bot:
    def __init__(self):
        self.lock = False
        self.key = cwd / "token.txt"
        self.lock_path = cwd / "lock.txt"
        self.request = ""
        self.response = ""
        self.response_path = cwd / "response.txt"
        self.request_path = cwd / "request.txt"
        self.trash = cwd / "trsh.txt"
        self.token = self.getKey()

    def getKey(self):
        if self.key.is_file():
            with open(self.key, "r") as f:
                return str(f.read()).strip()
        else:
            print("error, no key.txt file")
        
    def checkLock(self):
        if self.lock_path.is_file():
            self.lock = True
        else: 
            self.lock = False
            
    def getRequest(self):
        if self.request_path.is_file():
            with open(self.request_path, "r") as f:
                self.request = str(f.read()).strip()
            move(self.request_path, self.trash)
        else:
            self.request = False
        
    def writeResponse(self):
        if self.response_path.is_file():
            move(self.response_path, self.trash)
        with open(self.response_path, "w") as f:
            f.write(self.response["content"])
        
 
if __name__ == "__main__":
    bot = Bot()
    chatbot = Chatbot(bot.token)
    bot.checkLock()
    while bot.lock:
        bot.getRequest()
        if bot.request:
            bot.response = chatbot.ask(bot.request)
            bot.writeResponse()
        bot.checkLock()
        if bot.lock == False:
            break
