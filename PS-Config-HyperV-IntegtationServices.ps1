# Enable all integration services on the virtual machine
# Run this script on the Host
Set-VMhost -EnableEnhancedSessionMode $True

$vms = get-vm
foreach ($vm in $vms) {
    Write-Host "VM: $($VM.name)"
    $services = Get-VMIntegrationService -VMName $vm.VMName | Where-Object enabled -eq $false
    foreach ($service in $services) {
        Write-Host "Service: $($service.name)"
        Enable-VMIntegrationService -VMName $vm.VMName -Name $service.name
    }
}

set-vm -Name (get-vm | Where-Object {$_.name -like "*CL1" } ).name -MemoryStartupBytes 4gb