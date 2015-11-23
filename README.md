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

This cookbook offers a recipe-based and a resource-based install.

Installation via the Mac App Store requires either a user already be logged in,
or the proper `node['mac_app_store']['username']` and
`node['mac_app_store']['password']` attributes be provided.

As of version 1.0.0, this cookbook requires Chef 12.5 or newer.

Usage
=====

Either add the default recipe to your run_list, or implement the resource in
a recipe of your own.

Recipes
=======

***default***

Performs an attribute-driven install of the app.

Attributes
==========

***default***

A beta attribute can be overridden to install the beta of Microsoft Remote
Desktop from HockeyApp instead of the normal one from the Mac App Store.

Resources
=========

***microsoft_remote_desktop***

A wrapper for the other resources.

Syntax:

    microsoft_remote_desktop 'default' do
      beta false
      action :install
    end

Actions:

| Action     | Description       |
|------------|-------------------|
| `:install` | Install the app   |
| `:remove`  | Uninstall the app |

Attributes:

| Attribute | Default    | Description                         |
|-----------|------------|-------------------------------------|
| beta      | `nil`      | Optionally install the beta version |
| action    | `:install` | Action(s) to perform                |


***microsoft_remote_desktop_app***

Used to perform installation of the regular release of the app.

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

***microsoft_remote_desktop_app_beta***

Used to perform installation of beta version of the app from HockeyApp.

Syntax:

    microsoft_remote_desktop_app_beta 'default' do
        action :install
    end

Actions:

| Action     | Description       |
|------------|-------------------|
| `:install` | Install the app   |
| `:remove`  | Uninstall the app |

Attributes:

| Attribute  | Default        | Description          |
|------------|----------------|----------------------|
| action     | `:install`     | Action(s) to perform |

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
