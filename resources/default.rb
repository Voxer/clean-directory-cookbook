#
# Cookbook Name:: clean-directory
# Resource:: default
#
# Author:: Dave Eddy <dave@daveeddy.com>
# Copyright:: Copyright (c) 2007-2014, Voxer LLC
# License:: MIT
#

actions        :clean
default_action :clean

attribute :name,  :name_attribute => true
attribute :path,  :kind_of => String
attribute :types, :kind_of => Array, :default => [
  Chef::Resource::File,
  Chef::Resource::Link,
  Chef::Resource::CookbookFile,
  Chef::Resource::RemoteFile,
  Chef::Resource::Template,
]
