$latest = "node:16.2.0-alpine3.13"
$filePath = 'C:\Users\kiki\Desktop\cnd\Dockerfile'
$containerName = "cnd_server"

function getNodeVersion {
    $imageData = docker image inspect $containerName

    $node = $imageData | ConvertFrom-Json

    $node.config.env | Where-Object {$_ -match "NODE_VERSION"}
    
}

#verify node version
$oldVersion = getNodeVersion


#makes changes to Dockerfile
$dockerfile = Get-Content -Path $filePath

$oldBaseImage = $dockerfile | Where-Object {$_ -match "From"}

$newBaseImage = "FROM " + $latest

Write-Host "Updating Dockerfile: replacing $oldBaseImage with $newBaseImage"

$updateVersion = $dockerfile -replace $oldBaseImage, $newBaseImage 

$updatedDockerfile = $updateVersion | Set-Content -Path $filePath



#cleanup
$oldContainerId = docker ps -aqf "name=$containerName"

if($oldContainerId){
    Write-Host "Cleaning up running or exited container"
     
    docker stop $oldContainerId
    docker rm $oldContainerId
}

#rebuild and restart in detached mode
Write-Host "Rebuilding & Restarting container"
docker-compose up -d --build

 
$newVersion = getNodeVersion

Write-Host "Successfully updated node:alpine from $oldVersion to $newVersion"


