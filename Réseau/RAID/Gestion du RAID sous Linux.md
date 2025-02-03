## 🎯 RAID 1

### Étapes de configuration :

```
# Installer mdadm
sudo apt install mdadm -y

# Lister les disques disponibles
lsblk
sudo fdisk -l

# Partitionner les disques
sudo fdisk /dev/sdb (n + p + t + fd + w)
lsblk
sudo fdisk /dev/sdc (n + p + t + fd + w)
lsblk

# Créer un RAID 1
sudo mdadm --create /dev/md0 --level 1 --raid-devices 2 /dev/sdb1 /dev/sdc1

# Vérifier l'état du RAID
cat /proc/mdstat
sudo mdadm --detail /dev/md0

# Formater et monter le RAID
sudo mkfs.ext4 /dev/md0 -L "PersonalData"
sudo mkdir -p /home/wilder/Data-RAID1
sudo mount /dev/md0 /home/wilder/Data-RAID1/

# Configurer le montage automatique
sudo nano /etc/fstab ( /dev/md0 /home/wilder/Data-RAID1 ext4 nofail 0 0 )

# Configurer mdadm
sudo mdadm --detail --scan
sudo nano /etc/mdadm/mdadm.conf ( ARRAY /dev/md0 metadata=1.2 name=wilder-VirtualBox:0 UUID=15e069fd:658cc1aa:7ddeaaa9:a60d91b0 )


# Mettre à jour initramfs
sudo update-initramfs -u

# Redémarrer le système
reboot

# Création fichier avec permission
sudo touch /home/wilder/Data-RAID1/test_file.txt
sudo chown wilder:wilder /home/wilder/Data-RAID1/test_file.txt

# Simuler une panne et réparer le RAID
cat /proc/mdstat
sudo mdadm /dev/md0 --fail /dev/sdb1
sudo mdadm --detail /dev/md0

# Ajouter un disque de remplacement
sudo fdisk /dev/sdd
lsblk
sudo mdadm --manage /dev/md0 --add /dev/sdd1
sudo mdadm --detail /dev/md0
```

## 🎯 RAID 5

### Étapes de configuration :

```
# Installer mdadm
sudo apt install mdadm -y

# Lister les disques disponibles
lsblk
sudo fdisk -l

# Partitionner les disques
sudo fdisk /dev/sdb (n + p + t + fd + w)
lsblk
sudo fdisk /dev/sdc (n + p + t + fd + w)
lsblk
sudo fdisk /dev/sdd (n + p + t + fd + w)

# Créer un RAID 5
sudo mdadm --create /dev/md0 --level 5 --raid-devices 3 /dev/sdb1 /dev/sdc1 /dev/sdd1

# Vérifier l'état du RAID
cat /proc/mdstat
sudo mdadm --detail /dev/md0

# Formater et monter le RAID
sudo mkfs.ext4 /dev/md0 -L "PersonalData"
sudo mkdir -p /home/wilder/Data-RAID5
sudo mount /dev/md0 /home/wilder/Data-RAID5/

# Configurer le montage automatique
sudo nano /etc/fstab ( /dev/md0 /home/wilder/Data-RAID1 ext4 nofail 0 0 )

# Configurer mdadm
sudo mdadm --detail --scan
sudo nano /etc/mdadm/mdadm.conf ( ARRAY /dev/md0 metadata=1.2 name=wilder-VirtualBox:0 UUID=15e069fd:658cc1aa:7ddeaaa9:a60d91b0 )

# Mettre à jour initramfs
sudo update-initramfs -u

# Redémarrer le système
reboot

# Création fichier avec permission
sudo touch /home/wilder/Data-RAID5/test_file.txt
sudo chown wilder:wilder /home/wilder/Data-RAID5/test_file.txt

# Simuler une panne et réparer le RAID
cat /proc/mdstat
sudo mdadm /dev/md0 --fail /dev/sdb1
sudo mdadm --detail /dev/md0

# Ajouter un disque de remplacement
sudo fdisk /dev/sde
lsblk
sudo mdadm --manage /dev/md0 --add /dev/sde1
sudo mdadm --detail /dev/md0
```
