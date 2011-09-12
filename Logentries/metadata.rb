maintainer 'Caroline Fenlon'

maintainer_email 'carfenlon@gmail.com'

version '0.0.1'

license 'Apache 2.0'

description 'Installs and configures LE python'

long_description 'Installs the Logentries python agent and configures it to follow logs specified in a JSON object'

recipe 'Logentries::default' 'Downloads the agent and sets up logging'

supports 'ubuntu 10.04 and higher'