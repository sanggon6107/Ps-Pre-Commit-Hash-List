$hashPath=".\\folder1"
if (Test-Path $hashPath\hashList.json) {
    Remove-Item $hashPath\hashList.json
}
Get-ChildItem -Path . -Recurse -Filter *.dll | Get-FileHash -Algorithm MD5 | Select Hash, Path | ConvertTo-Json > $hashPath\hashList.json
git add $hashPath\hashList.json