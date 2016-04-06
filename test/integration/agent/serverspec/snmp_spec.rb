require 'spec_helper'

describe 'et_monitoring::snmp' do
  describe command('snmpwalk -v 1 -c testcommunity localhost .1.3.6.1.4.1.2021.9.1.10') do
    its(:stdout) { is_expected.to include('iso.3.6.1.4.1.2021.9.1.10.1 = INTEGER: 12') }
  end
end
