# Cookbook Name:: x2go
# Recipe:: server
#
# Copyright 2013, Arnold Krille for bcs kommunikationsloesungen
#                 <a.krille@b-c-s.de>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe('x2go::common')

packages = [
  'x2goserver',
  'x2goserver-xsession',
  'x2godesktopsharing',
  'x2goserver-fmbindings',
  'x2goserver-extensions',
  'pinentry-x2go',
  'plasma-widget-x2go'
]

packages.each do |p|
  package p do
    action :install
  end
end

group 'fuse' do
  action :manage
  append true
  members node[:x2go][:server][:fuse_users]
end
