# Encoding: UTF-8

require_relative '../spec_helper'

describe 'Microsoft Remote Desktop app' do
  describe package('com.microsoft.rdc.mac') do
    it 'is installed' do
      expect(subject).to be_installed.by(:pkgutil)
    end
  end

  describe file('/Applications/Microsoft Remote Desktop.app') do
    it 'is present on the filesystem' do
      expect(subject).to be_directory
    end
  end
end
