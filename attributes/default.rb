# Default
default['le']['account_key'] = ''
default['le']['hostname'] = node['hostname']
default['le']['logs_to_follow'] = ['/var/log/syslog']

# Datahub
default['le']['datahub']['enable'] = false
default['le']['datahub']['server_ip'] = '127.0.0.1'
default['le']['datahub']['port'] = 10000
