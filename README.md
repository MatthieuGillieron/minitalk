# Minitalk  - Projet 42

[![English](https://img.shields.io/badge/English-blue.svg)](./READMEen.md)   [![Français](https://img.shields.io/badge/Français-gray.svg)](./README.md)  

Le projet **Minitalk** consiste à créer un système de communication simple entre un client et un serveur en utilisant les signaux Unix. Le serveur reçoit des messages du client et les affiche. Ce projet met en pratique des concepts liés à la programmation système, à la gestion des processus, et aux signaux Unix.  


## 🕹️ Fonctionnalités  

Voici les fonctionnalités implémentées dans ce projet :  

### Communication entre client et serveur :  
- Le serveur démarre, affiche son PID, et reste en attente de messages.  
- Le client envoie un message au serveur, caractère par caractère, en utilisant les signaux Unix (`SIGUSR1` et `SIGUSR2`).  
- Le serveur reçoit ces signaux, reconstitue le message, et l’affiche sur la sortie standard.  

### Gestion des signaux :  
- Les signaux Unix sont utilisés pour transmettre les données.  
- Une gestion robuste des erreurs est mise en place (PID invalide, absence de serveur, etc.).  


## 🛠️ Technologies utilisées  

- **Langage** : C  
- **Signaux Unix** : `SIGUSR1` et `SIGUSR2`  
- **Compilation** : Makefile  
- **Norme** : Respect strict de la norme 42  

---

## 🚀 Comment exécuter le projet  

### 1. Clonez ce dépôt :  
```bash  
git clone https://github.com/MatthieuGillieron/minitalk.git  
cd minitalk
```
	
### 2. Compilez les fichiers :
```bash
make
```
### 3. Lancez le serveur :
```bash
./server  
```

### 4. Envoyez un message avec le client :
```bash
./client <PID_du_serveur> "Votre message ici"  

