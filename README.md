# Salesforce DX School Project: Deploy your Salesforce App

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How To Use Postman With Salesforce ?

*Sources : https://trailhead.salesforce.com/fr/content/learn/projects/quick-start-connect-postman-to-salesforce/set-up-your-org*

### Set Up Cross-Origin Resource Sharing in Salesforce

1. In your Trailhead Playground, from Setup, enter cors in the Quick Find box and select CORS.
2. In the Allowed Origins List, click New.
3. Enter https://*.postman.com as the Origin URL Pattern.
4. Click Save.
5. Select CORS again.
6. Click New and enter https://*.postman.co (note the .co domain extension) as the Origin URL Pattern.
7. Click Save.

### Sign Up for Postman and Create a Workspace

We use the WEB browser app for this project.

1. Sign in to your Postman account or sign up for an account.
2. Select the Workspaces menu.
3. Select Create Workspace.
4. Name your workspace SalesforceCollection.
5. Set Visibility to Personal.
6. Click Create Workspace.

### In Postman Get Salesforce Collections and Create a Fork that Collection

1. Open the public Salesforce Developers workspace to create a fork of the Salesforce APIs collection.
2. In Collections, select Salesforce Platform APIs to expand it.
3. Click Create Fork to create a fork of the collection.
4. Enter MySalesforceAPIFork.
5. Keep SalesforceCollection as the Workspace.
6. Click Fork Collection.

### Authorize Your Org

You need to authenticate with Salesforce to access the APIs. Authentication grants you an access token that's valid for a certain duration. **Repeat this process whenever your access token expires.**

1. Be sure you're logged in to only one Trailhead Playground in your browser.
2. In Postman, under Collections, Salesforce Platform APIs should be selected.
3. Be sure No Environment is selected.
4. The Authorization tab should be open.
5. Type should be OAuth 2.0.
6. Click Get New Access Token.
7. In your Internet Browser, click Allow to let the “Salesforce Platform APIs Collection for Postman” access your Trailhead Playground.
8. A success message appears briefly, and then you're redirected to the Manage Access Tokens dialog. 
9. Verify that the instance_url points to your Trailhead Playground.
10. Copy the instance_url to use in step 12. Be sure to copy only the URL with no extra characters.
11. Click Use Token.
12. Open the Variables tab.
13. In the _endpoint row, CURRENT VALUE column, paste the instance_url value that you copied in step 9.
14. Click Save.
### Test Connexion Between Postman and Salesforce Org
1. In Postman Collections, select Salesforce Platform APIs to expand it.
2. Select REST to expand it.
3. Select GET Limits.
4. Limits opens in the main panel.
5. Click Send. 
6. In Postman the window will show "Status 200 OK".
### Test Connexion By Posting an Account
1. In Postman, Under REST, select SObject, and then select POST SObject Create.
2. Open the Params tab.
3. Under Path Variables, in the SOBJECT_API_NAME row, VALUE column, enter Account.
4. Open the Body tab and replace the body text with this code: 
{
  "Name": "Postman",
  "BillingState": "CA"
}
5. Click Save
6. Click Send
7. In Postman the window will show "Status 201 Created".
8. In the instance of Salesforce Organisation, you will find a new Account named "Postman".


