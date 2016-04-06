#
# Cookbook Name:: et_monitoring
# Recipe:: datadog
#
# Copyright (c) 2016 EverTrue, All Rights Reserved.

datadog_creds = data_bag_item('secrets', 'api_keys')['datadog']
node.set['datadog']['api_key'] = datadog_creds['api_key']
node.set['datadog']['application_key'] = datadog_creds['application_keys']['chef_agent']

%w(
  dd-agent
  dd-handler
).each do |r|
  include_recipe "datadog::#{r}"
end
