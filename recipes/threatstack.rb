#
# Cookbook Name:: et_monitoring
# Recipe:: threatstack
#
# Copyright (c) 2015 EverTrue, All Rights Reserved.

set['threatstack']['deploy_key'] = 'xyz'

include_recipe 'threatstack'
