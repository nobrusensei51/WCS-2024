## 🎯 Voir les disques disponible :

``lsblk``<br>
<br>![1](https://github.com/user-attachments/assets/39503ef9-ab0e-4812-b7f7-1dd33e524da9)

---
## 🎯 Créer le PV :

``pvcreate /dev/sdb``<br>
<br>![2](https://github.com/user-attachments/assets/69723cde-1aba-40c3-ac66-eb8de9c10750)

---
## 🎯 Voir les PV existants :

``pvs``<br>
<br>![3](https://github.com/user-attachments/assets/cc7b6eb0-88d3-46c8-b7e0-c52b194dd9e4)

---
## 🎯 Ajouter le PV au VG "optimus-vg" :

``vgextend optimus-vg /dev/sdb``<br>
<br>![4](https://github.com/user-attachments/assets/5f782e64-43da-4d1d-ae83-851f76335b62)

---
## 🎯 Voir le VG :

``vgdisplay optimus-vg``<br>
<br>![5](https://github.com/user-attachments/assets/795827d9-3808-4415-b01a-4934f44b2403)

---
## 🎯 Voir le LV dans le chemin "/dev/optimus-vg/home" :

``lvdisplay /dev/optimus-vg/home``<br>
<br>![6](https://github.com/user-attachments/assets/8e72fede-6f8f-44f5-9aae-593e2d9ed310)

---
## 🎯 Créer un snapshot :

``lvcreate -L 1G -s -n snaptest /dev/optimus-vg/home``<br>
<br>![7](https://github.com/user-attachments/assets/02b6aa2f-a228-45ed-82f0-14479cb35eb4)

---
## 🎯 Voir le LV du snapshot :

``lvdisplay /dev/optimus-vg/snaptest``<br>
<br>![8](https://github.com/user-attachments/assets/114ca84d-b6f8-4cb1-b143-73e639694af9)

---
## 🎯 Créer le dossier /home-snap et monter le snapshot dans le dossier /home-snap :

``mkdir /home-snap``<br>
``mount /dev/optimus-vg/snaptest /home-snap``<br>
<br>![9](https://github.com/user-attachments/assets/e3acd5b0-5a1f-4ac3-ad7b-e2e3a8d9fff1)

---
## 🎯 Voir le snapshot créer :

``lsblk``<br>
<br>![10](https://github.com/user-attachments/assets/d0afba19-e944-4092-b711-f0e66d002dd2)

---
## 🎯 Comparer le contenue du /home et /home-snap :

``ls -l /home``<br>
``ls -l /home-snap``<br>
<br>![11](https://github.com/user-attachments/assets/1dc4f546-232e-427d-9ef2-f1b1ef4884c7)

---
## 🎯 Démonter le snapshot et le supprimer :

``umount /home-snap``<br>
``lvremove /dev/optimus-vg/home-snap``<br>
<br>![12](https://github.com/user-attachments/assets/df8eb7c5-4aec-4ebd-ba58-0a31ef57a701)

---
## 🎯 Voir le résultat final :

``lsblk``<br>
![13](https://github.com/user-attachments/assets/530e773f-b62b-430c-a594-92b760d944a9)
