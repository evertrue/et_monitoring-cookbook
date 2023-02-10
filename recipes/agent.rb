#
# Cookbook Name:: et_monitoring
# Recipe:: agent
#
# Copyright (C) 2013 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'et_monitoring::threatstack' if node['et_monitoring']['threatstack_enabled']
include_recipe 'et_monitoring::snmpd'
include_recipe 'et_monitoring::_datadog' if node['et_monitoring'].fetch('datadog', {}).any?

group 'docker' do
  members %w(docker)
  action :modify
  only_if { node['etc']['passwd']['docker'] }
end

# Allows the Shinken Agent to log in and list out deleted files
sudo 'list_deleted_files' do
  user 'shinkenagent'
  commands [
    '/usr/bin/find /proc -ignore_readdir_race -path /proc/*/fd/* -not -path ' \
      '/proc/self/* -mmin +720 -ls'
  ]
  nopasswd true
end

