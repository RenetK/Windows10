#Küsime konto info
$Eesnimi = Read-Host -Prompt "Sisesta oma eesnimi"
$Perenimi = Read-Host -Prompt "Sisesta oma Perenimi"
$Kasutajanimi = $Eesnimi + "." + $Perenimi
#Kustutame konto
try {
    Remove-LocalUser $Kasutajanimi -ErrorAction Stop
}
catch {
    Write-Host "Midagi läks valesti"
    Exit
}
Write-Output "Kasutaja $($Kasutajanimi.ToLower()) on kustutatud"


#if else variant
#$ErrorActionPreference = 'SilentlyContinue'

#Remove-LocalUser $Kasutajanimi 

#if(!$?){ 
    #Write-Host "Midagi läks valesti"
    #Exit
#} else {
    #Write-Output "Kasutaja $($Kasutajanimi.ToLower()) on kustutatud"
#}

#$ErrorActionPreference = 'Stop'