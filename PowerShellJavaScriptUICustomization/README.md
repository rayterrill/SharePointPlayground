# SharePointPlayground
## JavaScript UI Customization with PowerShell
This example creates a JavaScript UI Customization - in this case a Status Bar entry like the one seen here https://msdn.microsoft.com/en-us/library/office/dn913116.aspx - except using PowerShell and not a provider-hosted app (which seems unnecessarily complicated).

#### Steps to Deploy:

1. Copy the jsStatusBar.js script to the Site Assets folder in your target web
2. Launch SharePoint Management Shell from one of your SharePoint servers as a user with sufficient access rights
3. Copy the deployJSUICustomization.ps1 script to a working folder and run it, passing in the webURL parameter for your target web:

`./deployJSUICustomization.ps1 -webURL https://mysharepointsite.mydomain.com/sites/mytestsite`

Launch the SharePoint page in the browser, and you should see that each page in the target site contains the Status bar entry.

*(Tested on SharePoint 2013 on-prem)*
