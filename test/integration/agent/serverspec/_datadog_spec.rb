require 'spec_helper'

describe 'Datadog Monitoring' do
  describe file '/etc/dd-agent/datadog.conf' do
    describe '#content' do
      subject { super().content }
      it { is_expected.to include 'api_key: somethingnotnil' }
    end
  end

  describe file '/etc/dd-agent/conf.d/test_service.yaml' do
    describe '#content'
    subject { super().content }
    it do
      is_expected.to contain '# Generated by Chef, local modifications will be overwritten

---
instances:
- host: localhost
  port: 22
  timeout: 8
  tags:
    test_service: dev
    env: dev
init_config: {}'
    end
  end

  describe service 'datadog-agent' do
    it { is_expected.to be_running }
    it { is_expected.to be_enabled }
  end
end