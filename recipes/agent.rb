#
# Cookbook Name:: et_monitoring
# Recipe:: agent
#
# Copyright (C) 2013 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

unless node['et_monitoring']['mock']
  node.set['newrelic']['license'] = data_bag_item('secrets', 'api_keys')['newrelic']
end

include_recipe 'newrelic'
