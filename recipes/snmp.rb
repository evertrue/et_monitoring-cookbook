node.set['snmp']['community'] =
  data_bag_item('secrets', 'monitoring')['snmp']['default_community']

if node['platform_family'] == 'debian'
  include_recipe 'apt'
  resources(execute: 'apt-get update').run_action(:run)
end

include_recipe 'snmp'
