#
# Cookbook Name:: et_monitoring
# Recipe:: threatstack
#
# Copyright (c) 2015 EverTrue, All Rights Reserved.

set['threatstack']['deploy_key'] = data_bag_item('secrets', 'api_keys')['threatstack']

include_recipe 'threatstack'
