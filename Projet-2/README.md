# TSSR-2409-VERT-P2-G4-TheScriptingProject

## 🍀 I. Objectifs  
### 🔱 1 - Objectif principal  
- Depuis une machine Windows Server, on exécute un script Powershell qui cible des ordinateurs Windows  
- Depuis une machine Debian, on exécute un script shell qui cible des ordinateurs Ubuntu  

### 🔱 Objectif secondaire  
- Depuis un serveur, cibler une machine cliente avec un type d'OS différent  

## 🍀 II. Membres de l'équipe  

Pour mener à bien ce projet, nous avons constitué une équipe composée de :  
- William  
- Mohammed  
- Bruno  
- Souhail  

La méthode de travail utilisée est la méthode SCRUM. De ce fait, les rôles _Product Owner_ et _Scurm Master_ seront attribués à tour de rôle chaque semaine.  

## 🍀 III. Éléments à implémenter - Machines  

### 🔱 1 - Clients  

Deux clients seront crées pour ce projet :  

- Un client Ubuntu :  
  - Nom : CLILIN01  
  - Compte utilisateur : wilder (dans le groupe sudo)  
  - Mot de passe : Azerty1*  
  - Adresse IP fixe : 172.16.10.30/24  

- Un client Windows :  
  - Nom : CLIWIN01  
  - Compte utilisateur : wilder (dans le groupe des admins locaux)  
  - Mot de passe : Azerty1*  
  - Adressee IP fixe : 172.16.10.20/24  

### 🔱 2 - Serveurs  

Deux serveurs seront également crées : 

- Un serveur Debian12 :  
  - Nom : SRVLX01  
  - Compte : root  
  - Mot de passe : Azerty1*  
  - Adresse IP fixe : 172.16.10.10/24
 
- Un serveur Windows Server 2022 :
  - Nom : SRVWIN01
  - Compte : Administrator (dans le groupe des admins locaux)
  - Mot de passe : Azerty1*
  - Adresse IP fixe : 172.16.10.5/24
 
## 🍀 IV. Éléments à implémenter - Scripts  

### 🔱 1 - Script Bash  

Un script Bash sera crée, permettant plusieurs actions :  

- Action sur utilisateur
- Action sur ordinateur client
- Information sur utilisateur
- Information sur ordinateur client
- Information sur script

Ce script s'exécute sur le serveur Debian12 et utilise les commandes et instructions shell bash.

 ### 🔱 2 - Script PowerShell

Un script PowerShell sera également crée, permettant les mêmes actions que le script Bash.

Ce script s'exécute sur le servuer Windows Server 2022, sous PowerShell Core.  

## 🍀 V. Documentation  

Une documentation sous format markdown sera rédigée et sera livrée à la fin de ce projet. Elle contiendra :  

- un livrable README.md qui présente le projet, les objectifs, l'équipe et les éléments à implémenter.  
- un livrable INSTALL.md pour les admins contenant les prérequis techniques et les étapes d'installation et de configuration.  
- un livrable USERGUIDE.md pour les utilisateurs, détaillant l'utilisation du script.  
