name             'et_monitoring'
maintainer       'EverTrue, Inc.'
maintainer_email 'devops@evertrue.com'
license          'All rights reserved'
description      'Installs/Configures et_monitoring'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '3.1.0'

depends 'newrelic',   '~> 2.0'
depends 'et_cloudwatch', '~> 1.0'
depends 'threatstack', '~> 1.0'
depends 'snmp', '~> 3.0'
depends 'datadog', '~> 2.2'
depends 'sudo'
