### 1.Prérequis de GLPI
 - un serveur Web
 - PHP Minimum : PHP 7.4 (plus supportée !) / Maximum : PHP 8.2
 - une base de donnéesb : MySQL 5.1 minimum /MariaDB 10.2 minimum  

### 2.Préparer le serveur pour installer GLPI  

Commençons par l'installation par une mise à jour des paquets sur la machine Debian 12. Pensez également à lui attribuer une adresse IP et à effectuer la configuration du système.

`sudo apt-get update && sudo apt-get upgrade`  

#### A. Installer le socle LAMP  
 
Commençons par installer ces trois paquets :  

`sudo apt-get install apache2 php mariadb-server`  
   
Puis, nous allons installer toutes les extensions nécessaires au bon fonctionnement de GLPI.  

`sudo apt-get install php-xml php-common php-json php-mysql php-mbstring php-curl php-gd php-intl php-zip php-bz2 php-imap php-apcu`

Si vous envisagez d'associer GLPI avec un annuaire LDAP comme l'Active Directory, vous devez installer l'extension LDAP de PHP. Sinon, ce n'est pas nécessaire et vous pouvez le faire par la suite, si besoin.  

`sudo apt-get install php-ldap`  

#### B. Préparer une base de données pour GLPI  

Nous allons préparer MariaDB pour qu'il puisse héberger la base de données de GLPI. La première action à effectuer, c'est d'exécuter la commande ci-dessous pour effectuer le minimum syndical en matière de sécurisation de MariaDB.

`sudo mysql_secure_installation`  

