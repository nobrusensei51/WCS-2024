# 🎯 Configuration d'Asterisk pour ``Stéphane Groot``

## 🎯 Fichier `sip.conf`

```
[sgroot]
type=friend
secret=0000
callerid="Stéphane Groot" <88012>
host=dynamic
accountcode=Finances
call-limit=1
context=Marketing
disallow=all
allow=ulaw
```

---

## 🎯 Fichier extensions.conf

```
[Marketing]
exten => 88012,1,Dial(SIP/sgroot)
exten => 88012,2,Voicemail(88012@ff)
exten => 88012,3,Hangup()
```

---

## 🎯Fichier voicemail.conf

```
[default]
88012 => 1234,Stéphane Groot,88012@ff
```
