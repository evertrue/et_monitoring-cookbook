#
# Cookbook Name:: et_monitoring
# Recipe:: agent
#
# Copyright (C) 2013 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

api_keys = Chef::EncryptedDataBagItem.load('secrets', 'api_keys')

node.set['newrelic-ng']['license_key'] = api_keys['newrelic']
node.set['copperegg']['apikey'] = api_keys['copperegg']

include_recipe 'copperegg'

# Only install & enable the New Relic server monitor if desired
# Is overridden in other cookbooks
if node['et_monitoring']['newrelic_enabled']
  include_recipe 'newrelic-ng'
end

include_recipe 'et_datadog'
