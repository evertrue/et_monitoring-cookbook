#
# Cookbook Name:: et_monitoring
# Recipe:: _livestatus
#
# Copyright (C) 2017 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

apt_repository 'brightbox-ruby' do
  uri 'http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu'
  distribution node['lsb']['codename']
  components %w(main)
  keyserver 'keyserver.ubuntu.com'
  key 'C3173AA6'
end

package 'ruby2.2'
package 'ruby2.2-dev'

gem_package 'livestatus-client'

if Chef::Config[:solo]
  fail 'Chef search is required by this recipe and does not work with Chef Solo'
else
  template '/usr/local/bin/suspend-monitoring' do
    variables(
      monitor_server_ip: search(
        :node,
        "recipes:et_monitor_server\\:\\:default AND chef_environment:#{node.chef_environment}"
      ).first['ipaddress'],
      monitor_server_port: 50_000
    )
    mode 0o755
  end
end

node.default['reboot_coordinator']['pre_reboot_commands']['suspend_monitoring'] =
  '/usr/local/bin/suspend-monitoring 300'
