Logging Support for Chef
========================

This cookbook is suitable for use with any Chef environment running on Ubuntu 10.04 or greater.

Requirements:

- Logentries account - sign up at <https://logentries.com/>
- Logentries userkey - <https://logentries.com/getsetup/> --> go with the api --> Chef Recipes

Attributes (as JSON):

    "le" : {
        "userkey"			: "logentries_userkey"
    	"hostname"			: "logentries_hostname"
    	"logs_to_follow"	: ["path_to_log_file 1", ..]
    }
    
When adding log files to follow, change to:

    "le" : {
        "logs_to_follow" : ["path_to_log_file 1", ..]
    }

Logging Support for Scalarium
-----------------------------

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
    	"userkey"			: "logentries_userkey"
    	"hostname"			: "logentries_hostname"
    	"logs_to_follow"	: ["path_to_log_file 1", ..]
    }
where

- ``logentries_userkey`` is the userkey obtained by following the instructions at <https://logentries.com/getsetup> --> Go with the api --> Scalarium
- ``logentries_hostname`` is the desired name for this machine in your Logentries account. Optional - default hostname is "Scalarium".
- ``["path_to_log_file 1", ..]`` is the list of paths to log files you want to follow.

Add a role with at least one instance to the cloud, if none already exist, and add `Logentries` to the 'setup' action in Custom Recipes.

When the instance is started, the server will be registered and the given log files will be followed.

To add more log files, first delete the JSON from the cloud custom JSON. 

Go to Actions > Execute Recipes.

- Recipes: Logentries
- Custom JSON: 

        "le" : {
        	"logs_to_follow" : ["path_to_log_file 1", ..]
        }