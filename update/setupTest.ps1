$olderVersion = "FROM node:16.1.0-alpine3.13"
$filePath = 'C:\Users\kiki\Desktop\cnd\Dockerfile'

#revert Dockerfile to older version
$dockerfile = Get-Content -Path $filePath
$currentBaseImage = $dockerfile | Where-Object {$_ -match "From"}
$revertVersion = $dockerfile -replace $currentBaseImage, $olderVersion

$revertDockerfile = $revertVersion | Set-Content -Path $filePath

#start container
docker-compose up -d --build