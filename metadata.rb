name              'le_chef'
maintainer        'Logentries'
maintainer_email  'support@logentries.com'
license           'Apache 2.0'
description       'Installs and configures the logentries agent'
long_description  'Installs the Logentries python agent and configures it to follow logs specified in a JSON object'
recipe            'logentries::default', 'Downloads the agent and sets up logging'
version           '0.0.5'

supports 'ubuntu'
supports 'rhel'

depends 'apt'
depends 'yum'

suggests 'java', '~> 1.22'