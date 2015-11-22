# Encoding: UTF-8

require_relative '../spec_helper'

describe 'Microsoft Remote Desktop beta app' do
  describe file('/Applications/Microsoft Remote Desktop Beta.app') do
    it 'is not present on the filesystem' do
      expect(subject).to_not be_directory
    end
  end
end
