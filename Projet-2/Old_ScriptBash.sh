#!/bin/bash

# Dessin au début du script
echo -e "  _____________________ "
echo -e " |  _________________  |"
echo -e " | |                 | |"
echo -e " | |\033[33mwilder@wcs\033[m:\033[94m~\033[m$    | |"
echo -e " | | cat Team.txt    | |"
echo -e " | |                 | |"
echo -e " | | \033[92mWild Code School\033[m| |"
echo -e " | |    \033[92mSKILLS\033[m       | |"
echo -e " | |       \033[92mB.M.S.W\033[m   | |"
echo -e " | |_________________| |"
echo -e " |_____________________|"
echo -e "       _[_______]_"
echo -e " _____[___________]_____ "
echo -e "|      \033[91mcd\033[m[_______] []   |"
echo -e "|  \033[91mfloppy\033[m[_______] []   |"
echo -e "|_______________________|"



# Menu du script

read -p "Adresse IP cible : " IPCible
read -p "Nom d'utilisateur : " User
echo -e "Veuillez séléctionner un numéro de choix :\n1 - Action sur utilisateur\n2 - Action sur ordinateur client\n3 - Information sur utilisateur\n4 - Information sur ordinateur client\n5 - Information sur script"
read -p "Choix:" choix

####################################################################################
################### Réponses du script aux choix possibles #########################
####################################################################################

############################# CHOIX NUMERO 1 #######################################
####################### BRIQUE ACTION UTILISATEUR ##################################
if [ "$choix" -eq 1 ]
then
ScriptInstall="ScriptTmp.sh"
cat << 'EOF' > "$ScriptInstall"

 
  # 1 Fonction pour créer un compte utilisateur

function create_user() 
{
read -p "Entrez le nom d'utilisateur à créer : " username
sudo useradd  "$username"
echo "Compte utilisateur $username créé."
#timedatectl | grep "Local time" << log_evttmp.log 
}



  # 2 Fonction pour changer  le mot de passe d'un utilisateur

function change_password()
{
read -p "Entrer le nom d'utilisateur dont vous voulez changer le mot de passe : " username
sudo passwd "$username"
}



  # 3 Fonction pour supprimer un compte utilisateur

function delete_user()
{
read -p "Entrez le nom d'utilisateur à supprimer: " username
sudo userdel "$username"
echo "Compte utilisateur'$username'supprimé"
}



  # 4 Fonction pour désactiver un compte utilisateur
function disable_user() 
{
read -p "Entrez le nom d'utilisateur à désactiver : " username
sudo usermod -L "$username"
echo "Compte utilisateur'$username'désactivé."
}



  # 5 Fonction pour ajouter utilisateur à un groupe d'administration
function addsudogroup()
{
read -p "Entrez le nom de l'utilisateur à ajouter au groupe sudo : " nom_utilisateur
sudo usermod -aG sudo "$nom_utilisateur"
if [ "$?" = "0" ];
then
echo "L'utilisateur $nom_utilisateur a bien été ajouté au groupe d'administration"
else
echo "L'utilisateur $nom_utilisateur n'existe pas"
fi
}

  # 6 Fonction pour ajouter utilisateur à un groupe local
function addlocalgroup()
{
read -p "Entrez le nom de l'utilisateur à ajouter : " nom_utilisateur
read -p "Entrez le nom du groupe local : " nom_groupe
sudo usermod -aG "$nom_groupe" "$nom_utilisateur"
if [ "$?" = "0" ];
then
echo "L'utilisateur $nom_utilisateur a bien été ajouté au groupe $nom_groupe"
else
echo "L'utilisateur $nom_utilisateur n'existe pas"
fi
}



  # 7 Fonction pour supprimer utilisateur d'un groupe local
function removelocalgroup()
{
read -p "Entrez le nom de l'utilisateur à retirer : " nom_utilisateur
read -p "Entrez le nom du groupe local : " nom_groupe
sudo gpasswd -d "$nom_utilisateur" "$nom_groupe"
if [ "$?" = "0" ];
then
echo "L'utilisateur $nom_utilisateur a bien été supprimé du groupe $nom_groupe"
else
echo "L'utilisateur $nom_utilisateur n'existe pas"
fi
}

