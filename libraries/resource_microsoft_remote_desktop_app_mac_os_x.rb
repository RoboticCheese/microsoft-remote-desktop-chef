# Encoding: UTF-8
#
# Cookbook Name:: microsoft-remote-desktop
# Library:: resource_microsoft_remote_desktop_app_mac_os_x
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
    # A Chef resource for installing Microsoft Remote Desktop from the Mac App
    # Store.
    #
    # @author Jonathan Hartman <j@p4nt5.com>
    class MicrosoftRemoteDesktopAppMacOsX < Resource
      provides :microsoft_remote_desktop_app, platform_family: 'mac_os_x'

      Chef::Resource::MacAppStoreApp.allowed_actions.each do |a|
        action a do
          include_recipe 'mac-app-store' unless a == :nothing

          mac_app_store_app 'Microsoft Remote Desktop' do
            bundle_id 'com.microsoft.rdc.mac'
            action a
          end
        end
      end
    end
  end
end
