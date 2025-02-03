# Partage de fichier via SMB sur Windows Server 2022

## Installation du service de partage de fichiers
1. **Installer le rôle** :
   - Ouvre le Gestionnaire de serveur
   - Clique sur "Gérer" > "Ajouter des rôles et fonctionnalités"
   - Choisis "Installation basée sur un rôle ou une fonctionnalité"
   - Sélectionne ton serveur
   - Dans la liste des rôles, coche "Services de fichiers et de stockage" > "Serveur de fichiers"
   - Suis l'assistant pour terminer l'installation

## Création du dossier de partage
1. Créer un dossier nommé `Document_Entreprise` à la racine de `C:`.
2. Créer les sous-dossier (RH, Direction et Comptabilité) dans le dossier `Document_Entreprise`.

## Modification des règles d'accès
1. **Configurer les droits d'accès** :
   - **Clic droit** sur le dossier `Document_Entreprise` > **Propriétés**.
   - Aller dans l'onglet **Sécurité**.
   - Cliquer sur **Modifier**.
   - Cliquer sur **Ajouter**.
   - Dans la fenêtre qui s’ouvre, entrer **Tout le monde** et valider.
   - Dans la liste des permissions, cocher uniquement **Lecture**.
   - Cliquer sur **Appliquer**, puis **OK**.
   - Fermer la fenêtre des propriétés.

2. **Configurer les droits d'accès pour chaque sous-dossier** :
   - **Clic droit** sur le sous-dossier correspondant (ex. `RH`) > **Propriétés**.
   - Aller dans l'onglet **Sécurité**.
   - Cliquer sur **Modifier** (**Edit**).
   - Cliquer sur **Ajouter**.
   - Dans la fenêtre qui s’ouvre, entrer le nom du groupe approprié (ex. `RH`) et valider.
   - Dans la liste des permissions, cocher uniquement :
     - **Lecture**.
     - **Écriture**.
   - Cliquer sur **Appliquer**, puis **OK**.
   - Répéter l’opération pour les autres sous-dossiers et groupes :
     - Groupe `RH` pour le dossier `RH`.
     - Groupe `Comptabilité` pour le dossier `Comptabilité`.
     - Groupe `Direction` pour le dossier `Direction`.
   - Fermer les fenêtres des propriétés une fois terminé.

## Configuration de l'Active Directory
1. **Création de l’utilisateur** :
   - Créer un utilisateur nommé `Client1` dans l’OU `User2` (par exemple).

2. **Organisation des unités et groupes** :
   - Créer une OU nommée `GrpDeTravail`.
   - Dans `GrpDeTravail`, créer les groupes suivants :
     - `RH`
     - `Comptabilité`
     - `Direction`

## Configuration du serveur SMB
1. **Créer un nouveau partage SMB** :
   - Aller dans **SERVEUR > Disk > Volumes > C:**.
   - Faire un clic droit sur `C:` et sélectionner **New Shares**.

2. **Configurer le partage** :
   - Choisir **SMB Share - Quick**.
   - Choisissez le dossier de partage créé (`Document_Entreprise`).
   - Puis renommer le dossier en `Docs`.
   - Puis valider par défaut et créer le dossier de partage.

## Vérification des partages
1. Vérifier la configuration SMB via PowerShell :

`Get-SmbShare`

![Sans titre 5](https://github.com/user-attachments/assets/1cc84bea-6b83-4d6f-8fa9-0565e8efa42d)


Valider que le partage est correctement configuré.

## Configuration client pour accéder au partage :

`New-PSDrive -Name "Z" -PSProvider FileSystem -Root "\\NOM_DU_SERVEUR\NOM_DU_PARTAGE" -Persist`

`Get-PSDrive -PSProvider FileSystem`

![Sans titre 1](https://github.com/user-attachments/assets/3235852a-281f-4419-8936-83ecc06a43d8)