echo -e "Merci de choisir votre action en tapant :\n1 - Créer un compte utilisateur\n2 - Changer le mot de passe d'un utilisateur\n3 - Supprimer un compte utilisateur\n4 - Désactiver un groupe utilisateur\n5 - Ajouter à un groupe d'administrateur\n6 - Ajouter à un groupe local\n7 pour Sortie d'un groupe local"
read -p "Choix:" action 

        case "$action" in
                 1) create_user ;;
                 2) change_password ;;
                 3) delete_user ;;
                 4) disable_user ;;
                 5) addsudogroup ;;
                 6) addlocalgroup ;;
                 7) removelocalgroup ;;
                 *) echo "Option invalide.";;
	esac

EOF

fi

############################# CHOIX NUMERO 2 ##############################################
####################### BRIQUE ACTION ORDINATEUR ##########################################
if [ "$choix" -eq 2 ]
then
ScriptInstall="ScriptTmp.sh"
cat << 'EOF' > "$ScriptInstall"

  # 1 Fonction pour arrêter le système
function arret()
{
echo "L'ordinateur va s'arrêter"
sudo shutdown now
}



  # 2 Fonction pour redémarrer
function redemarrage()
{
sudo reboot now
echo "L'ordinateur va redémarrer"
}

  # 3 Fonction pour verrouiller la session
function verrou()
{
loginctl lock-session
echo "La session est verrouillée"
}

  # 4 Fonction pour mettre à jour le système
function maj()
{
sudo apt update && sudo apt upgrade -y
echo "La mise à jour est terminée"
}

  # 5 Fonction pour création de répertoire
function creation_de_repertoire()
{
read -p "Veuillez entrer le nom du répertoire à créer :" nom_repertoire
mkdir "$nom_repertoire"
echo "Le dossier $nom_repertoire a été créé"
}

  # 6 Fonction pour modification de répertoire
function modification_de_repertoire()
{
read -p "Veuillez entrer le nom du fichier à modifier :" fichier_a_modifier
read -p "Veuillez entrer le nombre pour les modification des droits : " modification_droit
chmod "$modification_droit" "$fichier_a_modifier"
echo "Le dossier $fichier_a_modifier a été modifié"
}

  # 7 Fonction pour suppression de répertoire
function suppression_de_repertoire()
{
read -p "Veuillez entrer le nom du répertoire à supprimer : " nom_repertoire_a_supprimer
rm -r "$nom_repertoire_a_supprimer"
echo "Le repertoire $nom_repetoire_a_supprimer a été supprimé"
}

 # 8 Fonction pour prise de main à distance 
function Prise_main()
{
echo "En cours de développement"
}

  # 9 Fonction pour activer le pare-feu
function activerufw()
{
sudo ufw enable
sudo ufw allow 22
echo "Le pare-feu a été activé avec succès"
}

  # 10 Fonction pour désactiver le pare-feu
function desactiverufw()
{
sudo ufw disable
echo "Le pare-feu a été désactivé avec succès"
}

 # 11 Fonction pour installation un logiciel
function InstallPackage()
{
while true
do

  # Choix pour $install1
while true
do
	echo -e 'Que souhaitez-vous faire ? \nTaper "package" pour renseigner un paquet. \nTaper "search" pour rechercher un paquet. \nTaper "EXIT" pour sortir. '
	read -p "Choix : " install1

# Vérification entrée $install1
	if [ "$install1" = "package" ] || [ "$install1" = "search" ] || [ "$install1" = "EXIT" ];
	then
    	break    
	else
    	echo "Veuillez rentrer une donnée valide !"
    	fi
done

# Action choix "package"
if [ "$install1" = "package" ]
then
	while true;
	do
    	read -p 'Quel package souhaitez-vous installer ? Tapez "EXIT" pour retourner au menu précédent : ' package1;
    	if [ "$package1" = "EXIT" ]
    	then
        	break
    	else   	 
        	sudo apt install "$package1" && echo "Le package "$package1" est installé !"
    	fi
	done
fi

# Action choix "search"
if [ "$install1" = "search" ]
echo "Sessions ouvertes par l'utilisateur $USER :"
who | grep $USER
then
	while true;
	do
    	read -p 'Rechercher un ou plusieurs termes ? Tapez "EXIT" pour annuler : ' search1
    	if [ "$search1" = "EXIT" ]
    	then
        	break
    	else
        	apt-cache search -n "$search1"
    	fi
	done
fi

# Action choix "exit"
if [ "$install1" = "EXIT" ];
then
	read -p "Etes vous sûr de quitter y/n ? " exit1;
    	if [ "$exit1" = "y" ] || [ "$exit1" = "Y" ];
    	then
        	exit 1
    	fi
fi
done
}



  # 12 Fonction pour désinstaller un logiciel
