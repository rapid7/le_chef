name              'logentries'
maintainer        'Logentries'
maintainer_email  'support@logentries.com'
license           'Apache 2.0'
description       'Installs and configures the logentries agent'
long_description  'Installs the Logentries python agent and configures it to follow logs specified in a JSON object'
recipe            'le_chef::default',   'Downloads the agent and sets up logging'
recipe            'le_chef::install',    'Download and install the agent from le repo'
recipe            'le_chef::configure', 'Register and le start agent, follow files'
version           '0.1.2'

supports 'ubuntu'
supports 'rhel'

depends 'apt'
depends 'yum'

suggests 'java', '~> 1.22'
