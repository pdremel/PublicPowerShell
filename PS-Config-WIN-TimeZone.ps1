# Changes the time zone to Central European Standard Time
# Run this script on the virtual machine named * -DC

Set-TimeZone -Id "Central European Standard Time"

# Set the correct domain and password
$passwd = 'Pa55w.rd'
$login = 'adatum\administrator'

$spasswd = $passwd | ConvertTo-SecureString -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential $login, $spasswd

$ADC = get-adcomputer -Filter *

foreach ($computer in $ADC) {
    Write-Host "$($computer.name)"
    Invoke-Command -ComputerName $computer.Name -Credential $cred -ScriptBlock {Set-TimeZone -Id "Central European Standard Time"}
}