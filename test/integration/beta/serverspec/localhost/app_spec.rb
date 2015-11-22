# Encoding: UTF-8

require_relative '../spec_helper'

describe 'Microsoft Remote Desktop beta app' do
  describe file('/Applications/Microsoft Remote Desktop Beta.app') do
    it 'is present on the filesystem' do
      expect(subject).to be_directory
    end
  end
end
