$file = "C:\Users\Renet\Desktop\skriptimine\ADkasutajad.csv"

(Get-Content $file -Encoding UTF8) | Set-Content $file -Encoding UTF8

$users = Import-Csv $file -Encoding Default -Delimiter ";"

foreach ($user in $users){
    $username = $user.FirstName + "." + $user.LastName
    $username = $username.ToLower()
    $username = Translit($username)
    $upname =$username + "@sv-kool.local"
    $displayname = $user.Firstname + " " + $user.LastName
    New-ADUser -Name $username `
        -Displayname $displayname `
        -GivenName $user.FirstName `
        -Surname $user.LastName `
        -Department $user.Department `
        -Title $user.Role `
        -UserPrincipalName $upname `
        -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -force) -enabled $true
} 

function Translit {
    param(
        [string] $inputString
    )
        $Translit =@{
        [char]'ä' = "a"
        [char]'ö' = "o"
        [char]'ü' = "u"
        [char]'õ' = "o"
        }
    }
    $outputString = ""
    foreach ($character in $inputCharacter = $inputString.ToCharArray()){
        if ($Translit[$character] -cne $null) {
            $outputString += $Translit[$character]
        } else {
           $outputString += $character 
        }
    }
    Write-Output $outputString
if($?) `
{   
echo "Kasutaja loodud"

}
else
{
$ErrorActionPreference = 'SilentlyContinue'
echo "Tekkis Viga"
}