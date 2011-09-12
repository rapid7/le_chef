Logging support for Scalarium
=============================

Requirements:

- Scalarium account - <http://scalarium.com/>
- Logentries account - sign up at <https://logentries.com/> 

See also <http://support.scalarium.com/kb/tutorials/customizing-your-scalarium-cloud-using-chef-configuring-custom-cookbooks/>

Set up a cloud in Scalarium, with Ubuntu 10.04 or higher as the default operating system.

Open the cloud and go to Actions -> Manage Cookbooks.

Enable custom cookbooks.

- Repository Type: Git
- Repository URL: git://github.com/logentries/le_chef.git
- Deploy SSH Key, Brach/Revision: leave empty

To configure the Logentries cookbook, go to Actions -> Edit Cloud and add the following to the Custom JSON field.

    "le" : {
    	"userkey"			: "your user key"			--> see logentries.com/getsetup for information on obtaining your user key
    	"hostname"			: "Hostname"				--> optional - default hostname is "Scalarium"
    	"logs_to_follow"	: ["path_to_log_file 1", ..]--> list of paths to log files you want to follow
    }

Add a role with at least one instance to the cloud, if none already exist, and add `Logentries` to the 'setup' action in Custom Recipes.

When the instance is started, the server will be registered and the given log files will be followed.

To add more log files, first delete the JSON from the cloud custom JSON. 

Go to Actions > Execute Recipes.

- Recipes: Logentries
- Custom JSON: 

        "le" : {
        	"logs_to_follow" : ["path_to_log_file 1", ..]
        }