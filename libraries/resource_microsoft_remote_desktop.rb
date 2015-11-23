# Encoding: UTF-8
#
# Cookbook Name:: microsoft-remote-desktop
# Library:: resource_microsoft_remote_desktop
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
    # A parent Chef resource for managing Microsoft Remote Desktop installs.
    #
    # @author Jonathan Hartman <j@p4nt5.com>
    class MicrosoftRemoteDesktop < Resource
      provides :microsoft_remote_desktop

      property :beta, [TrueClass, FalseClass, nil], default: false

      action :install do
        if beta
          microsoft_remote_desktop_app_beta name
        else
          microsoft_remote_desktop_app name
        end
      end

      action :remove do
        if beta
          microsoft_remote_desktop_app_beta(name) { action :remove }
        else
          microsoft_remote_desktop_app(name) { action :remove }
        end
      end
    end
  end
end
