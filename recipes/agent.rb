node.set['newrelic']['server_monitoring']['license'] = Chef::EncryptedDataBagItem.load("secrets","api_keys")["newrelic"]
node.set['copperegg']['apikey'] = Chef::EncryptedDataBagItem.load("secrets","api_keys")["copperegg"]

include_recipe "copperegg"

include_recipe "newrelic::repository"
include_recipe "newrelic::server-monitor"

include_recipe "et_datadog"
