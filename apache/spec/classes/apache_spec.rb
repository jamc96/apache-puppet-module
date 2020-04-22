require 'spec_helper'

describe 'apache' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      # validating class declaration
      it { is_expected.to contain_class('apache::install') }
      it { is_expected.to contain_class('apache::config') }
      it { is_expected.to contain_class('apache::service') }
      # validating package installation
      it {
        is_expected.to contain_package('httpd').with(
          ensure: 'present',
          provider: 'yum',
        )
      }
      # validating configuration file existance
      it {
        is_expected.to contain_file('/etc/httpd/conf/httpd.conf').with_ensure('file')
      }
      # validating if the service is running
      it {
        is_expected.to contain_service('httpd').with_ensure('running')
      }
    end
  end
end
