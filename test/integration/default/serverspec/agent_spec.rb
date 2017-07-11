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
  describe command("sudo -u shinkenagent sh -c \"sudo -n /usr/bin/find /proc -ignore_readdir_race -path '/proc/*/fd/*' -not -path '/proc/self/*' -mmin +720 -ls\"") do
    its(:exit_status) { is_expected.to eq 0 }
  end
end

describe 'Deleted files command with non-allowed args' do
  describe command("sudo -u shinkenagent sh -c \"sudo -n /usr/bin/find /proc -ignore_readdir_race -path '/proc/*/fd/*' -not -path '/proc/self/*' -mmin +720 -ls --blah\"") do
    its(:exit_status) { is_expected.to eq 1 }
  end
end

describe file '/usr/local/bin/suspend-monitoring' do
  describe '#content' do
    subject { super().content }
    it { is_expected.to include '10.99.5.247' }
  end
end
