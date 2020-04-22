require 'spec_helper'

describe 'apache::service' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

    end
  end
end
