# Encoding: UTF-8
#
# Cookbook Name:: microsoft-remote-desktop
# Library:: resource_microsoft_remote_desktop_app_beta_mac_os_x
#
# Copyright 2015 Jonathan Hartman
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'chef/resource'

class Chef
  class Resource
    # A Chef resource for installing the beta version of Microsoft Remote
    # Desktop for OS X from HockeyApp.
    #
    # @author Jonathan Hartman <j@p4nt5.com>
    class MicrosoftRemoteDesktopAppBetaMacOsX < Resource
      PATH ||= '/Applications/Microsoft Remote Desktop Beta.app'.freeze

      provides :microsoft_remote_desktop_app_beta, platform_family: 'mac_os_x'

      action :install do
        remote_file download_path do
          source remote_path
          action :create
          only_if { !::File.exist?(PATH) }
        end
        execute "unzip -d /Applications #{download_path}" do
          action :run
          creates PATH
        end
      end

      action :remove do
        [
          PATH,
          ::File.expand_path('~/Library/Application Support/com.microsoft.' \
                             'rdc.osx.beta'),
          ::File.expand_path('~/Library/Logs/Microsoft Remote Desktop Beta')
        ].each do |d|
          directory d do
            recursive true
            action :delete
          end
        end
      end

      def download_path
        ::File.join(Chef::Config[:file_cache_path], 'mrdc_beta.zip')
      end

      def remote_path
        'https://rink.hockeyapp.net/api/2/apps/' \
          '5e0c144289a51fca2d3bfa39ce7f2b06?' \
          'format=zip&amp;avtoken=c795166f250f48e1f5b7f7e02ee43d58e7dfa492'
      end
    end
  end
end
