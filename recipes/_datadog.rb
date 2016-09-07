#
# Cookbook Name:: et_monitoring
# Recipe:: datadog
#
# Copyright (c) 2016 EverTrue, All Rights Reserved.

datadog_creds = data_bag_item('secrets', 'api_keys')['datadog']

node.default['datadog']['api_key']         = datadog_creds['api_key']
node.default['datadog']['application_key'] = datadog_creds['application_keys']['chef_agent']

include_recipe 'datadog::dd-agent'
include_recipe 'datadog::dd-handler'

node['et_monitoring']['datadog'].each do |dd_monitor, conf|
  datadog_monitor dd_monitor do
    conf.each { |key, value| send(key, value) }

    # This is a little confusing...
    #
    # If a cookbook is defined, we expect to use the template from that
    # cookbook. Otherwise, use the integration.yaml.erb included as part of the
    # Datadog cookbook:
    # https://github.com/DataDog/chef-datadog/blob/master/templates/default/integration.yaml.erb
    use_integration_template !conf['cookbook']
  end
end
