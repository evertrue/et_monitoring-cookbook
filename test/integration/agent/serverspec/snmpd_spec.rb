require 'spec_helper'

describe 'et_monitoring::snmpd' do
  describe service 'snmpd' do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

  # As per https://github.com/evertrue/et_monitoring-cookbook/pull/5#issuecomment-231171948
  # this test now looks for a line that has a non-zero integer
  describe command 'snmpwalk -v 1 -c testcommunity localhost .1.3.6.1.4.1.2021.9.1.10' do
    its(:stdout) { is_expected.to match(/^iso.3.6.1.4.1.2021.9.1.10.1 = INTEGER: [1-9]\d*$/) }
  end
end
