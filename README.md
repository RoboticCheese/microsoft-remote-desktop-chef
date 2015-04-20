Microsoft Remote Desktop Cookbook
=================================
[![Cookbook Version](https://img.shields.io/cookbook/v/microsoft-remote-desktop.svg)][cookbook]
[![Build Status](https://img.shields.io/travis/RoboticCheese/microsoft-remote-desktop-chef.svg)][travis]
[![Code Climate](https://img.shields.io/codeclimate/github/RoboticCheese/microsoft-remote-desktop-chef.svg)][codeclimate]
[![Coverage Status](https://img.shields.io/coveralls/RoboticCheese/microsoft-remote-desktop-chef.svg)][coveralls]

[cookbook]: https://supermarket.chef.io/cookbooks/microsoft-remote-desktop
[travis]: https://travis-ci.org/RoboticCheese/microsoft-remote-desktop-chef
[codeclimate]: https://codeclimate.com/github/RoboticCheese/microsoft-remote-desktop-chef
[coveralls]: https://coveralls.io/r/RoboticCheese/microsoft-remote-desktop-chef

A Chef cookbook to install the Microsoft Remote Desktop app.

Requirements
============

This cookbook offers a recipe-based and a resource-based install. Use of the
resource requires that you open a `mac_app_store` resource prior in your Chef
run.

Usage
=====

Either add the default recipe to your run_list, or implement the resource in
a recipe of your own.

Recipes
=======

***default***

Opens the Mac App Store and performs a simple install of the app.

Resources
=========

***microsoft_remote_desktop_app***

Used to perform installation of the app.

Syntax:

    microsoft_remote_desktop_app 'default' do
        action :install
    end

Actions:

| Action     | Description     |
|------------|-----------------|
| `:install` | Install the app |

Attributes:

| Attribute  | Default        | Description          |
|------------|----------------|----------------------|
| action     | `:install`     | Action(s) to perform |

Providers
=========

***Chef::Provider::MicrosoftRemoteDesktopApp***

Provider for handling installation of the app.

Contributing
============

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add tests for the new feature; ensure they pass (`rake`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

License & Authors
=================
- Author: Jonathan Hartman <j@p4nt5.com>

Copyright 2015 Jonathan Hartman

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
