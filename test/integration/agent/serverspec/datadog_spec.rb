require 'spec_helper'

describe 'Datadog Monitoring' do
  describe file '/etc/dd-agent/datadog.conf' do
    describe '#content' do
      subject { super().content }
      it { is_expected.to include 'api_key: somethingnotnil' }
    end
  end

  describe file '/etc/dd-agent/conf.d/kafka.yaml' do
    describe '#content'
    subject { super().content }
    it { is_expected.to include 'port: 19092' }
    it { is_expected.to include 'java_bin_path: /usr/bin/java' }
    it { is_expected.to match(/tags:(\s+)kafka:dev:(\s+)env:dev:/) }
  end

  describe service 'datadog-agent' do
    it { is_expected.to be_running }
    it { is_expected.to be_enabled }
  end
end
