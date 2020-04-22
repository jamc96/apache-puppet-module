require 'spec_helper'

describe 'apache::vhost' do
  let(:title) { 'custom_vhost_1' }
  let(:params) do
    {}
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

    end
  end
end
