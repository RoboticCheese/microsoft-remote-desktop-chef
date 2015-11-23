require_relative '../../../spec_helper'

describe 'resource_microsoft_remote_desktop::mac_os_x::10_10' do
  let(:action) { nil }
  let(:beta) { nil }
  let(:runner) do
    ChefSpec::SoloRunner.new(
      step_into: 'microsoft_remote_desktop',
      platform: 'mac_os_x',
      version: '10.10'
    ) do |node|
      node.set['microsoft_remote_desktop']['beta'] = beta unless beta.nil?
    end
  end
  let(:converge) do
    r = "microsoft_remote_desktop_test::#{action}#{'_beta' if beta}"
    runner.converge(r)
  end

  context 'the default action (:install)' do
    let(:action) { :default }

    context 'the default beta property (nil)' do
      let(:beta) { nil }
      cached(:chef_run) { converge }

      it 'does a default App Store install' do
        expect(chef_run).to install_microsoft_remote_desktop_app('default')
      end
    end

    context 'an overridden beta property' do
      let(:beta) { true }
      cached(:chef_run) { converge }

      it 'does a beta install' do
        expect(chef_run).to install_microsoft_remote_desktop_app_beta('default')
      end
    end
  end

  context 'the :remove action' do
    let(:action) { :remove }

    context 'an overridden beta property' do
      let(:beta) { true }
      cached(:chef_run) { converge }

      it 'does a beta removal' do
        expect(chef_run).to remove_microsoft_remote_desktop_app_beta('default')
      end
    end
  end
end