![image](https://github.com/user-attachments/assets/d793343d-67bf-4453-8b81-feb1db8512d9)    

Connectez-vous à votre instance MariaDB :  

`sudo mysql -u root -p`  

Puis, nous allons exécuter les requêtes SQL ci-dessous pour créer la base de données "db23_glpi" ainsi que l'utilisateur "glpi_adm" avec le mot de passe "MotDePasseRobuste" (que vous changez, bien sûr). Cet utilisateur aura tous les droits sur cette base de données (et uniquement sur celle-ci).

`CREATE DATABASE db23_glpi;`  
`GRANT ALL PRIVILEGES ON db23_glpi.* TO glpi_adm@localhost IDENTIFIED BY "MotDePasseRobuste";`  
`FLUSH PRIVILEGES;`  
`EXIT`  

#### C. Télécharger GLPI et préparer son installation   

L'archive sera téléchargée dans le répertoire "/tmp" :  

`cd /tmp`  
`wget https://github.com/glpi-project/glpi/releases/download/10.0.10/glpi-10.0.10.tgz`   

 Puis, nous allons exécuter la commande ci-dessous pour décompresser l'archive .tgz dans le répertoire "/var/www/", ce qui donnera le chemin d'accès "/var/www/glpi" pour GLPI.  

`sudo tar -xzvf glpi-10.0.10.tgz -C /var/www/ ` 

Nous allons définir l'utilisateur "www-data" correspondant à Apache2, en tant que propriétaire sur les fichiers GLPI.  

`sudo chown www-data /var/www/glpi/ -R`  

Ensuite, nous allons devoir créer plusieurs dossiers et sortir des données de la racine Web (/var/www/glpi) de manière à les stocker dans les nouveaux dossiers que nous allons créer. Ceci va permettre de faire une installation sécurisée de GLPI, qui suit les recommandations de l'éditeur.  

Le répertoire /etc/glpi 

Commencez par créer le répertoire "/etc/glpi" qui va recevoir les fichiers de configuration de GLPI. Nous donnons des autorisations à www-data sur ce répertoire car il a besoin de pouvoir y accéder.  

`sudo mkdir /etc/glpi`  
`sudo chown www-data /etc/glpi/`

Puis, nous allons déplacer le répertoire "config" de GLPI vers ce nouveau dossier :  

`sudo mv /var/www/glpi/config /etc/glpi`  

Le répertoire /var/lib/glpi  

Répétons la même opération avec la création du répertoire "/var/lib/glpi" :  

`sudo mkdir /var/lib/glpi`  
`sudo chown www-data /var/lib/glpi/`

Dans lequel nous déplaçons également le dossier "files" qui contient la majorité des fichiers de GLPI : CSS, plugins, etc.  

`sudo mv /var/www/glpi/files /var/lib/glpi`

Le répertoire /var/log/glpi  

Terminons par la création du répertoire "/var/log/glpi" destiné à stocker les journaux de GLPI. Toujours sur le même principe :  

`sudo mkdir /var/log/glpi`  
`sudo chown www-data /var/log/glpi`  

Nous n'avons rien à déplacer dans ce répertoire.  

Créer les fichiers de configuration  

Nous devons configurer GLPI pour qu'il sache où aller chercher les données. Autrement dit, nous allons déclarer les nouveaux répertoires fraichement créés.  

Nous allons créer ce premier fichier :  

`sudo nano /var/www/glpi/inc/downstream.php`  
Afin d'ajouter le contenu ci-dessous qui indique le chemin vers le répertoire de configuration :  

`<?php`  
`define('GLPI_CONFIG_DIR', '/etc/glpi/');`  
`if (file_exists(GLPI_CONFIG_DIR . '/local_define.php')) {` 
`    require_once GLPI_CONFIG_DIR . '/local_define.php';`  
`}` 

Ensuite, nous allons créer ce second fichier :  

`sudo nano /etc/glpi/local_define.php`

Afin d'ajouter le contenu ci-dessous permettant de déclarer deux variables permettant de préciser les chemins vers les répertoires "files" et "log" que l'on a préparé précédemment.  

`<?php`  
`define('GLPI_VAR_DIR', '/var/lib/glpi/files');`  
`define('GLPI_LOG_DIR', '/var/log/glpi');` 
`Voilà, cette étape est terminée.`  

#### D. Préparer la configuration Apache2    

Passons à la configuration du serveur web Apache2. Nous allons créer un nouveau fichier de configuration qui va permettre de configurer le VirtualHost dédié à GLPI. Dans mon cas, le fichier s'appelle "support.it-connect.tech.conf" en référence au nom de domaine choisi pour accéder à GLPI : support.it-connect.tech. L'idéal étant d'avoir un nom de domaine (même interne) pour accéder à GLPI afin de pouvoir positionner un certificat SSL par la suite.  

`sudo nano /etc/apache2/sites-available/support.it-connect.tech.conf`  

Ce qui donne la configuration suivante (selon le modèle officiel de la documentation) :  

`<VirtualHost *:80>  
    `ServerName support.it-connect.tech`  

    `DocumentRoot /var/www/glpi/public`  

    `# If you want to place GLPI in a subfolder of your site (e.g. your virtual host is serving multiple applications),`  
    `# you can use an Alias directive. If you do this, the DocumentRoot directive MUST NOT target the GLPI directory itself.`  
    `# Alias "/glpi" "/var/www/glpi/public"`  

    `<Directory /var/www/glpi/public> ` 
        `Require all granted`  

        `RewriteEngine On`  

       ` # Redirect all requests to GLPI router, unless file exists.`  
       ` RewriteCond %{REQUEST_FILENAME} !-f`  
       ` RewriteRule ^(.*)$ index.php [QSA,L]`  
  `  </Directory>`  
`</VirtualHost>`  

![image](https://github.com/user-attachments/assets/65328282-cb3b-44ca-8e59-8319923470a3)  

Quand la configuration est prête, enregistrez le fichier.  

Puis, nous allons activer ce nouveau site dans Apache2 :  

`sudo a2ensite support.it-connect.tech.conf`  

Nous en profitons également pour désactiver le site par défaut car il est inutile :  

`sudo a2dissite 000-default.conf`  

Nous allons aussi activer le module "rewrite" (pour les règles de réécriture) car on l'a utilisé dans le fichier de configuration du VirtualHost (RewriteCond / RewriteRule).  

`sudo a2enmod rewrite`  

Il ne reste plus qu'à redémarrer le service Apache2 :  

`sudo systemctl restart apache2`  

#### E. Utilisation de PHP8.2-FPM avec Apache2  

Pour utiliser PHP en tant que moteur de scripts avec Apache2, il y a deux possibilités : utiliser le module PHP pour Apache2 (libapache2-mod-php8.2) ou utiliser PHP-FPM.  

Il est recommandé d'utiliser PHP-FPM car il est plus performant et se présente comme un service indépendant. Dans l'autre mode, chaque processus Apache2 exécute son propre moteur de scripts PHP.  

Si vous souhaitez utiliser PHP-FPM, suivez les étapes ci-dessous. Sinon, passez à la suite mais veillez à configurer l'option "session.cookie_httponly" évoquée ci-dessous.  

Nous allons commencer par installer PHP8.2-FPM avec la commande suivante :  

`sudo apt-get install php8.2-fpm`  

Puis, nous allons activer deux modules dans Apache et la configuration de PHP-FPM, avant de recharger Apache2 :  

`sudo a2enmod proxy_fcgi setenvif`  
`sudo a2enconf php8.2-fpm`  
`sudo systemctl reload apache2`  

Pour configurer PHP-FPM pour Apache2, nous n'allons pas éditer le fichier "/etc/php/8.2/apache2/php.ini" mais plutôt ce fichier :  

`sudo nano /etc/php/8.2/fpm/php.ini`

Dans ce fichier, recherchez l'option "session.cookie_httponly" et indiquez la valeur "on" pour l'activer, afin de protéger les cookies de GLPI.  

`; Whether or not to add the httpOnly flag to the cookie, which makes it`  
`; inaccessible to browser scripting languages such as JavaScript.`  
`; https://php.net/session.cookie-httponly`  
`session.cookie_httponly = on`  

Enregistrez le fichier quand c'est fait. Par la suite, vous pourriez être amené à effectuer d'autres modifications, notamment pour augmenter la taille des uploads sur GLPI, etc.  

Pour appliquer les modifications, nous devons redémarrer PHP-FPM :  

`sudo systemctl restart php8.2-fpm.service`  

Pour finir, nous devons modifier notre VirtualHost pour préciser à Apache2 que PHP-FPM doit être utilisé pour les fichiers PHP :  

`<FilesMatch \.php$>`  
    `SetHandler "proxy:unix:/run/php/php8.2-fpm.sock|fcgi://localhost/"`  
`</FilesMatch>`  

Voici un exemple :  
![image](https://github.com/user-attachments/assets/8d7d1844-54ba-4ba9-870f-c0c01af6a7b6)    

Quand c'est fait, relancer Apache2 :  

`sudo systemctl restart apache2`  

Voilà, tout est prêt ! Il ne reste plus qu'à installer GLPI !  

### IV. Installation de GLPI  

Pour effectuer l'installation de GLPI, nous devons utiliser un navigateur Web afin d'accéder à l'adresse du GLPI. Il s'agit de l'adresse déclarée dans le fichier de configuration Apache2 (ServerName).  

Si vous avez suivi toutes les étapes correctement, vous devriez arriver sur cette page. Nous allons commencer par choisir la langue.  

![image](https://github.com/user-attachments/assets/d53f805a-0bdd-4526-b263-c73fe11a5a9b)

Puisqu'il s'agit d'une nouvelle installation, nous cliquons sur "Installer".  

![image](https://github.com/user-attachments/assets/5929822e-dd1d-423d-ab74-962bac998651)

Etape importante : GLPI vérifie la configuration de notre serveur pour déterminer si tous les prérequis sont respectés. Tout est bon, donc nous pouvons continuer.  

![image](https://github.com/user-attachments/assets/3531ee31-e1b4-4803-8a16-dfc9f6ba4761)

A l'étape suivante, nous devons renseigner les informations pour se connecter à la base de données. Nous indiquons "localhost" en tant que serveur SQL puisque MariaDB est installé en local, sur le même serveur que GLPI. Puis, nous indiquons notre utilisateur "glpi_adm" et le mot de passe associé.  

![image](https://github.com/user-attachments/assets/a45b185b-a191-4612-9602-dcc62bd3f509)  

Après avoir cliqué sur "Continuer", nous devons choisir la base de données "db23_glpi" créée précédemment.  

![image](https://github.com/user-attachments/assets/ec34b45d-2f9e-4bb0-8f76-99c33cbf3f6c)

Poursuivez...  

![image](https://github.com/user-attachments/assets/b9f14e16-551f-4d3d-a5a1-381a8b8b222c)

Suivez les dernières étapes qui n'ont pas de réel impact. Le plus dur est fait !  

![image](https://github.com/user-attachments/assets/17be7fc3-5e6d-436e-8833-b3978d82a643)

Félicitations, vous venez d'installer GLPI ! Comme le précise la dernière étape, le compte administrateur par défaut est "glpi/glpi" !  

![image](https://github.com/user-attachments/assets/058fb572-75f9-4926-9b9d-1aa652f47319)

Nous allons donc nous connecter avec le compte "glpi" et le mot de passe "glpi".  

![image](https://github.com/user-attachments/assets/f1d54780-310c-4461-bda1-b447b337a57a)

![image](https://github.com/user-attachments/assets/9d0cd10e-da90-432b-831c-6117ae810cf0)

Même si l'installation est terminée, nous avons encore quelques actions à réaliser pour la finaliser :  

Changer le mot de passe de tous les comptes par défaut (cliquez sur les liens situés dans l'encadré orange)  
Supprimer le fichier "install.php" puisqu'il n'est plus nécessaire et représente un risque (relancer l'installation)  

`sudo rm /var/www/glpi/install/install.php`  

Voilà, c'est fait. Désormais, votre GLPI est prêt à être utilisé et configuré (création d'utilisateurs, de catégories, de tickets, etc...).  














