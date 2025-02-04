#!/bash/bin
# Vérification de la présence d'argument au lancement du script

    if test $# -eq 0 
    then echo " Il manque les noms d'utilisateurs en argument - Fin du script "
    exit 1
    fi 

# Vérification de l'existence des utilisateurs dans le système

  for createuser in $@ ;

  do
     if cat /etc/passwd | grep -q $createuser:
     then echo "l'utilisateur $createuser existe déjà"
     
     #Création de l'utilisateur
     else useradd $createuser
     fi

     #Vérification de la création
     if test $? -eq 0
     then echo "La création de $createuser à réussi"
     else echo "la création de $createuser à échoué"
     fi

done
