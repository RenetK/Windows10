
#Küsime konto info
$Eesnimi = Read-Host -Prompt "Sisesta oma eesnimi"
$Perenimi = Read-Host -Prompt "Sisesta oma Perenimi"
$Kasutajanimi = $Eesnimi + "." + $Perenimi
$Taisnimi = $Eesnimi + " " + $Perenimi
Write-Output "Kasutaja nimi on: $($Kasutajanimi.ToLower())"
$Kontokirjeldus = Read-Host -Prompt "Sisesta konto kirjeldus" 



#loome paarooli
$KasutajaParool = ConvertTo-SecureString "qwerty" -AsPlainText -Force
#Teeme konto
Try {
New-LocalUser $Kasutajanimi.ToLower() -Password $KasutajaParool -FullName $Taisnimi -Description $Kontokirjeldus
}
Catch [CategoryInfo] {Write-Host "See nimi ei sobi"}