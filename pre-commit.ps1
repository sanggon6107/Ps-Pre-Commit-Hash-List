$hashPath=".\\folder1"
if (Test-Path $hashPath\hashList.json) {
    Remove-Item $hashPath\hashList.json
}
Get-ChildItem -Path . -Recurse -Filter *.dll | Get-FileHash -Algorithm MD5 | Select-Object Hash, @{Name='Name';Expression={$_.Path.replace("\","/").split("/")[-1]}} | ConvertTo-Json > hashList.json
git add $hashPath\hashList.json