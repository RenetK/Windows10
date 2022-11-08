#defineerime muutujad argumentide salvestamiseks
param(
$Kasutajanimi,# - $args[0]
$Taisnimi,# - $args[1]
$Kontokirjeldus# - $args[2]
)
#loome paarooli
$KasutajaParool = ConvertTo-SecureString "qwerty" -AsPlainText -Force

New-LocalUser $Kasutajanimi -Password $KasutajaParool -FullName $Taisnimi -Description $Kontokirjeldus