function uninstall()
{
read -p “Renseigner le nom du paquet à désinstaller : ” UninstallPackage
sudo apt remove $UninstallPackage
}



  # 13 Exécution de script sur la machine distante
function ExecScript
{
while true
do
	read -p 'Emplacement absolu du script à exécuter, "exit" pour sortir : ' ScriptFolder
	if  [ -d "$ScriptFolder" ]
	then
		while true
		do
			ls -l "$ScriptFolder"
			read -p "Quel script voulez-vous exécuter ? " ScriptName
			if [ -f "$ScriptFolder/$ScriptName" ]
			then
				echo -e "\033[32mLancement du script ...\033[0m"
				bash "$ScriptFolder/$ScriptName";
				echo -e "\033[32m... fin du script !\033[0m"
				break
			else
				echo -e "\033[31mCe fichier n'existe pas dans ce dossier ou le champ est vide !\033[0m"
			fi
		done
	elif [ $ScriptFolder = "exit" ]
	then
		break
	else
		echo -e "\033[31mCe dossier n'existe pas ou le champ est vide !\033[0m"
	fi
done

}





  

echo -e "Merci de choisir votre action en tapant :\n1 - Arrêter le système\n2 - Redémarrer le système\n3 - Vérrouiller la session\n4 - Mettre à jour le système\n5 - Créer un répertoire\n6 - Modifier un répertoire\n7 - Supprimer un répertoire\n8 Prise de main à distance\n9 - Activer le pare-feu\n10 - Désactiver le pare-feu\n11 - Installation de logiciel\n12 - Désinstallation de logiciel\n13 - Exécution de script sur la machine distante"
read -p "Choix:" action

	case "$action" in
                         1) arret ;;
                         2) redemarrage	;;
                         3) verrou ;;
                         4) maj	;;
                         5) creation_de_repertoire ;;
                         6) modification_de_repertoire ;;
                         7) suppression_de_repertoire ;;
 			 8) Prise_main ;;
                         9) activerufw ;;
                         10) desactiverufw ;;
                         11) InstallPackage ;;
                         12) uninstall ;;
			 13) ExecScript ;;
 			 
	esac


EOF
fi

############################# CHOIX NUMERO 3 ###############################################
####################### BRIQUE INFO UTILISATEUR  ###########################################
if [ "$choix" -eq 3 ] ;
then
ScriptInstall="ScriptTmp.sh"
cat << 'EOF' > "$ScriptInstall"


# 1 Fonction pour date de dernière connexion d'un utilisateur
function date_derniere_connexion()
{
echo "Date de dernière connexion de l'utilisateur $user :"
last -n 1 $user | awk '{print $4, $5, $6, $7}'
}


# 2 Fonction pour date de dernière modification du mot de passe
function dernier_modif_mdp()
{
echo "Date de dernière modification du mot de passe de l'utilisateur $USER :"
chage -l $user | grep "Last password change" | awk -F: '{print $2}'
}

# 3 Fonction pour liste des sessions ouvertes par l'utilisateur
function session_open()
{
echo "Sessions ouvertes par l'utilisateur $USER :"
who | grep $user

}

# 4 Fonction pour le groupe d'appartenance d'un utilisateur
function groupuser()
{
read -p "Veuillez entrer le nom de l'utilisateur " user
echo "L'utilisateur "$user" appartient au(x) groupe(s) suivant(s) : "
groups "$user"
}

# 5 Fonction pour historique des commandes exécutées par l'utilisateur
function historyuser()
{
read -p "Veuillez entrer le nom de l'utilisateur " user
cat /home/"$user"/.bash_history
}

# 6 Fonction pour droits/permissions de l'utilisateur sur un dossier ou fichier
function rights()
{
read -p "Veuillez spécifier le chemin absolu du dossier ou fichier à vérifier : " chemin
read -p "Veuillez entrer le nom de l'utilisateur : " user

	if [[ -r "$chemin" ]]; then 
		echo "L'utilisateur "$user" a la permission de lecture."
	fi

	if [[ -w "$chemin" ]]; then 
		echo "L'utilisateur "$user" a la permission d'écriture."
	fi

	if [[ -w "$chemin" ]]; then 
		echo "L'utilisateur "$user" a la permission d'exécution."
	fi
}

echo -e "Veuillez choisir l'information désirée en tapant:\n1 - Date de dernière connexion d'un utilisateur\n2 - Date de dernière modification du mot de passe\n3 - Liste des sessions ouvertes par l'utilisateur\n4 - Groupe d'appartenance d'un utilisateur\n5 - Historique des commandes exécutées par l'utilisateur\n6 - Droits/Permissions de l'utilisateur sur un dossier ou fichier"
read -p "Choix:" info

