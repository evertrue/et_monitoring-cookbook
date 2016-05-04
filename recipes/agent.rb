#
# Cookbook Name:: et_monitoring
# Recipe:: agent
#
# Copyright (C) 2013 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

node.set['newrelic']['license'] = data_bag_item('secrets', 'api_keys')['newrelic']

include_recipe 'newrelic'
include_recipe 'et_monitoring::threatstack' if node['et_monitoring']['threatstack_enabled']
include_recipe 'et_monitoring::snmpd'

# Ensure New Relic can monitor Docker containers, if it is installed
service 'newrelic-sysmond' do
  action :nothing
end

group 'docker' do
  members %w(docker newrelic)
  action :modify
  only_if { node['etc']['passwd']['docker'] }
  notifies :restart, 'service[newrelic-sysmond]'
end
