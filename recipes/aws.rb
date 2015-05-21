creds = data_bag_item('secrets', 'aws_credentials')['EtCloudWatchAlerts']

node['cloudwatch_alarms'].each do |name, conf|
  et_cloudwatch_alert name do
    access_key_id creds['access_key_id']
    secret_access_key creds['secret_access_key']
    conf.each { |key, value| send(key, value) }
  end
end
