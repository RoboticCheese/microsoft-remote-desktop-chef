require_relative '../../../spec_helper'

describe 'resource_microsoft_remote_desktop_app::mac_os_x::10_10' do
  let(:action) { nil }
  let(:runner) do
    ChefSpec::SoloRunner.new(step_into: 'microsoft_remote_desktop_app',
                             platform: 'mac_os_x',
                             version: '10.10')
  end
  let(:chef_run) do
    runner.converge("microsoft_remote_desktop_app_test::#{action}")
  end

  context 'the default action (:install)' do
    let(:action) { :default }

    it 'configures the Mac App Store' do
      expect(chef_run).to include_recipe 'mac-app-store'
    end

    it 'installs the Microsoft Remote Desktop app' do
      expect(chef_run).to install_microsoft_remote_desktop_app('default')
    end

    it 'installs via the App Store' do
      expect(chef_run).to install_mac_app_store_app('Microsoft Remote Desktop')
        .with(bundle_id: 'com.microsoft.rdc.mac')
    end
  end
end
