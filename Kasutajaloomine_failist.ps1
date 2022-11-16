#Faili asukoht
$Fail = "C:\Users\Renet\Desktop\skriptimine\kasutajad.csv"

$Kasutajad = Import-Csv $Fail -Encoding Default -Delimiter ";"
foreach ($kasutaja in $Kasutajad)
{
    $Kasutajanimi = $Kasutaja.Kasutajanimi
    $Taisnimi = $kasutaja.Taisnimi
    $Kontokirjeldus = $kasutaja.KontoKirjeldus
    $Parool = $kasutaja.Parool | ConvertTo-SecureString -AsPlainText -Force

    New-LocalUser -Name $Kasutajanimi -Password $Parool -FullName $Taisnimi -Description $Kontokirjeldus
}