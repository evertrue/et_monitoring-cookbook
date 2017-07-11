default['datadog']['agent_version'] = value_for_platform ubuntu: {
  %w(12.04 14.04) => '1:5.10.1-1',
  '16.04' => '1:5.14.1-1'
}
default['et_monitoring']['datadog'] = {}
