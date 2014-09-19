name             'et_monitoring'
maintainer       'EverTrue, Inc.'
maintainer_email 'devops@evertrue.com'
license          'All rights reserved'
description      'Installs/Configures et_monitoring'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.8.1'

depends 'newrelic',   '~> 2.0'
depends 'et_datadog', '= 2.0.0'
