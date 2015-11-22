require_relative '../../../spec_helper'

describe 'resource_microsoft_remote_desktop_app_beta::mac_os_x::10_10' do
  let(:action) { nil }
  let(:runner) do
    ChefSpec::SoloRunner.new(step_into: 'microsoft_remote_desktop_app_beta',
                             platform: 'mac_os_x',
                             version: '10.10')
  end
  let(:converge) do
    runner.converge("microsoft_remote_desktop_app_beta_test::#{action}")
  end

  context 'the default action (:install)' do
    let(:action) { :default }
    let(:installed?) { nil }

    before(:each) do
      allow(File).to receive(:exist?).and_call_original
      allow(File).to receive(:exist?)
        .with('/Applications/Microsoft Remote Desktop Beta.app')
        .and_return(installed?)
    end

    shared_examples_for 'any installed state' do
      it 'installs the app' do
        expect(chef_run).to install_microsoft_remote_desktop_app_beta('default')
      end

      it 'extracts the downloaded .zip package' do
        f = "#{Chef::Config[:file_cache_path]}/mrdc_beta.zip"
        expect(chef_run).to run_execute("unzip -d /Applications #{f}")
          .with(creates: '/Applications/Microsoft Remote Desktop Beta.app')
      end
    end

    context 'not already installed' do
      let(:installed?) { false }
      cached(:chef_run) { converge }

      it_behaves_like 'any installed state'

      it 'downloads the remote file' do
        s = 'https://rink.hockeyapp.net/api/2/apps/' \
            '5e0c144289a51fca2d3bfa39ce7f2b06?' \
            'format=zip&amp;avtoken=c795166f250f48e1f5b7f7e02ee43d58e7dfa492'
        expect(chef_run).to create_remote_file(
          "#{Chef::Config[:file_cache_path]}/mrdc_beta.zip"
        ).with(source: s)
      end
    end

    context 'already installed' do
      let(:installed?) { true }
      cached(:chef_run) { converge }

      it_behaves_like 'any installed state'

      it 'does not download the remote file' do
        expect(chef_run).to_not create_remote_file(
          "#{Chef::Config[:file_cache_path]}/mrdc_beta.zip"
        )
      end
    end
  end

  context 'the :remove action' do
    let(:action) { :remove }
    cached(:chef_run) { converge }

    it 'removes the app' do
      expect(chef_run).to remove_microsoft_remote_desktop_app_beta('default')
    end

    {
      application: '/Applications/Microsoft Remote Desktop Beta.app',
      support: File.expand_path('~/Library/Application Support/com.microsoft.' \
                                'rdc.osx.beta'),
      log: File.expand_path('~/Library/Logs/Microsoft Remote Desktop Beta')
    }.each do |dir, path|
      it "deletes the #{dir} directory" do
        expect(chef_run).to delete_directory(path).with(recursive: true)
      end
    end
  end
end
