$hashPath=".\\folder1"
$filePath="."
if (Test-Path $hashPath\hashList.json) {
    Remove-Item $hashPath\hashList.json
}
Get-ChildItem -Path $filePath -Recurse -Filter *.dll | Get-FileHash -Algorithm MD5 | Select-Object Hash, @{Name='Name';Expression={$_.Path.replace("\","/").split("/")[-1]}} | ConvertTo-Json > $hashPath\hashList.json
git add $hashPath\hashList.json