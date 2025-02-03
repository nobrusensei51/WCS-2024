# 📝 Logs Apache2

## 📂 **Access Logs** (`/var/log/apache2/access.log`)

- 🌐 `192.168.1.56` - - [16/Dec/2024:10:03:09 +0100]  
  **"GET / HTTP/1.1"** ✅ `200` **3380** `"-"`  
  `"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:133.0) Gecko/20100101 Firefox/133.0"`  
- 🌐 `192.168.1.56` - - [16/Dec/2024:10:03:09 +0100]  
  **"GET /icons/openlogo-75.png HTTP/1.1"** ✅ `200` **6040** `"http://192.168.1.38/"`  
  `"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:133.0) Gecko/20100101 Firefox/133.0"`  
- 🌐 `192.168.1.56` - - [16/Dec/2024:10:03:09 +0100]  
  **"GET /favicon.ico HTTP/1.1"** ❌ `404` **490** `"http://192.168.1.38/"`  
  `"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:133.0) Gecko/20100101 Firefox/133.0"`  

---

## 📂 **Error Logs** (`/var/log/apache2/error.log`)

- 🔧 [Mon Dec 16 10:01:29.271073 2024] `[mpm_event:notice]`  
  **PID**: `1244:tid 1244` - `AH00489: Apache/2.4.62 (Debian) configured -- resuming normal operations`  
- 🔧 [Mon Dec 16 10:01:29.271128 2024] `[core:notice]`  
  **PID**: `1244:tid 1244` - `AH00094: Command line: '/usr/sbin/apache2'`  
- 🔧 [Mon Dec 16 10:13:10.360901 2024] `[mpm_event:notice]`  
  **PID**: `1244:tid 1244` - `AH00492: caught SIGWINCH, shutting down gracefully`  
- 🔧 [Mon Dec 16 10:13:10.412196 2024] `[mpm_event:notice]`  
  **PID**: `1441:tid 1441` - `AH00489: Apache/2.4.62 (Debian) configured -- resuming normal operations`  
- 🔧 [Mon Dec 16 10:13:10.412250 2024] `[core:notice]`  
  **PID**: `1441:tid 1441` - `AH00094: Command line: '/usr/sbin/apache2'`  

---

## 📝 Les requêtes réussies : `code 200 ✅`
## 📝 Les erreurs : `code 404 ❌` 
## 📝 Les adresses IP les plus fréquentes : `192.168.1.56 🌐`

---

## 📝 Tuto utilisé : ***https://friendhosting.net/fr/blog/install-apache-on-debian-11.php***
