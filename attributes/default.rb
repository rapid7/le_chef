# Default
default['le']['account_key'] = ''
default['le']['hostname'] = node['hostname']

#default['le']['logs_to_follow'] = ['/var/log/syslog']
default['le']['logs_to_follow'] = [{:name => 'syslog', :log => '/var/log/syslog', :token => '00000000-1111-2222-3333-444444444444'}]

# Datahub
default['le']['datahub']['enable'] = false
default['le']['datahub']['server_ip'] = '127.0.0.1'
default['le']['datahub']['port'] = 10000

# Pull server side config
default['le']['pull-server-side-config'] = true
