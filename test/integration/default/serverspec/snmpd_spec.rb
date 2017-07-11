require 'spec_helper'

describe 'et_monitoring::snmpd' do
  describe service 'snmpd' do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

  # Gets the actual SNMP device number for the '/' device
  o = `snmpwalk -v 1 -c testcommunity localhost .1.3.6.1.4.1.2021.9.1.2`
  snmp_device_number = o.split("\n").grep(%r{"/"})[0].split[0].split('.')[-1]

  # As per https://github.com/evertrue/et_monitoring-cookbook/pull/5#issuecomment-231171948
  # this test now looks for a line that has a non-zero integer
  describe command "snmpwalk -v 1 -c testcommunity localhost .1.3.6.1.4.1.2021.9.1.10.#{snmp_device_number}" do
    its(:stdout) do
      is_expected.to match(/iso.3.6.1.4.1.2021.9.1.10.#{snmp_device_number} = INTEGER: [1-9]/)
    end
  end
end
