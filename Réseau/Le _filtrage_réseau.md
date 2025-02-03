# Atelier - Le filtrage réseau sur un serveur GNU/Linux

Création d'un fichier `myrules.nft` qui est une copie du fichier d'exemple de configuration : `/usr/share/doc/nftables/examples/workstation.nft` modifié pour répondre aux demandes de la quête ci-dessous.

Ce fichier `myrules.nft` doit être enregistré dans `/etc/network/interfaces` pour être chargé au démarrage des cartes réseaux, comme ceci :  

![Capture d'écran 2024-12-10 192307](https://github.com/user-attachments/assets/60259a9b-78fc-4b73-a5c8-9cbdd485cafd)

![Capture d'écran 2024-12-10 191802](https://github.com/user-attachments/assets/7af5bb27-00b1-462b-b42a-e55bd2fa4107)  

![Capture d'écran 2024-12-10 191713](https://github.com/user-attachments/assets/34f9812b-058c-4b00-ae42-df6f6b3cb532)

⚠️ **Attention** : À chaque modification dans la table `nft`, il est nécessaire d'enregistrer et de redémarrer le réseau avec la commande suivante :  
`systemctl restart networking.service`  

ℹ️ **Info** : La commande `nft -f /chemin/vers/le/fichier` est utilisée pour charger et appliquer un fichier de configuration de règles pour `nftables`.
