if node.chef_environment == 'dev'

  default['et_monitoring']['datadog']['test_service'] = {
    instances: [
      {
        host: 'localhost',
        port: 22,
        timeout: 8,
        tags: {
          test_service: node.chef_environment,
          env: node.chef_environment,
        },
      },
    ],
  }
end
