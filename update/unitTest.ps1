$containerName = "cnd_server"

#unit test
$newContainerId = docker ps -aqf "name=$containerName" -f "status=running"


if($newContainerId){
    $response = Invoke-WebRequest -Uri http://localhost:3000 -UseBasicParsing

    if($response.StatusCode -eq 200){
        Write-Host "Unit Test Passed"
    }
    
}