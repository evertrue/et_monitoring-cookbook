require 'spec_helper'

describe 'Server Monitoring' do
  describe file '/etc/newrelic/nrsysmond.cfg' do
    describe '#content' do
      subject { super().content }
      it { is_expected.to include 'TESTKEY_SERVER_AGENT' }
    end
  end

  describe service 'newrelic-sysmond' do
    it { is_expected.to_not be_running }
    it { is_expected.to be_enabled }
  end
end

describe 'Deleted files command with allowed args' do
  describe command("sudo -u shinkenagent sh -c 'sudo -n lsof -nP +L1'") do
    its(:exit_status) { is_expected.to eq 0 }
  end
end

describe 'Deleted files command with non-allowed args' do
  describe command("sudo -u shinkenagent sh -c 'sudo -n lsof -nP +L1 -b'") do
    its(:exit_status) { is_expected.to eq 1 }
  end
end
