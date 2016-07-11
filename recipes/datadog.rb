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
  end
end