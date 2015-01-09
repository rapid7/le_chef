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
