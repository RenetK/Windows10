#defineerime muutujad argumentide salvestamiseks
param(
$Kasutajanimi - $args[0]
$Taisnimi - $args[1]
$Kontokirjeldus - [2]
)
#loome paarooli
$KasutajaParool - ConevertTo-SecureString "qwerty" -AsPlainText -Force

New-LocalUser "Kasutaja1" -Password $KasutajaParool -FullName "Esimene Kasutaj" -Description "Local account - kasutaja1"
