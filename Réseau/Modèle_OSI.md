| **Couche**            | **Numéro** | **Rôle**                                                                                             | **Exemples de Protocoles**           | **Matériel Associé**               |
|------------------------|------------|-------------------------------------------------------------------------------------------------------|--------------------------------------|------------------------------------|
| **Application**        | 7          | Interface avec les applications utilisateur. Gestion des services réseau comme le mail ou le web.    | HTTP, FTP, SMTP, DNS                | Logiciels (navigateurs, clients FTP) |
| **Présentation**       | 6          | Traduction, cryptage, et compression des données (format des données pour les couches supérieures).   | SSL/TLS, JPEG, PNG, ASCII           | Logiciels (bibliothèques de cryptage) |
| **Session**            | 5          | Gestion des connexions entre deux systèmes (établissement, maintien, et terminaison des sessions).   | NetBIOS, RPC                        | Logiciels (middleware, gestion de sessions) |
| **Transport**          | 4          | Segmentation des données, gestion de la fiabilité, contrôle des erreurs, multiplexage.               | TCP, UDP                            | Pare-feu, routeurs avancés         |
| **Réseau**             | 3          | Routage et adressage logique des paquets entre différents réseaux.                                   | IP, ICMP, RIP, OSPF                 | Routeurs, commutateurs Layer 3     |
| **Liaison de données** | 2          | Communication directe entre appareils sur le même réseau, détection et correction d’erreurs.         | Ethernet, Wi-Fi (IEEE 802.11), ARP       | Commutateurs, points d'accès Wi-Fi |
| **Physique**           | 1          | Transmission des bits bruts sur un support physique (électrique, optique, radio).                    | Aucun (niveau matériel uniquement)  | Câbles, fibres optiques, antennes, hubs |


---


| **Norme IEEE 802**  | **Description**                                                   | **Exemple d'Usage**              |
|----------------------|-------------------------------------------------------------------|----------------------------------|
| **802.1**           | Gestion des réseaux locaux : VLAN, Spanning Tree, QoS.           | Création de VLAN dans un réseau d'entreprise. |
| **802.2**           | Sous-couche LLC (Logical Link Control) pour les réseaux locaux.  | Encapsulation des données sur Ethernet. |
| **802.3**           | Norme pour les réseaux filaires Ethernet.                        | Réseaux câblés (10 Mbps à 100 Gbps). |
| **802.11**          | Norme pour les réseaux sans fil (Wi-Fi).                         | Réseaux Wi-Fi (maison, bureaux, cafés). |
| **802.15**          | Norme pour les réseaux personnels sans fil (WPAN).               | Bluetooth, Zigbee, capteurs IoT. |
| **802.16**          | Norme pour les réseaux métropolitains sans fil (WiMAX).          | Connexion internet sans fil pour zones rurales. |
| **802.17**          | Réseaux en anneau résilient (Resilient Packet Ring).             | Réseaux métropolitains à haut débit. |
| **802.19**          | Gestion de la coexistence entre technologies sans fil.           | Coordination Wi-Fi et Bluetooth. |
| **802.20**          | Réseaux mobiles haut débit (Mobile Broadband).                   | Connexions pour véhicules en mouvement. |
| **802.21**          | Gestion de la transition entre réseaux hétérogènes.             | Handover entre Wi-Fi et réseaux mobiles. |
| **802.22**          | Norme pour les réseaux sans fil à longue portée (WRAN).          | Internet dans les zones rurales via fréquences TV. |
