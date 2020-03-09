Add-PSSnapin Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue
 
$AllWebApp = Get-SPSite
foreach ($WebApp in $AllWebApp) {
    Write-Host "WebApp url: $($WebApp.Url)" -ForegroundColor Green
    $WebApp = Get-SPWebApplication $($WebApp.Url)
    $SitesCollection  = $WebApp.Sites
    Foreach($Site in $SitesCollection) {
    #Get Site Collection URL, Owner, Content Database Details
    Write-host $Site.URL -ForegroundColor Yellow
    Backup-SPSite $($Site.URL) -Path 
    }
}