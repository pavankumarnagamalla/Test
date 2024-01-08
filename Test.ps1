
$user = "svcShippingLabel"
$pass = "9&N)N1eV+tnf3B@6NYHp!Hl%(d=M="

# Build auth header
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $user, $pass)))
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
# Set proper headers
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add('Authorization',('Basic {0}' -f $base64AuthInfo))
$headers.Add('Accept','application/json')
$headers.Add('Content-Type','application/json')

# Specify endpoint URI
$uri = "https://khcdev.service-now.com/api/now/table/sc_task/415dd7411bf0291025db0d0cf94bcb77"

# Specify HTTP method (in uppercase)
$method = "PATCH"

# Specify request body with escaped double quotes
$body = '{ "work_notes": "test worknotes from API Powershell SSL" }'

# Send HTTP request
$response = Invoke-RestMethod -Headers $headers -Method $method -Uri $uri -Body $body

# Print response
$response.RawContent
