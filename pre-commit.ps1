$hashPath=".\\folder1"
if (Test-Path $hashPath\hashList.json) {
    Remove-Item $hashPath\hashList.json
}
Get-ChildItem -Path . -Recurse -Filter *.dll | Get-FileHash -Algorithm MD5 | % {$_.Path.replace("\","/").split("/")[-1] + "," + $_.Hash} > $hashPath\hashList.csv
git add $hashPath\hashList.json