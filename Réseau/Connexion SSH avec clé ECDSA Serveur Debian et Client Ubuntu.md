## 1. Installer OpenSSH sur le serveur Debian<br>

Sur le serveur Debian, installez le serveur SSH :

```
sudo apt update
sudo apt install openssh-server
```

Assurez-vous que le service SSH fonctionne :

```
sudo systemctl status ssh
```

## 2. Installer OpenSSH Client sur le client Ubuntu<br>
Sur le client Ubuntu, installez le client SSH :

```
sudo apt update
sudo apt install openssh-server
```

## 3. Générer une clé ECDSA sur le serveur Debian<br>
Sur le serveur Debian, générez une clé ECDSA :

```
ssh-keygen -t ecdsa
```

Acceptez le répertoire par défaut pour la clé, et laissez vide si vous ne souhaitez pas de mot de passe pour la clé.<br>

## 4. Copier la clé publique sur le client Ubuntu<br>
Copiez la clé publique du serveur vers le client :

```
ssh-copy-id -i ./.ssh/id_ecdsa.pub user@client_ubuntu_ip
```

## 5. Tester la connexion SSH sans mot de passe<br>
Sur le serveur Debian, testez la connexion SSH sans mot de passe :

```
ssh user@client_ubuntu_ip
```
