# 🎯 Fichiers avant la première synchronisation
---

``ls -R /home/wilder/file_test``<br>
``/home/wilder/file_test/:``<br>
``file1``<br>
``file2``<br>
``test.txt``<br>

``/home/wilder/file_test/file1:``<br>
``test2.txt``<br>

``/home/wilder/file_test/file2:``<br>
``test3.txt``<br>

# 🎯 Première synchronisation avec rsync : 
***La commande "rsync" copie tous les dossiers et les fichiers du client vers le serveur.***
---

``rsync -avz /home/wilder/file_test/ root@192.168.1.38:/root/dossier_sync``<br>

``sending incremental file list``<br>
``./``<br>
``test.txt``<br>
``file1/``<br>
``file1/test2.txt``<br>
``file2/``<br>
``file2/test3.txt``<br>

# 🎯 Informations supplémentaires : 
***sent 323 bytes  received 88 bytes  117,43 bytes/sec***<br>
***total size is 0  speedup is 0,00***

---

# 🎯 Seconde synchronisation : juste les fichiers manquants sont synchronisés.
---
***La commande "rsync" va copier uniquement le fichier manquant.***
---

``rsync -avz /home/wilder/file_test/ root@192.168.1.38:/root/dossier_sync``<br>

``sending incremental file list``<br>
``file1/``<br>
``file1/test2.txt``<br>

---
 
***sent 245 bytes  received 40 bytes  81,43 bytes/sec***<br>
***total size is 0  speedup is 0,00***
