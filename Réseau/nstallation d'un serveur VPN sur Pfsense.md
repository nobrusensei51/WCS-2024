# Installation d'un serveur VPN sur pfSense

---

## 🖥️ Préparation de la VM
- Utilisez une VM avec **pfSense** installé.
- Configurez **2 cartes réseaux** :
  - 🌐 **Carte en pont** : IP statique `192.168.1.45/24`.
  - 🔗 **Carte en réseau interne** : IP statique `192.168.2.1/24`.

---

## 🔐 Gestion des certificats

### 1️⃣ Créer une autorité de certification
1. Allez dans : `System` > `Cert. Manager` > `CAs` > **Add**.
2. Renseignez les champs :
   - **Descriptive name** : Nom visible dans pfSense.
   - **Method** : `Create an internal certificate Authority`.
   - **Common Name** : Nom affiché dans les certificats.
3. Cliquez sur **Save**.  
   👉 L'autorité de certification apparaît.

---

### 2️⃣ Créer le certificat serveur
1. Allez dans : `System` > `Cert. Manager` > `Certificates` > **Add**.
2. Configurez :
   - **Certificate type** : `Server Certificate`.
   - **Common Name** : Nom intégré dans le certificat.
3. Cliquez sur **Save**.

---

## 👤 Création des utilisateurs locaux
1. Allez dans : `System` > `User Manager` > `Users` > **Add**.
2. Renseignez :
   - Associez l'autorité de certification créée.
   - Remplissez le formulaire de création de certificat.
   - Créez un nom d'utilisateur et un mot de passe.
3. Cliquez sur **Save**.  
   👉 L'utilisateur apparaît dans la liste.  

![Capture d'écran 1](https://github.com/user-attachments/assets/0e286ad6-9e11-4336-a5c1-5e8867cce25e)  
![Capture d'écran 2](https://github.com/user-attachments/assets/504928b7-d460-45e0-9fef-20f675b48e8c)

---

## ⚙️ Configuration du serveur OpenVPN
1. Allez dans : `VPN` > `OpenVPN` > `Servers` > **Add**.
2. Configurez :
   - **Server Mode** : `Remote Access (SSL/TLS + User Auth)`.
   - **Protocol** : UDP (port par défaut : `1194`).
   - **Interface** : `WAN` (connexion distante via l'interface WAN).
   - **Peer Certificate Authority** : Sélectionnez votre autorité de certification.
   - **Server Certificate** : Sélectionnez le certificat serveur.
   - **Encryption Algorithm** : Choisissez selon vos besoins de sécurité (attention aux éventuels lags).  
3. Configurez le tunnel VPN :
   - **IPv4 Tunnel Network** : `10.10.10.0/24`.
   - **Redirect IPv4 Gateway** : Ne pas cocher (on ne force pas tout le trafic à passer par le tunnel).
   - **IPv4 Local Network** : `192.168.1.0/24` (réseau de l'entreprise).
   - **Dynamic IP** : Cochez pour permettre aux clients DHCP de conserver la connexion.
   - **Topology** : `net30` (chaque client isolé dans un sous-réseau).  
4. Cliquez sur **Save**.  

![Capture d'écran 3](https://github.com/user-attachments/assets/db246a89-6afd-4b10-bcfa-0769077f14fd)

---

## 📦 Exportation de la configuration OpenVPN
1. Installez le paquet `openvpn-client-export` :
   - Allez dans : `System` > `Package Manager` > `Available Packages`.
   - Recherchez `openvpn` et installez **openvpn-client-export**.
2. Allez dans : `VPN` > `OpenVPN` > `Client Export`.
3. Dans **Bundled Configurations**, téléchargez la configuration au format `.ovpn` (option **Archive**).  

![Capture d'écran 4](https://github.com/user-attachments/assets/579942af-91c9-4b4e-bda9-e4285f232983)

---

## 🔥 Création des règles de pare-feu pour OpenVPN
1. Allez dans : `Firewall` > `Rules` > **Edit**.
2. Configurez :
   - Autorisez les flux pour le VPN.
   - Créez une règle pour l'interface VPN permettant les connexions spécifiques.
3. Cliquez sur **Save**.  

![Capture d'écran 5](https://github.com/user-attachments/assets/d36bfbbf-74d3-410a-99ba-890896ea3e8d)  
![Capture d'écran 6](https://github.com/user-attachments/assets/586257d2-d71a-41a9-ad54-30d2b1132238)

### ✨ Autoriser les flux vers les ressources
Créez une nouvelle règle pour l'interface VPN :  
![Capture d'écran 7](https://github.com/user-attachments/assets/4f082e46-f712-4f65-855f-ca3629716a39)  

Autorisez la machine spécifique qui doit se connecter au VPN :  
![Capture d'écran 8](https://github.com/user-attachments/assets/4eb920fd-5776-4147-b595-6c0c3dbf3867)

---

## 🧪 Tester l'accès distant depuis un poste client
1. Installez **OpenVPN** sur le poste client.
2. Copiez le contenu de l'archive `.ovpn` dans :  
   `C:\Programmes\OpenVPN\Config`.
3. Lancez OpenVPN :
   - Effectuez un clic droit sur l'icône OpenVPN > **Connecter**.
   - Entrez le nom d'utilisateur et le mot de passe.  
   👉 Une icône verte indique une connexion réussie.  

![Capture d'écran 9](https://github.com/user-attachments/assets/e8b00093-c3c0-4ce5-a306-16054fa5d835)  
![Capture d'écran 10](https://github.com/user-attachments/assets/7777a2e4-c091-4a0d-a051-8141ef5a6de9)

4. Vérifiez la configuration réseau (via `ipconfig`) :
   - Une IP dans la plage `10.10.10.0/24` (topologie `/30`) doit apparaître.  

![Capture d'écran 11](https://github.com/user-attachments/assets/26bb5114-c5bf-4a14-a935-19121dd55169)
