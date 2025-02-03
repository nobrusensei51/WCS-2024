## 1. Installer OpenSSH Server sur le client

- Ouvrir **Powershell** en tant qu'administrateur sur le client (Windows Server 2022 ou Windows 10).
- Installer le serveur OpenSSH :

```
Add-WindowsFeature -Name OpenSSH-Server
```

## 2. Vérifier le statut du service SSH
Vérifiez le statut du service SSH en utilisant la commande suivante :

```
Get-Service sshd
```

Si le service SSH n'est pas en cours d'exécution, vous pouvez le configurer pour qu'il démarre automatiquement au démarrage du système :

```
Get-Service sshd | Set-Service -StartupType Automatic
```

Redémarrez le service SSH :

```
Restart-Service sshd
```

Vérifiez à nouveau le statut du service SSH :

```
Get-Service sshd
```

## 3. Générer la clé SSH sur le serveur
Sur le serveur (Windows Server 2022 ou Windows 10), ouvrez Powershell et générez une clé SSH avec l'algorithme ecdsa :

```
ssh-keygen -t ecdsa
```

Cela va créer une paire de clés publique et privée dans le répertoire C:\Users\<NomUtilisateur>\.ssh.

## 4. Vérifier les fichiers dans le répertoire .ssh
Allez dans le répertoire .ssh où se trouve votre clé. Exécutez la commande suivante pour lister les fichiers :

```
Get-ChildItem .\.ssh\
```

## 5. Copier la clé publique
Affichez la clé publique générée avec la commande suivante :

```
Get-Content -Path .\.ssh\id_ecdsa.pub
```

Copiez le contenu de cette clé publique.

## 6. Se connecter en SSH depuis le serveur vers le client
Depuis le serveur, connectez-vous en SSH sur le client en ouvrant une session PowerShell :

```
ssh <NomUtilisateur>@<AdresseIPClient>
```

## 7. Ajouter la clé publique dans le fichier authorized_keys
Une fois connecté en SSH sur le client, ajoutez la clé publique copiée dans le fichier authorized_keys :

```
Add-Content -Path .ssh\authorized_keys -Value "collez ici la clé publique"
```

## 8. Modifier le fichier de configuration SSH sur le client
Accédez à Ce PC sur le client, puis suivez le chemin suivant :

```
C:\ProgramData\ssh\sshd_config
```

Pour voir le fichier, activez l'option Afficher les éléments masqués dans l'explorateur de fichiers.

Ouvrez le fichier sshd_config avec Bloc-notes en mode administrateur (important pour avoir les droits de modification).

## 9. Modifier sshd_config
Recherchez et commentez la ligne AuthorizedKeysFile (par exemple en ajoutant un # devant) dans le fichier sshd_config.

Exemple de ligne à commenter :

```
# AuthorizedKeysFile __PROGRAMDATA__/ssh/authorized_keys
```

## 10. Redémarrer le service SSH sur le client
Redémarrez le service SSH sur le client pour appliquer les modifications :

```
Restart-Service sshd
```

## 11. Se connecter sans mot de passe
Maintenant, retournez sur le serveur et essayez de vous reconnecter au client via SSH. Vous devriez pouvoir vous connecter sans entrer de mot de passe, en utilisant uniquement la clé privée.

```
ssh <NomUtilisateur>@<AdresseIPClient>
```
