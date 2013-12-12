name             'et_monitoring'
maintainer       'EverTrue, Inc.'
maintainer_email 'eric.herot@evertrue.com'
license          'All rights reserved'
description      'Installs/Configures et_monitoring'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.1.0'

depends 'copperegg'
depends 'newrelic'
depends 'chef_handler'
depends 'et_datadog', '= 1.0.1'