case "$info" in
               1) date_derniere_connexion ;;
               2) dernier_modif_mdp ;;
               3) session_open ;;
               4) groupuser ;;
               5) historyuser ;;
               6) rights ;;
esac
EOF
fi


############################# CHOIX NUMERO 4 #############################################
######################### BRIQUE INFO ORDINATEUR  ########################################

if [ "$choix" -eq 4 ] 
then
ScriptInstall="ScriptTmp.sh"
cat << 'EOF' > "$ScriptInstall"

# Version de l'OS
function versionOS()
{
echo "La version des l'OS est:" 
uname -r
}

# Nombre de disques
function ListDisk()
{
lsblk -d -o NAME,SIZE,TYPE
}

# 7 Fonction pour les partitions (nombre, nom, FS, taille) par disque
function ListPartition()
{
lsblk -o NAME,FSSIZE,FSTYPE,LABEL
}

# 8 Fonction pour espace disque restant par partition/volume
function FreeSpace()
{
lsblk -o NAME,FSAVAIL
}

# 9 Fonction pour le nom et espace disque d'un dossier (nom de dossier demandé)
function FolderInfos()
{
while true
do
	read -p 'Emplacement absolu du dossier, "exit" pour sortir : ' FolderPlacement
	if  [ -d "$FolderPlacement" ]
	then
    	while true
    	do
        	du -sh $FolderPlacement | cut -f1 && basename $FolderPlacement
        	break
    	done
	elif [ $FolderPlacement = "exit" ]
	then
    	break
	else
    	echo -e "\033[31mCe dossier n'existe pas ou le champ est vide !\033[0m"
	fi
done
}

# 10 Fonction pour la liste des lecteurs montés (disque, CD, etc...)
function MountedDrive()
{
df -h | grep "^/dev/"
}
# 11 Fonction pour le nombre d'interfaces
function interfacesnumber()
{
echo "nombre d'interfaces : $(ip link show | grep -c '^[0-9]')"
}

# 12 Fonction pour l’adresse IP de chaque interface
function interfaceip()
{
ip -o -4 addr show | while read -r line; do
# Récupérer le nom de l'interface (colonne 2) et l'adresse IP (colonne 4)
iface=$(echo "$line" | awk '{print $2}')
ip_addr=$(echo "$line" | awk '{print $4}')
# Afficher le nom de l'interface et son adresse IP
echo "$iface : $ip_addr"
done
}

# 13 Fonction pour l’adresse Mac
function macaddr()
{
echo “L’adresse MAC de cet ordinateur est : “
ip link show $interface | awk '/ether/ {print $2}'
}

# 14 Fonction pour la liste des ports ouverts
function ports_ouverts()
{
sudo netstat –tulnp
}

# 15 Fonction pour le statut du pare-feu
function status_firewall()
{
systemctl status firewall
}

echo -e "Veuillez choisir l'information désirée en tapant :\n1 - Version de l'OS\n2 - Nombre de disques\n3 - Partitions (nombre, nom, FS, taille) par disque\n4 - Espace disque restant par partition/volume\n5 - Nom et espace disque d'un dossier\n6 - Liste des lecteurs montés\n7 - Nombre d'interfaces\n8 - Adresses IP de chaque interface\n9 - Adresse MAC\n10 - Liste des ports ouverts\n11 - Statut du pare-feu"
read -p "Choix:" info

case "$info" in
               1) versionOS ;;
               2) ListDisk  ;;
               3) ListPartition  ;;
               4) FreeSpace  ;;
               5) FolderInfos ;;
               6) MountedDrive  ;;
               7) interfacesnumber  ;;
               8) interfaceip  ;;
               9) macaddr  ;;
               10) ports_ouverts ;;  
               11) status_firewall ;;
esac
EOF
fi


# Copie du FichierTmp.sh depuis ça variable (ici $ScriptInstall)
scp $ScriptInstall "$User"@"$IPCible":/tmp/"$ScriptInstall" >> /dev/null;

#Connection ssh en mode interactif, puis exécution du fichier.
ssh -t "$User"@"$IPCible" "bash /tmp/$ScriptInstall";

#Connection ssh pour supprimer le FichierTmp.sh sur la cible.
ssh "$User"@"$IPCible" "rm -f /tmp/$ScriptInstall";

#Suppression du FichierTmp.sh sur la source.
rm -f "$ScriptInstall"
