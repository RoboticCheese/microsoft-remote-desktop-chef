# Encoding: UTF-8
#
# Cookbook Name:: microsoft-remote-desktop
# Library:: matchers
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

if defined?(ChefSpec)
  %i(microsoft_remote_desktop_app microsoft_remote_desktop_app_beta).each do |m|
    ChefSpec.define_matcher(m)

    define_method("install_#{m}") do |name|
      ChefSpec::Matchers::ResourceMatcher.new(m, :install, name)
    end
  end

  def remove_microsoft_remote_desktop_app_beta(name)
    ChefSpec::Matchers::ResourceMatcher.new(:microsoft_remote_desktop_app_beta,
                                            :remove,
                                            name)
  end
end
