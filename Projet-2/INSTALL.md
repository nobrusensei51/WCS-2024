# Guide d'installation 

## Machines requises

 1 un serveur Debian 12
   - Nom : SRVLX01
   - Compte : root
   - Mot de passe : Azerty1*
   - Adresse IP fixe : 172.16.10.10/24

 
 2 un client Ubuntu 22.04 LTS
   - Nom : CLILIN01
   - Compte : wilder (dans le groupe sudo)
   - Mot de passe : Azerty1*
   - Adresse IP fixe : 172.16.10.30/24
     
 3 un serveur Windows server
   - Nom : SRVWIN01
   - Compte : Administrator (dans le groupe des admins locaux)
   - Mot de passe : Azerty1*
   - Adresse IP fixe : 172.16.10.5/24
     
 4 un client Windows 10 
   - Nom : CLIWIN01
   - Compte : wilder (dans le groupe sudo)
   - Mot de passe : Azerty1*
   - Adresse IP fixe : 172.16.10.20/24


# Configuration réseau 

Pour le projet , toutes les machines doivent être sur le même réseau .
Pour se faire nous avons choisi de configurer 2 cartes réseaux par machines , la 1er en automatique , configuré en pont et la 2eme en IP fixe configuré en réseau internet

 ## *Configuration adresse IP fixe* ##

 Pour la machines Ubuntu:
 
   - Ouvrir le panneau de configuration interfaces enp0s3
 
   - Aller sur IPv4  
 
   - Cliquer sur "Manual" 
 
   - Entrer Address 172.16.10.30 / Netmask 255.255.255.0 / Gateway 172.16.10.10 
 
   - Appliquer  
 
   - Désactiver et réactiver l'interface  
 
   - Vérifier l'adresse IP  
 

 Pour le serveur Debian:

   - ouvrir le fichier de configuration des interfaces  
 
 ` nano /etc/network/interfaces` 
 
   - modifier le fichier : 
 
 ` iface enp0s3 inet static  
 
       address 172.16.10.10/24 
       gateway 172.16.10.1 `

  Pour les machines sous windows 

 Configurer direct dans l'interfaces 


 ## *Mise en place clé SSH Linux* ##
  
  Activation et démarrage du service SSH :

  Installation du service SSH:
  ` sudo apt install openssh-server `

  Activez SSH pour qu'il démarre automatiquement au démarrage :
   `sudo systemctl enable ssh`
   
  Démarrez le service SSH :
   `sudo systemctl start ssh `
   
 Controler le statut du service :
   `sudo systemctl status ssh`
   `sudo systemctl status sshd`

 Sur le serveur Linux : Générer une clé SSH :  
 
   - Exécutez la commande suivante pour générer une clé SSH :  
     `
     ssh-keygen -t ecdsa  
     `
   - Valider les paramètres par défaut pour l'emplacement fichier  
    
   - laisser vide pour la passphrase ete valider  
    
   - Pour ajouter le clé publique sur le client  
    
     ` ssh-copy-id -i ~/.ssh/id_ecdsa.pub client@<ip_client> `
     
   - entrer "yes" et entrer le mot de passe du client


     
  ## *Mise en place des clés SSH pour windows* ##
  
Générer une paire de clés SSH :

   - Vérifiez que Client OpenSSH est bien installé dans les Paramètres > Applications et fonctionnalités > Fonctionnalités facultatives.  
    
   - Ouvrez PowerShell.  
    
   - Générez une paire de clés SSH avec la commande ssh-keygen en spécifiant l’algorithme de chiffrement désiré.
       `ssh-keygen -t ecdsa`
   
   - Laissez l’emplacement par défaut en appuyant sur Entrée.
        `Generating public/private ecdsa key pair.`  
        `Enter file in which to save the key   
        `Entrez une phrase secrète pour protéger votre clé privée :`  
        `Enter passphrase (empty for no passphrase):`  
        `Enter same passphrase again:`  
        
   - Voilà, votre paire de clés SSH a bien été générée !

   - La clé SSH se trouvent dans le répertoire ~/.ssh/.
         `ls ~ .ssh/
         
   Étape 1 terminée : votre paire de clés SSH (publique et privée) a bien été créée. Prochaine étape : copier la clé publique sur le serveur distant. 👍
    
Copier la clé publique sur le serveur distant
   
Pour établir la connexion SSH par clés SSH, il faut que notre clé publique soit présente dans le fichier ~/.ssh/authorized_keys d’un utilisateur sur le serveur distant.

Pour copier une clé publique sur le compte d’un utilisateur distant, suivez ces instructions :

 
   - Ouvrez PowerShell.
     
   - Saisissez la commande suivante :
        `cat ~/.ssh/id_ecdsa.pub | ssh <username>@<hostname> "cat >> ~/.ssh/authorized_keys"
Remplacez username par le nom d’utilisateur et hostname par l’adresse IP ou le nom d’hôte du serveur.

   - Entrez le mot de passe de l’utilisateur.
Voilà, votre clé publique a bien été copiée dans le fichier ~/.ssh/authorized_keys de l’utilisateur sur le serveur distant !

 
