Param(
  [Parameter(Mandatory=$True,Position=1)][string]$webURL
)

$web = Get-SPWeb $webURL
$caColl = $web.get_userCustomActions()
$newUCA = $caColl.Add()

$newUCA.set_title('JSUICustomization')
$newUCA.set_description('JSUICustomization')
$newUCA.set_location('ScriptLink')

$scriptOutput = @"
var headID = document.getElementsByTagName('head')[0];
var newScript = document.createElement('script');
newScript.type = 'text/javascript';
newScript.src = '$webURL/SiteAssets/jsStatusBar.js';
headID.appendChild(newScript);
"@

$newUCA.set_scriptblock($scriptOutput)
$newUCA.Update()

<#
######################################
## CODE TO REMOVE THE CUSTOMIZATION ##
######################################

$web = Get-SPWeb $webURL
$caColl = $web.get_userCustomActions()

$stufftoDelete = @()

#cant delete it while iterating the collection
$caColl | ForEach-Object {
   if ($_.description -eq 'JSUICustomization') { 
      $stuffToDelete += $_
   }
}

#actually delete the customization
foreach ($d in $stuffToDelete) {
   $d.Delete()
   Write-Host 'Customization deleted.'
}

#>
