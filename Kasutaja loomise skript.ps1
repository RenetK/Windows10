$KasutajaParool - ConevertTo-SecureString "qwerty" -AsPlainText -Force

New-LocalUser "Kasutaja1" -Password $KasutajaParool -FullName "Esimene Kasutaj" -Description "Local account - kasutaja1"
