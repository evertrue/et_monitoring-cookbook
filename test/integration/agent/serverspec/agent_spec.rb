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

  describe service 'datadog-agent' do
    it { is_expected.to be_running }
    it { is_expected.to be_enabled }
  end
end
