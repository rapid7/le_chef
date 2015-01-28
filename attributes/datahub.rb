default['le']['datahub']['version'] = '1.2.0.261'
default['le']['datahub']['checksum'] = '1dc4c424c6ecc1cf45817609e91272785908969797c94092ec594bf1f8bccdf6'

default['le']['datahub']['interval'] = 5
default['le']['datahub']['autoupdate'] = true
default['le']['datahub']['update_datahub'] = false

default['le']['datahub']['local_path'] = '/etc/leproxy'
default['le']['datahub']['amazon_s3_secret_key'] = ''
default['le']['datahub']['amazon_s3_account_id'] = ''
default['le']['datahub']['amazon_s3_bucket'] = ''
default['le']['datahub']['amazon_s3_encryption_key_file'] = '/etc/leproxy/public_key.txt'

default['le']['datahub']['logging']['default']['logInterval']= 0
default['le']['datahub']['logging']['default']['logLocally'] = false
default['le']['datahub']['logging']['default']['sendToLogentries'] = true

default['le']['datahub']['logging']['heartbeat']['logInterval']= 5
default['le']['datahub']['logging']['heartbeat']['logLocally'] = false
default['le']['datahub']['logging']['heartbeat']['sendToLogentries'] = true

default['le']['datahub']['logging']['system-stats']['logInterval']= 5
default['le']['datahub']['logging']['system-stats']['logLocally'] = false
default['le']['datahub']['logging']['system-stats']['sendToLogentries'] = false

default['le']['datahub']['rules'] = []
default['le']['datahub']['filters'] = []
