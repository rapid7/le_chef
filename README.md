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
* `node['le']['logs_to_follow']` - An array of logs to follow or a hash of arrays
* `node['le']['datahub']['enable']` - Defaulted to false
* `node['le']['datahub']['server_ip']` - IP of your datahub server
* `node['le']['datahub']['port']` - port datahub is running on, normally port 10000
* `node['le']['pull-server-side-config']` - Specifies whether to make an api call to pull configuration or not, by default this is set to true meaning an api call will be made to th

### Example of logs_to_follow
caveats - name needs to be unique
globbing is used in the agent -

Usage
-----
There are 3 main scenarios in which the Logentries Linux Agent can be run

### node['le']['datahub']['enable'] = false and node['le']['pull-server-side-config'] = true

* override['le']['logs_to_follow'] = ['/var/log/syslog']'
* override['le']['logs_to_follow'] = [{:name => 'syslog', :log => '/var/log/syslog'}]

This is the normal scenario where you install the agent, override node['le']['account_key'] and your logs_to_follow as above.
There are two ways of passing the logs to follow, as an array of logs or an array of hashes with the name of the log and the location of the log.

### node['le']['datahub']['enable'] = false and node['le']['pull-server-side-config'] = false

* override['le']['logs_to_follow'] = [{:name => 'syslog', :log => '/var/log/syslog', :token => '00000000-0000-0000-0000-000000000000'}]

This scenario is for users who wish to push a config up knowing their logs and tokens but do not want to make an API call to fetch this data.

### node['le']['datahub']['enable'] = true and node['le']['pull-server-side-config'] = false
* override['le']['logs_to_follow'] = [{:name => 'syslog', :log => '/var/log/syslog'}]

This scenario is for datahub users looking to push a config and not need to register to send their logs to their datahub instance.

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

Copyright (C) 2015, RevelOps Inc.

License:: All rights reserved
