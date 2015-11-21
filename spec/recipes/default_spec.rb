# Encoding: UTF-8

require_relative '../spec_helper'

describe 'microsoft-remote-desktop::default' do
  let(:platform) { nil }
  let(:runner) { ChefSpec::SoloRunner.new(platform) }
  let(:chef_run) { runner.converge(described_recipe) }

  context 'Mac OS X platform' do
    let(:platform) { { platform: 'mac_os_x', version: '10.10' } }

    it 'installs the Microsoft Remote Desktop app' do
      expect(chef_run).to install_microsoft_remote_desktop_app('default')
    end
  end
end
