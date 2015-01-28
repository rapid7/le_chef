Logentries Chef Cookbook
==============

Installs/Configures the Logentries agent to allow logging to [Logentries](https://logentries.com)

Requirements
------------

### Platform:

* Debian
* Ubuntu
* Rhel

### Cookbooks:

The following are dependencies of the Logentries cookbook

* apt
* yum

Attributes
----------

### Default

* `node['le']['account_key']` - your Logentries account_key (this can be found following [this link](https://logentries.com/doc/accountkey/))
* `node['le']['hostname']` - sets the hostname of the log to the machine name, defaults to `node['hostname']`
* `node['le']['logs_to_follow']` - An array of logs to follow (use absolute paths)
* `node['le']['datahub']['enable]` - Send to datahub server
* `node['le']['datahub']['server_ip]` - IP of datahub server
* `node['le']['datahub']['port]` - Port of datahub server

### DataHub

* `node['le']['datahub']['version']` - Version of the DataHub you would like to install (should already be on the latest)
* `node['le']['datahub']['checksum']` - Checksum to use in order to verify the DataHub package

* `node['le']['datahub']['interval']` - How often the DataHub talks to 
* `node['le']['datahub']['autoupdate']` - true
* `node['le']['datahub']['update_datahub']` - false

* `node['le']['datahub']['local_path']` - '/etc/leproxy'
* `node['le']['datahub']['amazon_s3_secret_key']` - ''
* `node['le']['datahub']['amazon_s3_account_id']` - ''
* `node['le']['datahub']['amazon_s3_bucket']` - ''
* `node['le']['datahub']['amazon_s3_encryption_key_file']` - '/etc/leproxy/public_key.txt'

* `node['le']['datahub']['rules']` - An array of rules to apply to logs, have a look at the leproxy.config.example file for examples
* `node['le']['datahub']['filters']` - An array of filters to apply to logs, have a look at the leproxy.config.example file for examples

Usage
-----

Put depends 'yum', and 'apt', in your metadata.rb to gain access to the resources.

Updating the Logentries Agent
=============================

Restarting the Chef script will allow the recipe to install any updates to the Logentries agent.

License and Author
------------------

* Author:: Joe Heung (<joe.heung@logentries.com>)
* Author:: Caroline Fenlon

Copyright (C) 2014, RevelOps Inc.

License:: All rights reserved
