# Minitalk - 42 Project  

The **Minitalk** project consists of creating a simple communication system between a client and a server using Unix signals. The server receives messages from the client and displays them. This project applies concepts related to **system programming, process management, and Unix signals**.  

## 🕹️ Features  

Here are the features implemented in this project:  

### Client-Server Communication:  
- The server starts, displays its PID, and waits for incoming messages.  
- The client sends a message to the server, character by character, using Unix signals (`SIGUSR1` and `SIGUSR2`).  
- The server receives these signals, reconstructs the message, and displays it on the standard output.  

### Signal Handling:  
- Unix signals are used to transmit data.  
- Robust error handling is implemented (invalid PID, missing server, etc.).  

## 🛠️ Technologies Used  

- **Language:** C  
- **Unix Signals:** `SIGUSR1` and `SIGUSR2`  
- **Compilation:** Makefile  
- **Code Standard:** Strict compliance with 42’s coding norms  

---

## 🚀 How to Run the Project  

### 1. Clone this repository:  
```bash  
git clone https://github.com/MatthieuGillieron/minitalk.git  
cd minitalk

