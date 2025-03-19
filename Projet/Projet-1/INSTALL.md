# **Documentation Administrateur:**

## [1 Installation et configuration du serveur débian 12](https://github.com/WildCodeSchool/TSSR-2409-P1-G4-Serveur-de-contenus-multimedia/blob/main/INSTALL.md#installation-et-configuration-du-serveur-d%C3%A9bian-12-)
## [2 installation et configuration du protocole NFS](https://github.com/WildCodeSchool/TSSR-2409-P1-G4-Serveur-de-contenus-multimedia/blob/main/INSTALL.md#configuration-et-installation-du-protocole-nfs)
## [3 Instalation de PMS sur serveur](https://github.com/WildCodeSchool/TSSR-2409-P1-G4-Serveur-de-contenus-multimedia/blob/main/INSTALL.md#instaltion-de-pms-sur-le-serveur-)


 #### **Installation et configuration du serveur débian 12 :**
* ##### Commencer par télécharger [Débian 12](https://www.debian.org/distrib/?ref=belginux.com) .
  * ##### Choisissez votre version en 64 et 32 bits 
* ##### Une fois l'ISO téléchargé il faudra une clé bootable, je vous renvoie à cette article [lecrabeinfo](https://lecrabeinfo.net/creer-cle-usb-installation-bootable-live-cd-linux-ubuntu-debian.html?ref=belginux.com)
* ##### Une fois booté sélectionnez **Graphical install**:
![image](https://belginux.com/content/images/2023/12/1.png)
* ##### Sélectionnez votre langue d'installation :
![image](https://github.com/user-attachments/assets/f6d1f54a-18e9-485e-b416-7fe373e221bc)
* ##### Sélectionnez les paramètres régionaux: 
![image](https://github.com/user-attachments/assets/e4db626b-091c-43a8-8022-0922618e7aab)

* ##### On configure son clavier :
![image](https://github.com/user-attachments/assets/98d1c3ce-f205-4679-9101-3eb8e6e739fe)

* ##### On donne un nom au serveur, peu importe:

 ![image](https://github.com/user-attachments/assets/caf811f2-d826-4296-a7eb-af99b59ac55d)

 
 * ##### Laissez vide ou mettez localdomain : 
 ![image](https://github.com/user-attachments/assets/019e42fd-7232-40a0-8823-ef308e0e1014)

* ##### Choisissez un mot de passe fort pour le compte root, celui qui a tout les privilèges:
![image](https://github.com/user-attachments/assets/b8ab1690-378b-49b7-a1c1-96ab8a0a8b14)

* ##### Création du compte Utilisateur :
![image](https://belginux.com/content/images/size/w1600/2023/12/8-1.png)
* ##### Création du Login :
 ![image](https://belginux.com/content/images/size/w1600/2023/12/9.png)
* ##### Mot de passe compte :
![image](https://github.com/user-attachments/assets/3b58db3b-b12c-4ab2-b2ae-70cf58661346)

* ##### On choisi le mode de partitionnement, Assisté - utiliser un disque entier:
![image](https://github.com/user-attachments/assets/5ff2ec5a-0b75-4d07-ae7c-b574d13635f9)

* ##### On sélectionne le disque où sera installé Debian 12 serveur:
![image](https://belginux.com/content/images/size/w1600/2023/12/12-2.png)
* ##### On va choisir l'option Tout dans une seule partition:
![image](https://github.com/user-attachments/assets/fdf17647-034b-4f1c-8fae-59d85ea05fc2)

* ##### Sélectionnez Terminer le partitionnement et appliquer les changements:
![image](https://github.com/user-attachments/assets/30df086c-d6d6-4210-b456-61d1305f38df)

* ##### On valide par Oui:
![image](https://github.com/user-attachments/assets/25bc4f95-8b45-4ca6-8590-6a07c2b646b4)

* ##### Choisir Non : 
  ![image](https://github.com/user-attachments/assets/fc043a54-5328-448a-92db-40ee1298303b)

* ##### Choisir un miroir correspondant généralement au pays ou l'on se trouve.
![image](https://github.com/user-attachments/assets/df64d7ed-82b5-46e9-99e1-acf4c5842fb5)

* ##### Ici vous pouvez choisir deb.debian.org:
![image](https://github.com/user-attachments/assets/e2ede3ce-1820-4c25-b14c-74dd373c15ff)

* ##### On laisse vide et on continue
![image](https://github.com/user-attachments/assets/51fd8c3d-1291-48a6-ae87-9da885a981d2)


*  ##### A vous de choisir.
   ![image](https://github.com/user-attachments/assets/70daf593-8bcb-4e03-ae2f-d68c16b76f84)

*  ##### Il ne faut pas d'environnement de bureau vu que l'on veut installer Debian 12 comme serveur, cochez et décochez suivant l'exemple. Nous avons besoin du SSH et on peut cocher les utilitaires usuels du système:
  ![image](https://github.com/user-attachments/assets/7770ecc9-adcf-4744-a0e8-860a641efad8)

* ##### On choisi d'installer [GRUB](https://fr.wikipedia.org/wiki/GNU_GRUB) sur le disque principal.
 ![image](https://github.com/user-attachments/assets/3c8ff13f-137f-469e-9a69-9574cb300fc5)

* ##### Selectionnez le disque :
![image](https://github.com/user-attachments/assets/6cfa07f8-1909-488f-8318-0fbbab10d911)

* ##### L'installation est terminée, retirez la clé USB du serveur et cliquez sur Continuer.
###### Toutes les captures ci dessus proviennes de [Belinux](https://belginux.com/installer-facilement-son-serveur-sous-debian-12/#se-connecter-au-serveur)

* ##### le serveur :
 ![image](https://github.com/user-attachments/assets/f1cd4f46-75e8-44ed-981f-6ef9632b4d9b)

* #### **Configuration d'une IP fixe avec Débian 12:**
  * ##### Ouvrez le terminal et exécutez
````        
        sudo nano/etc/network/interfaces
````
  * ##### Configurez l'IP :
````        
        auto eth0
        idface eth0 inet static
        address 172.16.10.10
        netmask 255.255.255.0
        gateway 172.16.10.1             ##### **A VERIFIER**
        dns-nameservers 172.16.10.1
```` 
 * ##### Enregistrez et quitttez l'éditeur
  * ##### Redemarrez le service
````        
        sudo systemct1 restart systemd-networkd
````
![image](https://cdn.discordapp.com/attachments/1292773669319344168/1296057608725332021/Configuration_IP_Serveur_Debian_12.bmp?ex=6710e735&is=670f95b5&hm=ccf08117afc7edb3fa2bf7eddfec59e882148198a1d9a931207a4d91d2e1a298&)

### **Configuration et installation du Protocole [NFS](https://fr.wikipedia.org/wiki/Network_File_System)**
 #### **Installation du paquet :**
* ##### mettre à jour le cache des paquets:
````
      sudo apt-get update
````
* ##### Installer le paquet "nfs-kernel-server" :`
 
`````
sudo apt-get install nfs-kernel-server
`````
![image](https://www.it-connect.fr/wp-content-itc/uploads/2021/10/apt-get-install-nfs-server-debian.png)

###### la capture provient de [it-connect](https://www.it-connect.fr/le-protocole-nfs-pour-les-debutants/)
* ##### Configurer le démarrage automatique du service :
````    
   sudo systemctl enable nfs-server.service
````
 #### **Déclaration d'un partage NFS**

* ##### Créer le répertoire à partager :
````
        mkdir /srv/partagenfs
````
* ##### Appliquer les permissions :
````
        chown nobody:nogroup /srv/partagenfs/
        chmod 755 /srv/partagenfs/
````

* ##### Éditer le fichier de configuration /etc/exports :
 ````       
        sudo nano /etc/exports
````
* ##### Ajouter la ligne suivante :
````
        /srv/partagenfs 172.16.10.10/24(rw,sync,anonuid=65534,anongid=65534,no_subtree_check) 
````
![image](https://www.it-connect.fr/wp-content-itc/uploads/2021/10/serveur-nfs-exports-partage.png)
###### la capture provient de [it-connect](https://www.it-connect.fr/le-protocole-nfs-pour-les-debutants/)

* ##### Appliquer la configuration :
````
        exportfs -a
````

* ##### Vérifier les partages :
````
        showmount -e 172.16.10.10
`````
![image](https://www.it-connect.fr/wp-content-itc/uploads/2021/10/showmount-nfs-exemple.png)
###### la capture provient de [it-connect](https://www.it-connect.fr/le-protocole-nfs-pour-les-debutants/)
 #### **Connexion au partage NFS depuis un client Linux**

* ##### Installer le paquet client NFS :
````
        sudo apt-get install nfs-common
`````
* ##### Créer un point de montage :
````
        mkdir /media/partagenfs
````
* ##### Monter le partage manuellement :
````
        mount -t nfs4 172.16.10.10:/srv/partagenfs /media/partagenfs/
````
* ##### Pour un montage automatique, éditer /etc/fstab :
````
        sudo nano /etc/fstab
````
* ##### Ajouter la ligne :
````
        172.16.10.10:/srv/partagenfs /media/partagenfs nfs4 defaults,user,exec 0 0 
`````
* ##### Monter tous les partages définis dans fstab :
````
         sudo mount -a
````
#### **Capture des paquets NFS avec TCPDUMP**

* ##### Installer tcpdump :
````
        sudo apt-get install tcpdump
````
* ##### Lancer une capture sur les ports NFS :
````
        tcpdump port 2049 or port 111
````
* ##### Vérifier l'activité NFS depuis le client :
````
        ls /media/partagenfs
`````
### Instaltion de [PMS](https://fr.wikipedia.org/wiki/Plex_(logiciel)) sur le serveur :
 
* ##### créer et se déplacer la le dossier Plex
```
        mkdir Plex
        cd Plex
````        
* ##### Télécharger Plex Media Serveur
 ````  
         wget https://downloads.plex.tv/plex-media-server-new/1.41.0.8994-f2c27da23/debian/plexmediaserver_1.41.0.8994-f2c27da23_amd64.deb
````
* ##### installer Plex:
````
            dpkg -i plexmediaserver_1.23.4.4805-186bae04e_amd64.deb
````
* ##### Se rendre sur un navigateur et taper l'URL:
        http://adresseipduserveur:32400/web
        ici : http://172.16.10.10/24:32400/web
* ##### Donner un nom à son serveur
* ##### Suivant ajouter un bibiothéque
* ##### Revenir sur le serveur, pour création de la bibliotéque partagée:
````        
        cd/
        mkdir Films
````
* ##### Ouvrir les droits au partage NFS:
````
        chmod 777 /srv/partagenfs
````

* ##### Vérification du bon fontionnement de PMS:
````![image](https://cdn.discordapp.com/attachments/1292773669319344168/1296057609392230400/Verification_de_la_mise_en_marche_PLEX.bmp?ex=67138a35&is=671238b5&hm=fee72f48a07639989e092bcd198d4c4dd18cd8097afc5a521a987e8942567519&)`
````
