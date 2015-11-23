# Encoding: UTF-8

require_relative '../spec_helper'

describe 'microsoft-remote-desktop::default' do
  let(:beta) { nil }
  let(:runner) do
    ChefSpec::SoloRunner.new do |node|
      node.set['microsoft_remote_desktop']['beta'] = beta if beta
    end
  end
  let(:converge) { runner.converge(described_recipe) }

  context 'the default beta attribute (nil)' do
    let(:beta) { nil }
    cached(:chef_run) { converge }

    it 'installs the normal Microsoft Remote Desktop' do
      expect(chef_run).to install_microsoft_remote_desktop('default')
        .with(beta: nil)
    end
  end

  context 'an overridden beta attribute' do
    let(:beta) { true }
    cached(:chef_run) { converge }

    it 'installs the beta Microsoft Remote Desktop' do
      expect(chef_run).to install_microsoft_remote_desktop('default')
        .with(beta: true)
    end
  end
end
