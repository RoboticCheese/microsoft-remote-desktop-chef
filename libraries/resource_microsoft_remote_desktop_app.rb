# Encoding: UTF-8
#
# Cookbook Name:: microsoft-remote-desktop
# Library:: resource_microsoft_remote_desktop_app
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

class Chef
  class Resource
    # A Chef resource for the Microsoft Remote Desktop app.
    #
    # @author Jonathan Hartman <j@p4nt5.com>
    class MicrosoftRemoteDesktopApp < MacAppStoreApp
      self.resource_name = :microsoft_remote_desktop_app

      #
      # Overload the app name with the one for this app.
      #
      attribute :app_name, kind_of: String, default: 'Microsoft Remote Desktop'

      #
      # Overload the bundle ID with the one for this app
      #
      attribute :bundle_id, kind_of: String, default: 'com.microsoft.rdc.mac'
    end
  end
end
