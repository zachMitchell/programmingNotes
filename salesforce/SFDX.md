* Update the SDFX command: `sfdx update`
* Authorizing an org and setting it as default: `sfdx auth:web:login --setdefaultdevhubusername --setalias anyNameYouWant`
    * Just setting as default: `sfdx force:config:set defaultusername=lightningWebComponents`
* Seeing a list of orgs: `sfdx force:org:list`
* setting the default org across the entire machine: `sfdx config:set defaultdevhubusername=anyNameYouWant --global`
* Grabbing assets based on an xml file, specifically from package.xml in the trailhead example: `sfdx force:source:retrieve --manifest assets/package.xml --targetusername DevHub --wait 10`
    * --targetusername should be the alias of the org you set.
    * not sure what --wait 10 is if it's supposed to be 10 minutes or seconds...

* Export SOQL queries to a json file! `sfdx force:data:tree:export --targetusername anyName --outputdir ./place/to/export --query "SELECT Id, Name, Birthday FROM Contact"`
* If you get this error when trying to make a scratch org from SFDX: `ERROR running force:org:create:  The requested resource does not exist`, Enable dev hub in the salesforce setup. (https://trailhead.salesforce.com/trailblazer-community/feed/0D53A00003DJT0jSAH)
* sfdx `force:source:push` - push changes to a scratch org.
* `sfdx force:org:create --setdefaultusername --setalias nameHere --definitionfile config/project-scratch-def.json`
    * Create a new scratch org, set it as default, with a name of "nameHere". The settings are in --definitionfile.
* on an `sfdx force` command, `--targetusername` will help you select any org that you've saved.
* `sfdx force:source:deploy --targetusername glouriousNameHere --sourcepath force-app` - send salesforce data to this org from the force-app directory.
* sfdx `force:org:open` - opens the default org that was set for this directory