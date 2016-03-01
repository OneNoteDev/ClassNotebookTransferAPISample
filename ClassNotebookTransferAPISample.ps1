# Your Azure AD tenant name. E.g. "contoso.com"
$adTenant = <AZURE_AD_TENANT_NAME>

# Your app's client ID. E.g. "471afe29-4aee-4bc5-9aaf-468ee5bbe20a"
$clientId = <CLIENT_ID>

# Admin login name. E.g. "abigail.johnson@contoso.com"
$myLogin = <MY_ADMIN_LOGIN>

# Admin password
$myPassword = <MY_ADMIN_PASSWORD>

# The Id of the notebook in the source teacher OneDrive "1-XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXXX"
$notebookId = <NOTEBOOK_ID>

# Teacher with the original notebook Office365 login name. E.g. "robert.boyd@contoso.com"
$sourceTeacherLogin = <SOURCE_TEACHER_ID>

# Teacher where the notebook will be copied to Office365 login name. E.g. "michael.lee@contoso.com"
$destinationTeacherLogin = <DESTINATION_TEACHER_ID>

# Load Azure AD libraries
$adal = "${env:ProgramFiles(x86)}\Microsoft SDKs\Azure\PowerShell\ServiceManagement\Azure\Services\Microsoft.IdentityModel.Clients.ActiveDirectory.dll"

$adalforms = "${env:ProgramFiles(x86)}\Microsoft SDKs\Azure\PowerShell\ServiceManagement\Azure\Services\Microsoft.IdentityModel.Clients.ActiveDirectory.WindowsForms.dll"

[System.Reflection.Assembly]::LoadFrom($adal)

[System.Reflection.Assembly]::LoadFrom($adalforms)

# Set Resource URI to Azure Service Management API
$resourceAppIdURI = "https://onenote.com"

# Set Authority to Azure AD Tenant
$authority = "https://login.windows.net/$adTenant"

# Create Authentication Context tied to Azure AD Tenant
$authContext = New-Object "Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext" -ArgumentList $authority

$userCredential = New-Object "Microsoft.IdentityModel.Clients.ActiveDirectory.UserCredential" -ArgumentList $myLogin , $myPassword 

# Acquire token
$authResult = $authContext.AcquireToken($resourceAppIdURI, $clientId, $userCredential)

$accessToken = $authResult.AccessToken;

# Create a new class notebook
$transferJson = @"
{
    SourceId: "$notebookId",
    SourceUserId: "$sourceTeacherLogin",
    DestinationUserId: "$destinationTeacherLogin"
}
"@

$transfer = Invoke-RestMethod https://www.onenote.com/api/v0.1/classnotebook/transfer `
    -Method POST `
    -ContentType "application/json; charset=utf-8" `
    -Headers @{"Authorization" = "Bearer $accessToken"} `
    -Body $transferJson

Write-host $transfer
$transfer | clip
Read-Host	
